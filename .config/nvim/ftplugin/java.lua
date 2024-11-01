local jdtls_config_path = os.getenv("JDTLS_CONFIG_PATH")

local config = {
    cmd = {jdtls_config_path},
    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
}
-- config.settings = {
--     java = {
--         project = {
--             referencedLibraries = {
--                 '/mnt/c/Users/slok1/Desktop/Code/School/CS310/Project 2/p2-v2/yourCodeHere/opencsv-3.9.jar',
--             },
--         }
--     }
-- }
require('jdtls').start_or_attach(config)
