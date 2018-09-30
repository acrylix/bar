command: "date +\"%a %b %d - %l:%M %p\""

refreshFrequency: 1000

render: (output) ->
  values = output.split('-')

  "<div class='screen'><div class='holder'><div class='center'><i class='far fa-calendar-alt'></i> #{values[0]} <i class='fas fa-funnel-dollar'></i><b style='color:#BDC581'>#{values[1]}</b></div></div></div>"

