command: "bash Pecan/scripts/battery"

refreshFrequency: 1000 # ms

render: (output) ->
  values = output.split('|')
  
  # battery charge
  charge = +values[0].replace('%','')
  color = 'none'
  style = ""

  if charge > 75
    battery = "<i class='fas fa-battery-full'></i> #{charge}%"
    color = "#8BC34A"
  else if charge > 50
    battery = "<i class='fas fa-battery-three-quarters'></i> #{charge}%"
    color = "#FFEB3B"
  else if charge > 25
    battery = "<i class='fas fa-battery-half'></i> #{charge}%"
    color = "#FF9800"
  else if charge > 10
    battery = "<i class='fas fa-battery-quarter'></i> #{charge}%"
    color = "#FF5722"
  else
    battery = "<i class='fas fa-battery-empty'></i> #{charge}%"
    color = "#F44336"
    style = "<style>
      .quadrat {
      -webkit-animation: NAME-YOUR-ANIMATION 0.5s infinite; 
    }

    @-webkit-keyframes NAME-YOUR-ANIMATION {
      0%, 50% {
        background-color: #fc5c65;
      }
      50%, 100% {
        background-color: #eb2f06;
      }
    }</style>"


  # battery status
  status = values[1].replace(' ','').replace(' ','')

  if status == 'charged'
    statusIcon = "<i class='fas fa-plug'></i>"
  else if (status == "charging")
    statusIcon = "<i class='fas fa-bolt'></i>"
  else if (status == "discharging")
    statusIcon = "<i class='fas fa-stopwatch'></i>"

  "#{style}<div class='screen'><div class='right2 quadrat' style='background-color: #{color}'>#{battery} #{statusIcon} #{values[2]}</div></div>"

