require("lint").linters_by_ft = {
  yaml = { "adrienverge/yamllint" },
  rust = { "cargolint" }
  -- yaml = { "mfussenegger/nvim-lint" }
}

-- Define the cargolint linter
local lint = require("lint")
lint.linters.cargolint = {
  cmd = "cargo",
  args = { "clippy", "--message-format", "json" },
  stream = "both",
  ignore_exitcode = true,
  parser = require("lint.parser").from_json({
    warnings = { "warning", "warn" },
    errors = { "error", "fatal" },
    field_map = {
      lnum = "message.spans[1].line_start",
      end_lnum = "message.spans[1].line_end",
      col = "message.spans[1].column_start",
      end_col = "message.spans[1].column_end",
      text = "message.message",
      severity = "level",
    },
  }),
}
