" Define custom signs for diagnostics (see :help diagnostic-signs).
if has('nvim')
  lua << trim EOF
    vim.diagnostic.config({
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = '┃',
          [vim.diagnostic.severity.WARN] = '┃',
          [vim.diagnostic.severity.INFO] = '┃',
          [vim.diagnostic.severity.HINT] = '┃',
        },
      },
    })
  EOF
else
  sign define DiagnosticSignError       text=┃ texthl=DiagnosticSignError
  sign define DiagnosticSignWarn        text=┃ texthl=DiagnosticSignWarn
  sign define DiagnosticSignInfo        text=┃ texthl=DiagnosticSignInfo
  sign define DiagnosticSignHint        text=┃ texthl=DiagnosticSignHint
  sign define DiagnosticSignOk          text=┃ texthl=DiagnosticSignOk
  sign define DiagnosticSignDeprecated  text=┃ texthl=DiagnosticSignDeprecated
  sign define DiagnosticSignUnnecessary text=┃ texthl=DiagnosticSignUnnecessary
endif
