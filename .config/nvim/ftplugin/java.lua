local config = {
    cmd = {'/home/linuxbrew/.linuxbrew/Cellar/jdtls/1.39.0/bin/jdtls'},
    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
}
config.settings = {
    java = {
        project = {
            referencedLibraries = {
                '/mnt/c/Users/slok1/Desktop/Code/School/CS310/Project 2/p2-v2/yourCodeHere/opencsv-3.9.jar',
            },
        }
    }
}
require('jdtls').start_or_attach(config)
