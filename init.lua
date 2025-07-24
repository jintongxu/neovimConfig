-- bootstrap lazy.nvim, LazyVim and your plugins

-- 安全关闭诊断提示
pcall(vim.diagnostic.disable)

-- 加载 LazyVim 配置
require("config.lazy")

