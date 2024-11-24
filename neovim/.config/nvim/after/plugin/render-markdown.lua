local render_markdown = require("render-markdown")

render_markdown.setup({
  -- Disable by default to prevent jumping between different views.
  -- The idea is to use render for quick preview on demand
  enabled = false,
  heading = {
    -- Turn on / off heading icon & background rendering
    enabled = false,
  },
  code = {
    -- Turn on / off code block & inline code rendering
    enabled = true,
  },
})

vim.keymap.set("n", "<leader>r", render_markdown.toggle, { noremap = true, silent = true, desc = "Toggle Render Markdown" })
