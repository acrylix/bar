command: "bash Pecan/scripts/network"

refreshFrequency: 3000 # ms

render: (output) ->

  output = output.replace("|","<i class='fas fa-wifi' style='color: #1abc9c'></i>")
  output = output.replace("UP", "<i class='fas fa-upload'></i>")
  output = output.replace("DOWN", "<i class='fas fa-download'></i>")

  "<div class='screen'><div class='left2'><i class='fas fa-microchip' style='color: #95a5a6'></i> #{output}</div></div>"

