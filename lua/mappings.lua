require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })


-- 1. Создаем новое сочетание: <leader>gc (пробел+g+c)
map("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", { desc = "Git Commits (Telescope)" })

-- 2. Отключаем старое сочетание: <leader>cm (пробел+c+m)

map("n", "<leader>cm", "<Nop>", { desc = "DISABLED" })

