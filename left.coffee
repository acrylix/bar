command: "bash Pecan/scripts/ws"

refreshFrequency: 1000 # ms

style: """
  z-index: 100
"""

render: (output) ->

  values = output.split('|')

  mode = values[1].slice(0,3)

  if mode == "bsp"
    mode = "<i class='fas fa-th-large'></i>"
  else if mode == "mon"
    mode = "<i class='fas fa-square'></i>"
  else if mode == "flo"
    mode = "<i class='fas fa-clone'></i>"

  "<div class='screen'><div class='left'>#{mode} #{values[0]} </div></div>"

