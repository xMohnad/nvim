-- https://github.com/x0d7x/dot/blob/master/nvim/.config/nvim/lua/config/autocmds.lua

local api = vim.api
local opt = vim.opt
local autocmd = api.nvim_create_autocmd

local function augroup(name)
  return api.nvim_create_augroup("custom_" .. name, { clear = true })
end

autocmd({ "RecordingEnter", "RecordingLeave" }, {
  group = augroup("recording"),
  callback = function(event)
    if event.event == "RecordingEnter" then
      local reg = vim.fn.reg_recording()
      if reg ~= "" then
        vim.notify("🔴 Recording macro @" .. reg, vim.log.levels.INFO, { title = "Macro" })
      end
    elseif event.event == "RecordingLeave" then
      vim.notify("⏹️ Stopped recording macro", vim.log.levels.INFO, { title = "Macro" })
    end
  end,
  desc = "Notify when recording starts and stops",
})

---@type table<number, {token:lsp.ProgressToken, msg:string, done:boolean}[]>
local progress = vim.defaulttable()
autocmd("LspProgress", {
  ---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    local value = ev.data.params
        .value --[[@as {percentage?: number, title?: string, message?: string, kind: "begin" | "report" | "end"}]]
    if not client or type(value) ~= "table" then
      return
    end
    local p = progress[client.id]

    for i = 1, #p + 1 do
      if i == #p + 1 or p[i].token == ev.data.params.token then
        p[i] = {
          token = ev.data.params.token,
          msg = ("[%3d%%] %s%s"):format(
            value.kind == "end" and 100 or value.percentage or 100,
            value.title or "",
            value.message and (" **%s**"):format(value.message) or ""
          ),
          done = value.kind == "end",
        }
        break
      end
    end

    local msg = {} ---@type string[]
    progress[client.id] = vim.tbl_filter(function(v)
      return table.insert(msg, v.msg) or not v.done
    end, p)

    local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
    vim.notify(table.concat(msg, "\n"), vim.log.levels.INFO, {
      id = "lsp_progress",
      title = client.name,
      opts = function(notif)
        notif.icon = #progress[client.id] == 0 and " "
            or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
      end,
    })
  end,
})

autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.txt", "*.md", "*.tex" },
  desc = "Enable spell checking",
  group = augroup("enable_spell"),
  callback = function()
    opt.spell = true
    opt.spelllang = { "en" }
  end,
})

-- ========== LSP Attach Keymaps ========== --

autocmd("LspAttach", {
  group = augroup("lsp_keymaps"),
  callback = function(event)
    local buf = event.buf
    local map = function(mode, keys, func, desc)
      vim.keymap.set(mode, keys, func, { buffer = buf, desc = "LSP: " .. desc })
    end

    map("n", "<leader>lf", function()
      vim.lsp.buf.format({ async = true })
    end, "Format File")
  end,
})

-- inline_hints
autocmd("LspAttach", {
  group = augroup("lsp_inlay_hints"),
  callback = function(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    if
        client
        and (client.server_capabilities.inlayHintProvider or client:supports_method("textDocument/inlayHint"))
    then
      vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
    end
  end,
})
