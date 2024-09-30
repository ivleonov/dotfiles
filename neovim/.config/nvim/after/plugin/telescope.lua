require("telescope").setup({
  defaults = {
    mappings = {
      n = {
        -- Deleting buffer when in buffer explorer
        -- Not sure about ergonomic of this one yet
        ["d"] = require("telescope.actions").delete_buffer,
        -- Quite telescope with "q"
        ["q"] = require("telescope.actions").close,
      },
      i = {
        ["<C-j>"] = require("telescope.actions").move_selection_next,
        ["<C-k>"] = require("telescope.actions").move_selection_previous,
      },
    }
  }
})

local nmap = function(keys, func, desc)
  if desc then
    desc = "Telescope: " .. desc
  end

  vim.keymap.set("n", keys, func, { desc = desc })
end

-- Taken from https://github.com/nvim-telescope/telescope.nvim/issues/1080#issuecomment-1592392087
local current_buffer_fuzzy_find = function()
  require("telescope.builtin").current_buffer_fuzzy_find({
    tiebreak = function(entry1, entry2, prompt)
      local start_pos1, _ = entry1.ordinal:find(prompt)
      if start_pos1 then
        local start_pos2, _ = entry2.ordinal:find(prompt)
        if start_pos2 then
          return start_pos1 > start_pos2
        end
      end
      return false
    end,
    additional_args = { "--ignore-case", "--pcre2" },
  })
end

local search_in_obsidian = function()
  require("telescope.builtin").find_files({cwd="$SECOND_BRAIN_DIR"})
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
nmap("<leader>so", search_in_obsidian, "[S]earch in [O]bsidian")
nmap("<leader>?", builtin.oldfiles, "[?] Find recently opened files")
nmap("<leader>/", current_buffer_fuzzy_find, "[/] Fuzzily search in current buffer")

local buffers = function()
  builtin.buffers(
    {
      -- start with normal mode, as it looks reasonable
      -- flow not to start fzf, but navigate through buffers
      initial_mode = "normal",
      sort_mru = true, -- Sort by most recently used
    }
  )
end

-- This is not usual keybinding (usually it would be leader + b for [b]uffers),
-- but it doesn't feel ergonomic enough, so experimenting with alternative.
nmap("<leader>j", buffers, "Telescope Buffers")

-- Enable telescope fzf native, if installed
pcall(require("telescope").load_extension, "fzf")
