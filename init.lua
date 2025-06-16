-- Set <space> as the leader key
-- See `:help mapleader`hover
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = false

-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 4

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = 'unnamedplus'

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
--vim.opt.list = true
--vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- custom keybinds
vim.keymap.set('n', '<leader>vs', '<cmd>vs<CR>')
vim.keymap.set('n', '<leader>hs', '<cmd>sp<CR>')
vim.keymap.set('n', '<leader>ut', vim.cmd.UndotreeToggle)
vim.keymap.set('n', '<C-n>', '<cmd>set invrelativenumber<CR>', { noremap = true, silent = true })
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- the next two keybinds allows movement of highlighted text

-- put next line on same line as your cursor
-- but keep cursor in place (i think)
vim.keymap.set('n', 'J', 'mzJ`z')

-- keep cursor in middle with C-d and C-u
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- need to check on these
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'nzzzv')

-- paste from system clipboard
vim.keymap.set('x', '<leader>p', '"_dP')

-- copy to system clipboard
-- not sure what the difference between +y and +Y is.
vim.keymap.set('n', '<leader>y', '"+y', { desc = 'Copy To System Clipboard' })
vim.keymap.set('v', '<leader>y', '"+y', { desc = 'Copy To System Clipboard' })
vim.keymap.set('n', '<leader>Y', '"+Y', { desc = 'Copy To System Clipboard' })

-- open vimrc
vim.keymap.set('n', '<leader>rc', '<cmd>edit $MYVIMRC<CR>', { desc = 'Edit vimrc' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.keymap.set('n', '<leader>tt', '<cmd>terminal<CR>', { desc = 'Open Terminal' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd('TermOpen', {
  desc = 'Disable line numbers in terminal mode',
  group = vim.api.nvim_create_augroup('terminal', { clear = true }),
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
  end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require('lazy').setup({
  -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
  --'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  -- NOTE: Plugins can also be added by using a table,
  -- with the first argument being the link and the following
  -- keys can be used to configure plugin behavior/loading/etc.
  --
  -- Use `opts = {}` to force a plugin to be loaded.
  --
  --  This is equivalent to:
  --    require('Comment').setup({})
  {
    'mbbill/undotree',
  },
  {
    'tjdevries/colorbuddy.nvim',
    config = function()
      vim.cmd.colorscheme 'darker'
    end,
  },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },
  --{ 'nvim-tree/nvim-tree.lua' },
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = '3.2',
    dependencies = {
      'nvim-lua/plenary.nvim',
      --'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
    config = function()
      vim.keymap.set('n', '<leader>nt', '<Cmd>Neotree toggle<CR>')

      require('neo-tree').setup {
        default_component_configs = {
          icon = {
            folder_closed = '+',
            folder_open = '-',
            folder_empty = '%',
            default = '',
          },
          git_status = {
            symbols = {
              deleted = '',
              renamed = '',
              modified = '',
              untracked = '',
              ignored = '',
              unstaged = '',
              staged = '',
              conflict = '',
            },
          },
        },
        filesystem = {
          follow_current_file = { enabled = true },
          filtered_items = {
            visible = true,
            hide_dotfiles = false,
            hide_gitignored = false,
          },
          buffers = {
            follow_current_file = true,
          },
          components = {
            icon = function(config, node, state)
              if node.type == 'file' then
                return {
                  text = '* ',
                  highlight = config.highlight,
                }
              end
              return require('neo-tree.sources.common.components').icon(config, node, state)
            end,
          },
        },
      }
    end,
  },

  -- Here is a more advanced example where we pass configuration
  -- options to `gitsigns.nvim`. This is equivalent to the following Lua:
  --    require('gitsigns').setup({ ... })
  --
  -- See `:help gitsigns` to understand what the configuration keys do
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  -- NOTE: Plugins can also be configured to run Lua code when they are loaded.
  --
  -- This is often very useful to both group configuration, as well as handle
  -- lazy loading plugins that don't need to be loaded immediately at startup.
  --
  -- For example, in the following configuration, we use:
  --  event = 'VimEnter'
  --
  -- which loads which-key before all the UI elements are loaded. Events can be
  -- normal autocommands events (`:help autocmd-events`).
  --
  -- Then, because we use the `config` key, the configuration only runs
  -- after the plugin has been loaded:
  --  config = function() ... end

  --    { -- Useful plugin to show you pending keybinds.
  --      'folke/which-key.nvim',
  --      event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  --      config = function() -- This is the function that runs, AFTER loading
  --        require('which-key').setup()
  --        --{"<leader>c", group = "[C]ode},
  --        -- Document existing key chains
  --        require('which-key').register {
  --          { '<leader>c', group = '[C]ode' },
  --          { '<leader>c_', hidden = true },
  --          { '<leader>d', group = '[D]ocument' },
  --          { '<leader>d_', hidden = true },
  --          { '<leader>r', group = '[R]ename' },
  --          { '<leader>r_', hidden = true },
  --          { '<leader>s', group = '[S]earch' },
  --          { '<leader>s_', hidden = true },
  --          { '<leader>w', group = '[W]orkspace' },
  --          { '<leader>w_', hidden = true },
  --          { '<leader>t', group = '[T]oggle' },
  --          { '<leader>t_', hidden = true },
  --          { '<leader>h', group = 'Git [H]unk' },
  --          { '<leader>h_', hidden = true },
  --
  --        -- ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
  --        -- ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
  --        -- ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
  --        -- ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
  --        -- ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
  --        -- ['<leader>t'] = { name = '[T]oggle', _ = 'which_key_ignore' },
  --        -- ['<leader>h'] = { name = 'Git [H]unk', _ = 'which_key_ignore' },
  --        }
  --        -- visual mode
  --        require('which-key').register {
  --          { '<leader>h', desc = 'Git [H]unk', mode = 'v' },
  --        }
  --      end,
  --    },

  -- NOTE: Plugins can specify dependencies.
  --
  -- The dependencies are proper plugin specifications as well - anything
  -- you do for a plugin at the top level, you can do for a dependency.
  --
  -- Use the `dependencies` key to specify the dependencies of a particular plugin

  { -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { -- If encountering errors, see telescope-fzf-native README for installation instructions
        'nvim-telescope/telescope-fzf-native.nvim',

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = 'make',

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },

      -- Useful for getting pretty icons, but requires a Nerd Font.
      --{ 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
      -- Telescope is a fuzzy finder that comes with a lot of different things that
      -- it can fuzzy find! It's more than just a "file finder", it can search
      -- many different aspects of Neovim, your workspace, LSP, and more!
      --
      -- The easiest way to use Telescope, is to start by doing something like:
      --  :Telescope help_tags
      --
      -- After running this command, a window will open up and you're able to
      -- type in the prompt window. You'll see a list of `help_tags` options and
      -- a corresponding preview of the help.
      --
      -- Two important keymaps to use while in Telescope are:
      --  - Insert mode: <c-/>
      --  - Normal mode: ?
      --
      -- This opens a window that shows you all of the keymaps for the current
      -- Telescope picker. This is really useful to discover what Telescope can
      -- do as well as how to actually do it!

      -- [[ Configure Telescope ]]
      -- See `:help telescope` and `:help telescope.setup()`
      require('telescope').setup {
        -- You can put your default mappings / updates / etc. in here
        --  All the info you're looking for is in `:help telescope.setup()`
        --
        defaults = {
          mappings = {
            i = { ['<c-enter>'] = 'to_fuzzy_refine' },
          },
        },
        extensions = {
          fzf = {},
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      }

      -- Enable Telescope extensions if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

      -- See `:help telescope.builtin`
      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })

      vim.keymap.set('n', '<leader>sw', function()
        builtin.grep_string(require('telescope.themes').get_ivy {
          layout_config = { height = 0.5 },
        })
      end, { desc = '[S]earch current [W]ord' })

      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
      vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
      vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
      vim.keymap.set('n', '<leader>gc', builtin.git_commits, { desc = '[G]it [C]ommits' })
      vim.keymap.set('n', '<leader>gs', builtin.git_status, { desc = '[G]it [S]tatus' })

      vim.keymap.set('n', '<leader>sg', function()
        builtin.live_grep(require('telescope.themes').get_ivy {
          winblend = 20,
          layout_config = {
            width = 0.99,
          },
        })
      end, { desc = '[S]earch by [G]rep' })

      -- Slightly advanced example of overriding default behavior and theme
      vim.keymap.set('n', '<leader>/', function()
        -- You can pass additional configuration to Telescope to change the theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_cursor {
          winblend = 10,
          previewer = false,
          layout_config = { height = 0.25 },
          prompt_title = 'Find in File',
        })
      end, { desc = '[/] Fuzzily search in current buffer' })

      -- It's also possible to pass additional configuration options.
      --  See `:help telescope.builtin.live_grep()` for information about particular keys
      vim.keymap.set('n', '<leader>s/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = '[S]earch [/] in Open Files' })

      -- Shortcut for searching your Neovim configuration files
      vim.keymap.set('n', '<leader>sn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[S]earch [N]eovim files' })
    end,
  },
  {
    'wojciech-kulik/xcodebuild.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim',
      'MunifTanjim/nui.nvim',
    },
    config = function()
      require('xcodebuild').setup {
        code_coverage = {
          enabled = true,
        },
      }

      vim.keymap.set('n', '<leader>xl', '<cmd>XcodebuildToggleLogs<cr>', { desc = 'Toggle Xcodebuild Logs' })
      vim.keymap.set('n', '<leader>xb', '<cmd>XcodebuildBuild<cr>', { desc = 'Build Project' })
      vim.keymap.set('n', '<leader>xt', '<cmd>XcodebuildTest<cr>', { desc = 'Run Tests' })
      vim.keymap.set('n', '<leader>xT', '<cmd>XcodebuildTestClass<cr>', { desc = 'Run This Test Class' })
      vim.keymap.set('n', '<leader>X', '<cmd>XcodebuildPicker<cr>', { desc = 'Show All Xcodebuild Actions' })
      vim.keymap.set('n', '<leader>xd', '<cmd>XcodebuildSelectDevice<cr>', { desc = 'Select Device' })
      vim.keymap.set('n', '<leader>xp', '<cmd>XcodebuildSelectTestPlan<cr>', { desc = 'Select Test Plan' })
      vim.keymap.set('n', '<leader>xc', '<cmd>XcodebuildToggleCodeCoverage<cr>', { desc = 'Toggle Code Coverage' })
      vim.keymap.set('n', '<leader>xC', '<cmd>XcodebuildShowCodeCoverageReport<cr>', { desc = 'Show Code Coverage Report' })
      vim.keymap.set('n', '<leader>xq', '<cmd>Telescope quickfix<cr>', { desc = 'Show QuickFix List' })
      vim.keymap.set('n', '<leader>te', '<cmd>XcodebuildTestExplorerToggle<cr>', { desc = 'Toggle Test Explorer' })
    end,
  },
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'wojciech-kulik/xcodebuild.nvim',
    },
    config = function()
      local dap = require 'dap'
      local xcodebuild = require 'xcodebuild.integrations.dap'
      local codelldbPath = '/Users/drewjohnson/.local/extension/adapter/codelldb'
      local dotnetDebuggerPath = '/usr/local/bin/netcoredbg/netcoredbg'

      xcodebuild.setup(codelldbPath)

      dap.adapters.coreclr = {
        type = 'executable',
        command = dotnetDebuggerPath,
        args = { '--interpreter=vscode' },
      }

      dap.configurations.cs = {
        {
          type = 'coreclr',
          name = 'launch - netcoredbg',
          request = 'launch',
        },
      }

      vim.keymap.set('n', '<leader>dr', xcodebuild.debug_without_build, { desc = 'Debug Without Building' })
      vim.keymap.set('n', '<leader>dt', xcodebuild.debug_tests, { desc = 'Debug Tests' })
      vim.keymap.set('n', '<leader>dT', xcodebuild.debug_class_tests, { desc = 'Debug Class Tests' })
      vim.keymap.set('n', '<leader>b', xcodebuild.toggle_breakpoint, { desc = 'Toggle Breakpoint' })
      vim.keymap.set('n', '<leader>B', xcodebuild.toggle_message_breakpoint, { desc = 'Toggle Message Breakpoint' })
      vim.keymap.set('n', '<leader>dx', xcodebuild.terminate_session, { desc = 'Terminate Debugger' })
      vim.keymap.set('n', '<F5>', function()
        require('dap').continue()
      end)
      vim.keymap.set('n', '<F10>', function()
        require('dap').step_over()
      end)
      vim.keymap.set('n', '<F11>', function()
        require('dap').step_into()
      end)
      vim.keymap.set('n', '<F12>', function()
        require('dap').step_out()
      end)

      vim.keymap.set('n', '<leader>df', function()
        local widgets = require 'dap.ui.widgets'
        widgets.centered_float(widgets.frames)
      end, { desc = 'Show Frames' })
      vim.keymap.set({ 'n', 'v' }, '<Leader>dp', function()
        require('dap.ui.widgets').preview().toggle()
      end, { desc = 'Show Preview' })
      vim.keymap.set('n', '<Leader>dc', function()
        local widgets = require 'dap.ui.widgets'
        widgets.centered_float(widgets.scopes)
      end, { desc = 'Show Scopes' })
    end,
  },
  {
    'rcarriga/nvim-dap-ui',
    dependencies = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' },
    lazy = true,
    config = function()
      require('dapui').setup {
        element_mappings = {},
        expand_lines = true,
        force_buffers = true,
        render = {
          indent = 1,
          max_value_lines = 100,
        },
        mappings = {
          edit = 'e',
          expand = { '<CR>', '<2-LeftMouse>' },
          open = 'o',
          remove = 'd',
          repl = 'r',
          toggle = 't',
        },
        controls = {
          element = 'repl',
          enabled = true,
          icons = {},
        },
        floating = {
          border = 'single',
          mappings = {
            close = { 'q', '<Esc>' },
          },
        },
        icons = { collapsed = '', expanded = '', current_frame = '' },
        layouts = {
          {
            elements = {
              --{ id = 'stacks', size = 0.25 },
              --{ id = 'scopes', size = 0.25 },
              --{ id = 'breakpoints', size = 0.25 },
              --{ id = 'watches', size = 0.25 },
              --{ id = 'repl', size = 0.50 },
            },
            position = 'left',
            size = 60,
          },
          {
            elements = {
              { id = 'console', size = 0.75 },
              { id = 'repl', size = 0.25 },
            },
            position = 'bottom',
            size = 30,
          },
        },
      }

      local dap, dapui = require 'dap', require 'dapui'

      -- vim.keymap.set('n', '<leader>co', function()
      --   local dapConsole = dapui.elements.console
      --   dapConsole.
      -- end, { desc = 'Dap Console' })
      vim.keymap.set('n', '<leader>du', function()
        dapui.toggle()
      end, { desc = 'Dap-UI Toggle' })

      dap.listeners.after.event_initialized['dapui_config'] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated['dapui_config'] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited['dapui_config'] = function()
        dapui.close()
      end
    end,
  },
  {
    'seblyng/roslyn.nvim',
    ft = 'cs',
    ---@module 'roslyn.config'
    ---@type RoslynNvimConfig
    opts = {
      -- your configuration comes here; leave empty for default settings
    },
  },
  {
    'iabdelkareem/csharp.nvim',
    dependencies = {
      'williamboman/mason.nvim', -- Required, automatically installs omnisharp
      'mfussenegger/nvim-dap',
      'Tastyep/structlog.nvim', -- Optional, but highly recommended for debugging
    },
    config = function()
      require('mason').setup() -- Mason setup must run before csharp, only if you want to use omnisharp
      require('csharp').setup {
        lsp = {
          -- Sets if you want to use omnisharp as your LSP
          omnisharp = {
            -- When set to false, csharp.nvim won't launch omnisharp automatically.
            enable = false,
            -- When set, csharp.nvim won't install omnisharp automatically. Instead, the omnisharp instance in the cmd_path will be used.
            cmd_path = nil,
            -- The default timeout when communicating with omnisharp
            default_timeout = 1000,
            -- Settings that'll be passed to the omnisharp server
            enable_editor_config_support = false,
            organize_imports = false,
            load_projects_on_demand = false,
            enable_analyzers_support = false,
            enable_import_completion = false,
            include_prerelease_sdks = false,
            analyze_open_documents_only = false,
            enable_package_auto_restore = false,
            -- Launches omnisharp in debug mode
            debug = false,
          },
          -- Sets if you want to use roslyn as your LSP
          roslyn = {
            -- When set to true, csharp.nvim will launch roslyn automatically.
            enable = true,
            -- Path to the roslyn LSP see 'Roslyn LSP Specific Prerequisites' above.
            cmd_path = nil,
          },
          -- The capabilities to pass to the omnisharp server
          capabilities = {},
          -- on_attach function that'll be called when the LSP is attached to a buffer
          on_attach = nil,
        },
        dap = {},
        logging = {},
      }
    end,
  },
  { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs and related tools to stdpath for Neovim
      { 'williamboman/mason.nvim', config = true }, -- NOTE: Must be loaded before dependants
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',

      -- Useful status updates for LSP.
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim', opts = {} },

      -- `neodev` configures Lua LSP for your Neovim config, runtime and plugins
      -- used for completion, annotations and signatures of Neovim apis
      { 'folke/neodev.nvim', opts = {} },
    },
    config = function()
      local lspconfig = require 'lspconfig'

      lspconfig.sourcekit.setup {
        capabilities = {
          workspace = {
            didChangeWatchedFiles = {
              dynamicRegistration = true,
            },
          },
        },
        on_init = function(client)
          client.offset_encoding = 'utf-8'
        end,
      }

      -- Brief aside: **What is LSP?**
      --
      -- LSP is an initialism you've probably heard, but might not understand what it is.
      --
      -- LSP stands for Language Server Protocol. It's a protocol that helps editors
      -- and language tooling communicate in a standardized fashion.
      --
      -- In general, you have a "server" which is some tool built to understand a particular
      -- language (such as `gopls`, `lua_ls`, `rust_analyzer`, etc.). These Language Servers
      -- (sometimes called LSP servers, but that's kind of like ATM Machine) are standalone
      -- processes that communicate with some "client" - in this case, Neovim!
      --
      -- LSP provides Neovim with features like:
      --  - Go to definition
      --  - Find references
      --  - Autocompletion
      --  - Symbol Search
      --  - and more!
      --
      -- Thus, Language Servers are external tools that must be installed separately from
      -- Neovim. This is where `mason` and related plugins come into play.
      --
      -- If you're wondering about lsp vs treesitter, you can check out the wonderfully
      -- and elegantly composed help section, `:help lsp-vs-treesitter`

      --  This function gets run when an LSP attaches to a particular buffer.
      --    That is to say, every time a new file is opened that is associated with
      --    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
      --    function will be executed to configure the current buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          -- NOTE: Remember that Lua is a real programming language, and as such it is possible
          -- to define small helper and utility functions so you don't have to repeat yourself.
          --
          -- In this case, we create a function that lets us more easily define mappings specific
          -- for LSP related items. It sets the mode, buffer and description for us each time.
          local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          if vim.bo[0].filetype == 'cs' then
            map('<leader>dd', require('csharp').debug_project, '[D]ebug Project')
            map('<leader>rr', require('csharp').run_project, '[R]un Project')
          elseif vim.bo[0].filetype == 'swift' then
            local xcodebuild = require 'xcodebuild.integrations.dap'

            map('<leader>rr', '<cmd>XcodebuildBuildRun<cr>', 'Build & Run Project')
            map('<leader>dd', xcodebuild.build_and_debug, 'Build & Debug')
          end

          local client = vim.lsp.get_client_by_id(event.data.client_id)

          if client.name == 'omnisharp' then
            client.server_capabilities.documentHighlightProvider = false
            client.server_capabilities.completionProvider = false
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.codeActionProvider = false
            client.server_capabilities.codeLensProvider = false
            client.server_capabilities.colorProvider = false
            client.capabilities.textDocument.publishDiagnostics = false
            client.capabilities.textDocument.hover = false
          end

          -- Jump to the definition of the word under your cursor.
          --  This is where a variable was first declared, or where a function is defined, etc.
          --  To jump back, press <C-t>.
          map('<leader>gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

          -- Find references for the word under your cursor.
          map('<leader>gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

          -- Jump to the implementation of the word under your cursor.
          --  Useful when your language has ways of declaring types without an actual implementation.
          map('<leader>gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

          -- Jump to the type of the word under your cursor.
          --  Useful when you're not sure what type a variable is and you want to see
          --  the definition of its *type*, not where it was *defined*.
          map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')

          -- Fuzzy find all the symbols in your current document.
          --  Symbols are things like variables, functions, types, etc.
          map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')

          -- Fuzzy find all the symbols in your current workspace.
          --  Similar to document symbols, except searches over your entire project.
          map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

          -- Rename the variable under your cursor.
          --  Most Language Servers support renaming across files, etc.
          map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

          -- Execute a code action, usually your cursor needs to be on top of an error
          -- or a suggestion from your LSP for this to activate.
          map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

          -- Opens a popup that displays documentation about the word under your cursor
          --  See `:help K` for why this keymap.
          map('K', vim.lsp.buf.hover, 'Hover Documentation')

          --vim.o.winborder = 'rounded'
          local hover = vim.lsp.buf.hover
          ---@diagnostic disable-next-line: duplicate-set-field
          vim.lsp.buf.hover = function()
            return hover {
              border = 'single',
              -- max_width = 100,
              max_width = math.floor(vim.o.columns * 0.7),
              max_height = math.floor(vim.o.lines * 0.7),
            }
          end
          vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' })

          -- WARN: This is not Goto Definition, this is Goto Declaration.
          --  For example, in C this would take you to the header.
          map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

          -- The following two autocommands are used to highlight references of the
          -- word under your cursor when your cursor rests there for a little while.
          --    See `:help CursorHold` for information about when this is executed
          --
          -- When you move your cursor, the highlights will be cleared (the second autocommand).
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.server_capabilities.documentHighlightProvider then
            local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd('LspDetach', {
              group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
              end,
            })
          end

          -- The following autocommand is used to enable inlay hints in your
          -- code, if the language server you are using supports them
          --
          -- This may be unwanted, since they displace some of your code
          if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
            map('<leader>th', function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
            end, '[T]oggle Inlay [H]ints')
          end
        end,
      })

      -- LSP servers and clients are able to communicate to each other what features they support.
      --  By default, Neovim doesn't support everything that is in the LSP specification.
      --  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
      --  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

      -- Enable the following language servers
      --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
      --
      --  Add any additional override configuration in the following tables. Available keys are:
      --  - cmd (table): Override the default command used to start the server
      --  - filetypes (table): Override the default list of associated filetypes for the server
      --  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
      --  - settings (table): Override the default settings passed when initializing the server.
      --        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
      local servers = {
        clangd = {
          init_options = { compilationDatabasePath = '.' },
        },
        roslyn = {},
        -- gopls = {},
        -- pyright = {},
        -- rust_analyzer = {},
        -- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
        --
        -- Some languages (like typescript) have entire language plugins that can be useful:
        --    https://github.com/pmizio/typescript-tools.nvim
        --
        -- But for many setups, the LSP (`tsserver`) will work just fine
        -- tsserver = {},
        --

        lua_ls = {
          -- cmd = {...},
          -- filetypes = { ...},
          -- capabilities = {},
          settings = {
            Lua = {
              completion = {
                callSnippet = 'Replace',
              },
              -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
              -- diagnostics = { disable = { 'missing-fields' } },
            },
          },
        },
      }

      -- Ensure the servers and tools above are installed
      --  To check the current status of installed tools and/or manually install
      --  other tools, you can run
      --    :Mason
      --
      --  You can press `g?` for help in this menu.
      require('mason').setup {
        registries = {
          'github:mason-org/mason-registry',
          'github:Crashdummyy/mason-registry',
        },
      }

      -- You can add other tools here that you want Mason to install
      -- for you, so that they are available from within Neovim.
      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        'stylua', -- Used to format Lua code
      })
      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      require('mason-lspconfig').setup {
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            -- This handles overriding only values explicitly passed
            -- by the server configuration above. Useful when disabling
            -- certain features of an LSP (for example, turning off formatting for tsserver)
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
    end,
  },

  { -- Autoformat
    'stevearc/conform.nvim',
    lazy = false,
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_fallback = true }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true, swift = true, cs = true }
        return {
          timeout_ms = 500,
          lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        -- Conform can also run multiple formatters sequentially
        -- python = { "isort", "black" },
        --
        -- You can use a sub-list to tell conform to run *until* a formatter
        -- is found.
        -- javascript = { { "prettierd", "prettier" } },
      },
    },
  },

  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      {
        'L3MON4D3/LuaSnip',
        build = (function()
          -- Build Step is needed for regex support in snippets.
          -- This step is not supported in many windows environments.
          -- Remove the below condition to re-enable on windows.
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        dependencies = {
          'hrsh7th/cmp-nvim-lsp',
          'hrsh7th/cmp-path',
          'hrsh7th/cmp-buffer',
          'onsails/lspkind.nvim',
          'rafamadriz/friendly-snippets',
          -- `friendly-snippets` contains a variety of premade snippets.
          --    See the README about individual language/framework/plugin snippets:
          --    https://github.com/rafamadriz/friendly-snippets
          -- {
          --   'rafamadriz/friendly-snippets',
          --   config = function()
          --     require('luasnip.loaders.from_vscode').lazy_load()
          --   end,
          -- },
        },
        config = function()
          local cmp = require 'cmp'
          local opts = {
            sources = cmp.config.sources {
              { name = 'nvim_lsm' },
              { name = 'buffer' },
              { name = 'path' },
            },
            window = {
              --completion = cmp.config.window.bordered(),
              --documentation = cmp.config.window.bordered(),
              completion = {
                border = 'rounded',
                winhighlight = 'Normal:CmpNormal,FloatBorder:BorderBg',
              },
              documentation = {
                border = 'rounded',
                winhighlight = 'Normal:CmpNormal,FloatBorder:BorderBg',
              },
            },
          }
          cmp.setup(opts)
        end,
      },
      'saadparwaiz1/cmp_luasnip',

      -- Adds other completion capabilities.
      --  nvim-cmp does not ship with all sources by default. They are split
      --  into multiple repos for maintenance purposes.
      { 'hrsh7th/cmp-nvim-lsp', lazy = true },
      { 'hrsh7th/cmp-path', lazy = true },
      { 'hrsh7th/cmp-buffer', lazy = true },
    },
    config = function()
      -- See `:help cmp`
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'
      luasnip.config.setup {}

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = { completeopt = 'menu,menuone,noinsert' },

        -- For an understanding of why these mappings were
        -- chosen, you will need to read `:help ins-completion`
        --
        -- No, but seriously. Please read `:help ins-completion`, it is really good!
        mapping = cmp.mapping.preset.insert {
          -- Select the [n]ext item
          ['<C-n>'] = cmp.mapping.select_next_item(),
          -- Select the [p]revious item
          ['<C-p>'] = cmp.mapping.select_prev_item(),

          -- Scroll the documentation window [b]ack / [f]orward
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),

          -- Accept ([y]es) the completion.
          --  This will auto-import if your LSP supports it.
          --  This will expand snippets if the LSP sent a snippet.
          ['<C-y>'] = cmp.mapping.confirm { select = true },

          -- If you prefer more traditional completion keymaps,
          -- you can uncomment the following lines
          --['<CR>'] = cmp.mapping.confirm { select = true },
          --['<Tab>'] = cmp.mapping.select_next_item(),
          --['<S-Tab>'] = cmp.mapping.select_prev_item(),

          -- Manually trigger a completion from nvim-cmp.
          --  Generally you don't need this, because nvim-cmp will display
          --  completions whenever it has completion options available.
          ['<C-Space>'] = cmp.mapping.complete {},

          -- Think of <c-l> as moving to the right of your snippet expansion.
          --  So if you have a snippet that's like:
          --  function $name($args)
          --    $body
          --  end
          --
          -- <c-l> will move you to the right of each of the expansion locations.
          -- <c-h> is similar, except moving you backwards.
          ['<C-l>'] = cmp.mapping(function()
            if luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            end
          end, { 'i', 's' }),
          ['<C-h>'] = cmp.mapping(function()
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            end
          end, { 'i', 's' }),

          -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
          --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'path' },
        },
      }
    end,
  },

  --  { -- You can easily change to a different colorscheme.
  --    -- Change the name of the colorscheme plugin below, and then
  --    -- change the command in the config to whatever the name of that colorscheme is.
  --    --
  --    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
  --    'folke/tokyonight.nvim',
  --    priority = 1000, -- Make sure to load this before all the other start plugins.
  --    init = function()
  --      -- Load the colorscheme here.
  --      -- Like many other themes, this one has different styles, and you could load
  --      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
  --      vim.cmd.colorscheme 'tokyonight-night'
  --
  --      -- You can configure highlights by doing something like:
  --      vim.cmd.hi 'Comment gui=none'
  --    end,
  --  },

  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  -- Color schemes
  {
    'rose-pine/neovim',
    as = 'rose-pine',
    config = function()
      require('rose-pine').setup {
        variant = 'moon',
        enable = {
          terminal = true,
        },

        styles = {
          bold = true,
          italic = false,
          transparency = false,
        },
      }
    end,
  },

  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [']quote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()

      -- Simple and easy statusline.
      --  You could remove this setup call if you don't like it,
      --  and try some other statusline plugin
      local statusline = require 'mini.statusline'
      -- set use_icons to true if you have a Nerd Font
      statusline.setup { use_icons = vim.g.have_nerd_font }

      -- You can configure sections in the statusline by overriding their
      -- default behavior. For example, here we set the section for
      -- cursor location to LINE:COLUMN
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end

      -- ... and there is more!
      --  Check out: https://github.com/echasnovski/mini.nvim
    end,
  },
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
      ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'vim', 'vimdoc' },
      -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = {
        enable = true,
        -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
        --  If you are experiencing weird indenting issues, add the language to
        --  the list of additional_vim_regex_highlighting and disabled languages for indent.
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
    },
    config = function(_, opts)
      -- [[ Configure Treesitter ]] See `:help nvim-treesitter`

      -- Prefer git instead of curl in order to improve connectivity in some environments
      require('nvim-treesitter.install').prefer_git = true
      ---@diagnostic disable-next-line: missing-fields
      require('nvim-treesitter.configs').setup(opts)

      -- There are additional nvim-treesitter modules that you can use to interact
      -- with nvim-treesitter. You should go explore a few and see what interests you:
      --
      --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
      --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
      --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    end,
  },
  -- {
  --   'nvim-treesitter/nvim-treesitter-textobjects',
  --   lazy = false,
  --   enabled = true,
  --   ft = { 'c', 'swift' },
  --   dependencies = { 'nvim-treesitter/nvim-treesitter' },
  --   config = function()
  --     require('nvim-treesitter.configs').setup {
  --       textobjects = {
  --         move = {
  --           enable = true,
  --           set_jumps = true, -- whether to set jumps in the jumplist
  --           goto_next_start = {
  --             [']m'] = '@function.outer',
  --             ['gj'] = '@function.outer',
  --             [']]'] = '@class.outer',
  --             [']b'] = '@block.outer',
  --             [']a'] = '@parameter.inner',
  --           },
  --           goto_next_end = {
  --             [']M'] = '@function.outer',
  --             ['gJ'] = '@function.outer',
  --             [']['] = '@class.outer',
  --             [']B'] = '@block.outer',
  --             [']A'] = '@parameter.inner',
  --           },
  --           goto_previous_start = {
  --             ['[m'] = '@function.outer',
  --             ['gk'] = '@function.outer',
  --             ['[['] = '@class.outer',
  --             ['[b'] = '@block.outer',
  --             ['[a'] = '@parameter.inner',
  --           },
  --           goto_previous_end = {
  --             ['[M'] = '@function.outer',
  --             ['gK'] = '@function.outer',
  --             ['[]'] = '@class.outer',
  --             ['[B'] = '@block.outer',
  --             ['[A'] = '@parameter.inner',
  --           },
  --         },
  --         select = {
  --           enable = true,
  --           lookahead = true,
  --           keymaps = {
  --             ['af'] = '@function.outer',
  --             ['if'] = '@function.inner',
  --             ['ac'] = '@class.outer',
  --             ['ic'] = '@class.inner',
  --             ['ab'] = '@block.outer',
  --             ['ib'] = '@block.inner',
  --             ['al'] = '@loop.outer',
  --             ['il'] = '@loop.inner',
  --             ['a/'] = '@comment.outer',
  --             ['i/'] = '@comment.outer', -- no inner for comment
  --             ['aa'] = '@parameter.outer', -- parameter -> argument
  --             ['ia'] = '@parameter.inner',
  --           },
  --         },
  --       },
  --     }
  --   end,
  -- },

  -- The following two comments only work if you have downloaded the kickstart repo, not just copy pasted the
  -- init.lua. If you want these files, they are in the repository, so you can just download them and
  -- place them in the correct locations.

  -- NOTE: Next step on your Neovim journey: Add/Configure additional plugins for Kickstart
  --
  --  Here are some example plugins that I've included in the Kickstart repository.
  --  Uncomment any of the lines below to enable them (you will need to restart nvim).
  --
  -- require 'kickstart.plugins.debug',
  -- require 'kickstart.plugins.indent_line',
  -- require 'kickstart.plugins.lint',
  -- require 'kickstart.plugins.autopairs',
  -- require 'kickstart.plugins.neo-tree',
  -- require 'kickstart.plugins.gitsigns', -- adds gitsigns recommend keymaps

  -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    This is the easiest way to modularize your config.
  --
  --  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
  --    For additional information, see `:help lazy.nvim-lazy.nvim-structuring-your-plugins`
  -- { import = 'custom.plugins' },
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
