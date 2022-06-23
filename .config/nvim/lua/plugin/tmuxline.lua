vim.g.tmuxline_preset = {
  a = '#S', -- session
  win = '#I #W', -- inactive windows
  cwin = '#I #W', -- active window
  x = '%a %d %b, %Y', -- date
  y = '%R', -- time
  z = '#H', -- hostname
  options = {
    ['status-justify'] = 'left' -- left align window indicators
  }
}
