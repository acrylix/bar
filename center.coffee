command: "date +\"%a %b %d - %l:%M %p\""

refreshFrequency: 60000 #ms

render: (output) ->
  values = output.split('-')

  "<div class='screen'><div class='holder'><div class='center'> #{values[0]} <i class='far fa-clock'></i><b style='color:#BDC581'>#{values[1]}</b></div></div></div>"

