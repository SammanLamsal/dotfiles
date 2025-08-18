local jdtls_config_path = os.getenv("JDTLS_CONFIG_PATH")
local capabilities = require('blink.cmp').get_lsp_capabilities()
local config = {
    cmd = {jdtls_config_path},
    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
    capabilities = capabilities,
}
require('jdtls').start_or_attach(config)
