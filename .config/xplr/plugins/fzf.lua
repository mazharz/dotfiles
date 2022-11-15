---@diagnostic disable
local xplr = xplr
---@diagnostic enable

local function setup()
  xplr.config.modes.builtin.default.key_bindings.on_key["F"] = {
    help = "fzf mode",
    messages = {
      { SwitchModeCustom = "fzxplr" }
    }
  }

  xplr.config.modes.custom.fzxplr = {
    name = "fzxplr",
    key_bindings = {
      on_key = {
        F = {
          help = "fuzzy search",
          messages = {
            {
              BashExec = [===[
              PTH=$(fzf)
              if [ -d "$PTH" ]; then
                "$XPLR" -m 'ChangeDirectory: %q' "$PTH"
              else
                "$XPLR" -m 'FocusPath: %q' "$PTH"
              fi
            ]===]
            },
            "PopMode",
          }
        }
      }
    }
  }
end

return { setup = setup }
