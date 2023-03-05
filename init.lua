--              AstroNvim Configuration Table
-- All configuration changes should go inside of the table below

-- A split up user configuration example can be found at: https://github.com/AstroNvim/split_user_example

-- You can think of a Lua "table" as a dictionary like data structure the
-- normal format is "key = value". These also handle array like data structures
-- where a value with no key simply has an implicit numeric key
local config = {
  -- Configure AstroNvim updates
  updater = { channel = "nightly", skip_prompts = true },
  -- Set colorscheme to use
  colorscheme = "everforest",
  -- Add highlight groups in any theme
  highlights = {
    -- init = { -- this table overrides highlights in all themes
    --   Normal = { bg = "#000000" },
    -- }
    -- duskfox = { -- a table of overrides/changes to the duskfox theme
    --   Normal = { bg = "#000000" },
    -- },
  },
  -- set vim options here (vim.<first_key>.<second_key> = value)
  options = {
    opt = {
      -- set to true or false etc.
      relativenumber = true, -- sets vim.opt.relativenumber
      number = true, -- sets vim.opt.number
      spell = false, -- sets vim.opt.spell
      signcolumn = "auto", -- sets vim.opt.signcolumn to auto
      wrap = false, -- sets vim.opt.wrap
    },
    g = {
      mapleader = " ", -- sets vim.g.mapleader
      autoformat_enabled = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
      cmp_enabled = true, -- enable completion at start
      autopairs_enabled = true, -- enable autopairs at start
      diagnostics_enabled = true, -- enable diagnostics at start
      status_diagnostics_enabled = true, -- enable diagnostics in statusline
      icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
      ui_notifications_enabled = true, -- disable notifications when toggling UI elements
    },
  },
  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
  },
  -- Extend LSP configuration
  lsp = {
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
      "eslint",
    },
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = true, -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- "sumneko_lua",
      },
      timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- easily add or disable built in mappings added during LSP attaching
    mappings = {
      n = {
        -- ["<leader>lf"] = false -- disable formatting keymap
      },
    },
    -- add to the global LSP on_attach function
    -- on_attach = function(client, bufnr)
    --   vim.api.nvim_create_autocmd("BufWritePre", {
    --     buffer = bufnr,
    --     command = "eslintFixAll",
    --   })
    -- end,

    -- override the LSP setup handler function based on server name
    -- setup_handlers = {
    --   -- first function changes the default setup handler
    --   function(server, opts) require("lspconfig")[server].setup(opts) end,
    --   -- keys for a specific server name will be used for that LSP
    --   sumneko_lua = function(server, opts)
    --     -- custom sumneko_lua setup handler
    --     require("lspconfig")["sumneko_lua"].setup(opts)
    --   end,
    -- },

    -- Add overrides for LSP server settings, the keys are the name of the server
    config = {},
  },
  mappings = {
    n = {
      ["<M-o>"] = { "o<ESC>" },
      ["<M-O>"] = { "O<ESC>" },

      ["<C-d>"] = { "<C-d>zz" },
      ["<C-u>"] = { "<C-u>zz" },
      -- second key is the lefthand side of the map
      -- mappings seen under group name "Buffer"
      ["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
      ["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
      ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
      ["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },
      -- tables with the `name` key will be registered with which-key if it's installed
      -- this is useful for naming menus
      ["<leader>b"] = { name = "Buffers" },
      -- go-to-definition in a new split
      ["gd"] = { "<cmd>lua vim.lsp.buf.definition()<cr>", desc = "go-to-definition" },
      ["gv"] = { ":vsplit<CR>gd", desc = "go-to-definition-split" },
      -- quick save
      ["<C-s>"] = { ":w!<cr>", desc = "Save File" }, -- change description but the same command
      ["<C-Left>"] = { function() require("smart-splits").move_cursor_left() end, desc = "Move to left split" },
      ["<C-Down>"] = { function() require("smart-splits").move_cursor_down() end, desc = "Move to below split" },
      ["<C-Up>"] = { function() require("smart-splits").move_cursor_up() end, desc = "Move to above split" },
      ["<C-Right>"] = { function() require("smart-splits").move_cursor_right() end, desc = "Move to right split" },
      ["<C-h>"] = { function() require("smart-splits").resize_left() end, desc = "Resize split left" },
      ["<C-l>"] = { function() require("smart-splits").resize_right() end, desc = "Resize split right" },
      ["<C-j>"] = { function() require("smart-splits").resize_down() end, desc = "Resize split down" },
      ["<C-k>"] = { function() require("smart-splits").resize_up() end, desc = "Resize split up" },
    },
    t = {
      -- setting a mapping to false will disable it
      -- ["<esc>"] = false,
    },
    v = {},
  },
  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin", "matchparen" },
      },
    },
  },
  -- Configure plugins
  plugins = {
    { "neanias/everforest-nvim" },
    "AstroNvim/astrocommunity",
    { import = "astrocommunity.colorscheme.rose-pine" },
    { import = "astrocommunity.colorscheme.catppuccin",      enabled = true },
    { import = "astrocommunity.completion.copilot-lua" },
    { import = "astrocommunity.completion.copilot-lua-cmp" },
    { import = "astrocommunity.indent.indent-blankline-nvim" },
    { import = "astrocommunity.indent.mini-indentscope" },
    { import = "astrocommunity.motion.mini-move" },
    { import = "astrocommunity.diagnostics.trouble-nvim" },
    {
      "mini.move",
      keys = {
        { "<A-Right>", mode = { "n", "v" } },
        { "<A-Up>",    mode = { "n", "v" } },
        { "<A-Down>",  mode = { "n", "v" } },
        { "<A-Left>",  mode = { "n", "v" } },
      },
      opts = {
        mappings = {
          left = "<A-Left>",
          right = "<A-Right>",
          down = "<A-Down>",
          up = "<A-Up>",
          line_left = "<A-Left>",
          line_right = "<A-Right>",
          line_down = "<A-Down>",
          line_up = "<A-Up>",
        },
      },
    },
    { import = "astrocommunity.motion.mini-bracketed" },
    { import = "astrocommunity.motion.mini-surround" },
    { import = "astrocommunity.motion.mini-ai" },
    {
      "mini.ai",
      keys = {
        { "a", mode = { "x", "o" } },
        { "i", mode = { "x", "o" } },
      },
      opts = function()
        local ai = require "mini.ai"
        return {
          n_lines = 500,
          custom_textobjects = {
            o = ai.gen_spec.treesitter({
              a = { "@block.outer", "@conditional.outer", "@loop.outer" },
              i = { "@block.inner", "@conditional.inner", "@loop.inner" },
            }, {}),
            f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
            c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }, {}),
          },
        }
      end,
      config = function(_, opts)
        local ai = require "mini.ai"
        ai.setup(opts)
      end,
    },
    { import = "astrocommunity.pack.typescript" },
    { import = "astrocommunity.pack.python" },
    { import = "astrocommunity.editing-support.zen-mode-nvim" },
    { import = "astrocommunity.comment.mini-comment" },
    { import = "astrocommunity.utility.noice-nvim" },
    {
      "noice.nvim",
      opts = {
        presets = { lsp_doc_border = true },
        lsp = {
          progress = {
            enabled = false,
          },
        },
        routes = {
          {
            filter = {
              event = "msg_show",
              kind = "",
              find = "written",
            },
            opts = { skip = true },
          },
        },
      },
    }, -- good vertical motions
    {
      "ggandor/leap.nvim",
      event = "VeryLazy",
      config = function(_, _)
        local leap = require "leap"
        leap.add_default_mappings(true)
      end,
    },
    -- "multi select"
    { "mg979/vim-visual-multi", branch = "master", event = "BufRead" },
    -- more dot repeat actions
    { "tpope/vim-repeat" },
    -- jump between more things with %
    { "andymass/vim-matchup" },
    -- dedicated git diff viewer
    {
      "sindrets/diffview.nvim",
      event = "BufRead",
    },
    -- stop d and c from yanking to a register
    {
      "gbprod/cutlass.nvim",
      keys = {
        "x",
        "d",
        "c",
        "X",
        "D",
        "C",
        "m",
      },
      config = function()
        require("cutlass").setup {
          exclude = { "ns", "nS" },
          cut_key = "<leader>x",
        }
      end,
    },
    -- Show environment and hidden files in neotree
    {
      "nvim-neo-tree/neo-tree.nvim",
      opts = {
        close_if_last_window = false,
        filesystem = {
          filtered_items = {
            visible = true,
            hide_dotfiles = false,
            hide_gitignored = false,
          },
          hide_by_name = {
            "node_modules",
            ".git",
          },
          never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
            ".DS_Store",
          },
        },
      },
    },
    -- add telescope-fzf-native
    {
      "telescope.nvim",
      dependencies = {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        config = function() require("telescope").load_extension "fzf" end,
      },
    },
    -- null-ls for formatting and linting
    {
      "jose-elias-alvarez/null-ls.nvim",
      opts = function(_, config)
        -- config variable is the default configuration table for the setup function call
        local null_ls = require "null-ls"

        config.sources = {
          null_ls.builtins.formatting.prettierd,
          require "typescript.extensions.null-ls.code-actions",
        }
        return config -- return final config table
      end,
    },
    -- ensure installed and keybindings for treesitter
    {
      "nvim-treesitter/nvim-treesitter",
      opts = {
        ensure_installed = {
          "bash",
          "help",
          "html",
          "javascript",
          "json",
          "lua",
          "markdown",
          "markdown_inline",
          "python",
          "query",
          "regex",
          "tsx",
          "typescript",
          "vim",
          "yaml",
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = "<nop>",
            node_decremental = "<bs>",
          },
        },
      },
    },
  },
}

return config
