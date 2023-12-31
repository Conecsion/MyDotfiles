-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- Options
lvim.format_on_save = true
lvim.builtin.nvimtree.active = false -- Use neo-tree instead of nvim-tree
-- lvim.builtin.treesitter.matchup.enable = true
lvim.transparent_window = false

-- vim.opt.textwidth = 80

-- lvim.builtin.cmp.formatting.max_width = 80





lvim.builtin.which_key.mappings["1"] = { "<Cmd>BufferLineGoToBuffer 1<CR>", "Go to buffer 1" }
lvim.builtin.which_key.mappings["2"] = { "<Cmd>BufferLineGoToBuffer 2<CR>", "Go to buffer 2" }
lvim.builtin.which_key.mappings["3"] = { "<Cmd>BufferLineGoToBuffer 3<CR>", "Go to buffer 3" }
lvim.builtin.which_key.mappings["4"] = { "<Cmd>BufferLineGoToBuffer 4<CR>", "Go to buffer 4" }
lvim.builtin.which_key.mappings["5"] = { "<Cmd>BufferLineGoToBuffer 5<CR>", "Go to buffer 5" }
lvim.builtin.which_key.mappings["6"] = { "<Cmd>BufferLineGoToBuffer 6<CR>", "Go to buffer 6" }
lvim.builtin.which_key.mappings["7"] = { "<Cmd>BufferLineGoToBuffer 7<CR>", "Go to buffer 7" }
lvim.builtin.which_key.mappings["8"] = { "<Cmd>BufferLineGoToBuffer 8<CR>", "Go to buffer 8" }
lvim.builtin.which_key.mappings["9"] = { "<Cmd>BufferLineGoToBuffer 9<CR>", "Go to buffer 9" }
lvim.builtin.which_key.mappings["0"] = { "<Cmd>BufferLineGoToBuffer 10<CR>", "Go to buffer 10" }
lvim.builtin.which_key.mappings["e"] = {}


lvim.builtin.terminal.open_mapping = "<c-t>"

-- Centers cursor when moving
lvim.keys.normal_mode["<C-d>"] = "<C-d>zz"
lvim.keys.normal_mode["<C-u>"] = "<C-u>zz"


-- Plugins keymapping
-- Hop easymotion
lvim.builtin.which_key.mappings["j"] = {
  name = "Easy Motion",
  w = { "<cmd>HopWord<cr>", "EasyMotion by Word" },
  a = { "<cmd>HopAnywhere<cr>", "EasyMotion Anywhere" },
  l = { "<cmd>HopVertical<cr>", "EasyMotion Vertical" },
}

-- NeoTree
lvim.keys.normal_mode["<F3>"] = "<Cmd>NeoTreeFocusToggle<CR>"
lvim.keys.normal_mode["<F4>"] = "<Cmd>NeoTreeFloatToggle<CR>"

-- Symbols Outline
lvim.keys.normal_mode["<F2>"] = "<Cmd>SymbolsOutline<CR>"


-- Custom Plugins
lvim.plugins = {
  {
    -- Easy Motion Hop
    "phaazon/hop.nvim",
    event = "BufRead",
    branch = 'v2',
    config = function()
      require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  },


  -- neoscroll.nvim for smooth scrolling
  {
    "karb94/neoscroll.nvim",
    -- event = "WinScrolled",
    config = function()
      require('neoscroll').setup({
        mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>',
          '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
        hide_cursor = true,          -- Hide cursor while scrolling
        stop_eof = true,             -- Stop at <EOF> when scrolling downwards
        use_local_scrolloff = false,
        respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
        easing_function = nil,       -- Default easing function
        pre_hook = nil,              -- Function to run before the scrolling animation starts
        post_hook = nil,             -- Function to run after the scrolling animation ends
        performance_mode = false,    -- Disable "Performance Mode" on all buffers.
      })
    end
  },

  -- Scroll Bar
  {
    "petertriho/nvim-scrollbar",
    config = function()
      require("scrollbar").setup()
    end
  },

  {
    "kevinhwang91/nvim-hlslens",
    config = function()
      -- require('hlslens').setup() is not required
      require("scrollbar.handlers.search").setup({
        -- hlslens config overrides
      })
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require('gitsigns').setup()
      require("scrollbar.handlers.gitsigns").setup()
    end
  },

  -- Better Folding
  {
    'kevinhwang91/nvim-ufo',
    dependencies = 'kevinhwang91/promise-async',
    config = function()
      require('ufo').setup({
        provider_selector = function(bufnr, filetype, buftype)
          return { 'treesitter', 'indent' }
        end
      })
    end
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        close_if_last_window = true,
        popup_border_style = "rounded",
        enbale_git_status = true,
        enable_diagnostics = true,
        window = {
          width = 30,
          mappings = {
            ["h"] = "navigate_up",
            ["o"] = "open",
            ["l"] = "open",
          }
        },
        buffers = {
          follow_current_file = true,
        },
        filesystem = {
          follow_current_file = true,
          filtered_items = {
            hide_dotfiles = true,
            hide_gitignored = false,
            hide_by_name = {
              "node_modules"
            },
            never_show = {
              ".DS_Store",
              "thumbs.db"
            },
          },
        },
      })
    end
  },

  -- {
  --   "andymass/vim-matchup",
  --   config = function()
  --     vim.g.matchup_matchparen_offscreen = { method = "popup" }
  --   end,
  -- },

  {
    "folke/lsp-colors.nvim",
    event = "BufRead",
  },

  {
    "metakirby5/codi.vim",
    cmd = "Codi",
  },

  {
    "rmagatti/goto-preview",
    config = function()
      require('goto-preview').setup {
        width = 120,             -- Width of the floating window
        height = 25,             -- Height of the floating window
        default_mappings = true, -- Bind default mappings
        debug = false,           -- Print debug information
        opacity = nil,           -- 0-100 opacity level of the floating window where 100 is fully transparent.
        post_open_hook = nil,    -- A function taking two arguments, a buffer and a window to be ran as a hook.
        -- You can use "default_mappings = true" setup option
        -- Or explicitly set keybindings
        -- vim.cmd("nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>")
        -- vim.cmd("nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>")
        -- vim.cmd("nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>")
      }
    end
  },

  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end,
  },


  {
    "ethanholz/nvim-lastplace",
    event = "BufRead",
    config = function()
      require("nvim-lastplace").setup({
        lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
        lastplace_ignore_filetype = {
          "gitcommit", "gitrebase", "svn", "hgcommit",
        },
        lastplace_open_folds = true,
      })
    end,
  },

  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require "lsp_signature".on_attach() end,
  },

  {
    "simrat39/symbols-outline.nvim",
    config = function()
      require('symbols-outline').setup()
    end
  },



}
