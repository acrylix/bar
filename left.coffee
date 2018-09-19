command: "bash Pecan/scripts/ws"

refreshFrequency: 500 # ms

render: (output) ->

  values = output.split('|')

  mode = values[1].slice(0,3)

  if mode == "bsp"
    mode = "<i class='fas fa-th-large'></i>"
  else if mode == "mon"
    mode = "<i class='fas fa-dice-one'></i>"
  else if mode == "flo"
    mode = "<i class='fas fa-clone'></i>"

  "<div class='screen'><div class='left'>#{mode} #{values[0]} </div></div>"

