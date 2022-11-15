---@diagnostic disable
local xplr = xplr
---@diagnostic enable

local function generateMessages(dir)
  local command = [[ "$XPLR" -m 'ChangeDirectory: %q' ]]
  local messages = {
    { BashExec = command .. dir },
    "PopMode"
  }

  return messages
end

local function setup()
  xplr.config.modes.builtin.default.key_bindings.on_key["m"] = {
    help = "bookmark mode",
    messages = { { SwitchModeCustom = "bookmark" } },
  }

  xplr.config.modes.custom.bookmark = {
    name = "bookmark",
    key_bindings = {
      on_key = {
        ["w"] = {
          help = "wd",
          messages = generateMessages([["${HOME:?}/mzd/wd"]])
        },
        ["n"] = {
          help = "not watched",
          messages = generateMessages([["${HOME:?}/mzd/multimedia/not watched"]])
        },
        ["m"] = {
          help = "music",
          messages = generateMessages([["${HOME:?}/mzd/music"]])
        },
        ["c"] = {
          help = "code",
          messages = generateMessages([["${HOME:?}/mzd/code"]])
        },
        ["b"] = {
          help = "book",
          messages = generateMessages([["${HOME:?}/mzd/text/book"]])
        }
      }
    }
  }
end

return { setup = setup }
