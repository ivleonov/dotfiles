local nmap = function(keys, func, desc)
  if desc then
    desc = "Telescope: " .. desc
  end

  vim.keymap.set("n", keys, func, { desc = desc })
end

local builtin = require("telescope.builtin")

nmap("<leader>gf", builtin.git_files, "Search [G]it [F]iles")
 -- More familiar alias to previous action ^ (temporary measure)
nmap("<leader>p", builtin.git_files, "Search [G]it [F]iles")
nmap("<leader>sf", builtin.find_files, "[S]earch [F]iles")
nmap("<leader>sh", builtin.help_tags, "[S]earch [H]elp")
nmap("<leader>sw", builtin.grep_string, "[S]earch current [W]ord")
nmap("<leader>sg", builtin.live_grep, "[S]earch by [G]rep")
nmap("<leader>sd", builtin.diagnostics, "[S]earch [D]iagnostics")
nmap("<leader>sr", builtin.resume, "[S]earch [R]esume")
nmap("<leader>sb", builtin.buffers, "[S]earch existing [B]uffers")
nmap("<leader>sj", builtin.jumplist, "[S]earch in [J]umplist")
nmap("<leader>?", builtin.oldfiles, "[?] Find recently opened files")
nmap("<leader>/", builtin.current_buffer_fuzzy_find, "[/] Fuzzily search in current buffer")

-- Enable telescope fzf native, if installed
pcall(require("telescope").load_extension, "fzf")
