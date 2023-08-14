return {
    "luukvbaal/nnn.nvim",
    keys = {
        { "<leader>n", "<cmd>NnnPicker<cr>", desc = "nnn" },
    },
    opts = {
        picker = {
            cmd = "nnn -deo",
            style = {
                width = .6,
                height = .3,
                border = "single",
                NnnBorder = "",
            },
        },
        replace_netrw = "picker",
    },
}
