return {
    "mfussenegger/nvim-dap",
    dependencies = {
        -- Creates a debugger ui
        "rcarriga/nvim-dap-ui",

        -- Installs the debug adapters for you
        "williamboman/mason.nvim",
        "jay-babu/mason-nvim-dap.nvim",

        -- Add your own debuggers here
    },
    config = function()
        local dap = require "dap"
        local dapui = require "dapui"

        require("mason-nvim-dap").setup {
            -- Makes a best effort to setup the various debuggers with
            --  reasonable debug configurations
            automatic_setup = true,
            ensure_installed = {},
        }

        -- You can provide additional configuration to the handlers,
        -- see mason-nvm-dap README for more information

        -- Basic debugging keymaps
        vim.keymap.set("n", "<F5>", dap.continue)
        vim.keymap.set("n", "<F1>", dap.step_into)
        vim.keymap.set("n", "<F2>", dap.step_over)
        vim.keymap.set("n", "<F3>", dap.step_out)
        vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)
        vim.keymap.set("n", "<leader>B", function()
            dap.set_breakpoint(vim.fn.input "Breakpoint condition: ")
        end)

        -- Dap UI setup
        -- For more information, see |:help nvim-dap-ui
        dapui.setup {
            -- Set icons to characters that are more likely to work in every terminal.
            icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
            controls = {
                icons = {
                    pause = '⏸',
                    play = '▶',
                    step_into = '⏎',
                    step_over = '⏭',
                    step_out = '⏮',
                    step_back = 'b',
                    run_last = '▶▶',
                    terminate = '⏹',
                },
            },
        }

        dap.listeners.after.event_initialized["dapui_config"] = dapui.open
        dap.listeners.before.event_terminated["dapui_config"] = dapui.close
        dap.listeners.before.event_exited["dapui_config"] = dapui.close
        -- Install specific config
        -- eg. require("dap-go").setup()
    end,
}

