command: "bash Pecan/scripts/network"

refreshFrequency: 3000 # ms

render: (output) ->
  wifi = 2 * (+output.split('%')[1]+100) 
  
  if wifi > 80
    wifiColor = '#27ae60'
  else if wifi > 60
    wifiColor = '#e67e22'
  else
    wifiColor = '#e74c3c'

  output = output.split('%')[0]
  output = output.replace("CPU", "<i class='fas fa-microchip' style='color: grey'></i>")
  output = output.replace("|","<i class='fas fa-wifi' style='color: #1abc9c'></i>")
  output = output.replace("UP", "<i class='fas fa-upload'></i>")
  output = output.replace("DOWN", "<i class='fas fa-download'></i>")

  "<div class='screen'><div class='left2'>#{output} <a style='color:#{wifiColor}'><i class='far fa-signal'></i> #{wifi}%</a></div></div>"

