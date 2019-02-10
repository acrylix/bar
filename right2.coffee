command: "bash Pecan/scripts/battery"

refreshFrequency: 1000 # ms

style: """
  right: -136px
  position: fixed
"""
render: (output) ->
  values = output.split('|')
  
  # battery charge
  charge = +values[0].replace('%','')
  color = 'none'
  style = ""

  if charge > 75
    battery = "<i class='fal fa-battery-full'></i> #{charge}%"
    color = "#8BC34A"
  else if charge > 50
    battery = "<i class='fal fa-battery-three-quarters'></i> #{charge}%"
    color = "#FFEB3B"
  else if charge > 25
    battery = "<i class='fal fa-battery-half'></i> #{charge}%"
    color = "#FF9800"
  else if charge > 10
    battery = "<i class='fal fa-battery-quarter'></i> #{charge}%"
    color = "#FF5722"
  else
    battery = "<i class='fal fa-battery-empty'></i> #{charge}%"
    color = "#F44336"
    style = "<style>
      .quadrat {
      -webkit-animation: NAME-YOUR-ANIMATION 0.5s infinite; 
    }

    @-webkit-keyframes NAME-YOUR-ANIMATION {
      0%, 50% {
        background-color: #95afc0;
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
    statusIcon = "<i class='fas fa-hourglass-half'></i>"
  else 
    statusIcon = "<i class='fas fa-question-circle'></i>"
    values[2] = 'unknown'
  

  "#{style}<div class='screen'><div class='right2 quadrat' style='background-color: #{color}'>#{battery} #{statusIcon} #{values[2]}</div></div>"

