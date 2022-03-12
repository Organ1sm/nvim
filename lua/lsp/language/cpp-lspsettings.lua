local settings = {}

settings = {
    cmd = {
        "clangd",
        "--pretty",
        "--background-index",
        "--compile-commands-dir=build",
        "-j=12",
        "--query-driver=/usr/sbin/clang++",
        "--clang-tidy",
        "--clang-tidy-checks=performance-*,bugprone-*",
        "--all-scopes-completion",
        "--completion-style=detailed",
        "--function-arg-placeholders",
        "--header-insertion=iwyu",
        "--pch-storage=memory"
    },
    filetypes = {"c", "cpp"}
}

return settings
