local dap = require("dap")

local dap_breakpoint = {
    error = {text = "🛑", texthl = "LspDiagnosticsSignError", linehl = "", numhl = ""},
    rejected = {text = "", texthl = "LspDiagnosticsSignHint", linehl = "", numhl = ""},
    stopped = {
        text = "⭐️",
        texthl = "LspDiagnosticsSignInformation",
        linehl = "DiagnosticUnderlineInfo",
        numhl = "LspDiagnosticsSignInformation"
    }
}

vim.fn.sign_define("DapBreakpoint", dap_breakpoint.error)
vim.fn.sign_define("DapStopped", dap_breakpoint.stopped)
vim.fn.sign_define("DapBreakpointRejected", dap_breakpoint.rejected)

local dap_config = {python = require("dap.python")}
for dap_name, dap_options in pairs(dap_config) do
    dap.adapters[dap_name] = dap_options.adapters
    dap.configurations[dap_name] = dap_options.configurations
end
