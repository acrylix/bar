command: "echo $(x=$(/usr/local/bin/chunkc tiling::query -d id);echo $(/usr/local/bin/chunkc tiling::query -D $(/usr/local/bin/chunkc tiling::query -m id))\",$x\")"

refreshFrequency: 1000

render: (output) ->
  values = output.split(',')
  spaces = values[0].split(' ')

  htmlString = """
    <div class="currentDesktop-container" data-count="#{spaces.length}">
      <ul>
  """

  for i in [0..spaces.length - 1]
    icon = ""
    switch spaces[i]
        when '1' then icon = "<i class='fab fa-discord'></i>"
        when '2' then icon = "<i class='fab fa-chrome'></i>"
        when '3' then icon = "<i class='fas fa-terminal'></i>"
        when '4' then icon = "<i class='fas fa-code'></i>"
        else icon = "<i class='fas fa-dot-circle'></i>"
    htmlString += "<li id=\"desktop#{spaces[i]}\">#{icon}</li>"

  htmlString += """
      <ul>
    </div>
  """

style: """
  z-index: 100
  left: 95px
  position: fixed
  margin-top: 8px
  font: 14px "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, "Lucida Grande", sans-serif
  color: #636e72
  font-size: 16px

  ul
    list-style: none
    margin: 0 0 0 10px
    padding: 0

  li
    display: inline
    margin: 0 5px
    padding:5px
    img
      max-height: 20px
      max-width: 20px

  li.active
    color: #ff7675
    background-color:#353b48
    padding:5px
    border-bottom: 2px solid white
"""

update: (output, domEl) ->
  values = output.split(',')
  spaces = values[0].split(' ')
  space = values[1]

  htmlString = ""
  for i in [0..spaces.length - 1]
    icon = ""
    switch spaces[i]
        when '1' then icon = "<i class='fab fa-discord'></i>"
        when '2' then icon = "<i class='fab fa-chrome'></i>"
        when '3' then icon = "<i class='fas fa-terminal'></i>"
        when '4' then icon = "<i class='fas fa-code'></i>"
        else icon = "<i class='fas fa-dot-circle'></i>"
    htmlString += "<li id=\"desktop#{spaces[i]}\">#{icon}</li>"

  if ($(domEl).find('.currentDesktop-container').attr('data-count') != spaces.length.toString())
     $(domEl).find('.currentDesktop-container').attr('data-count', "#{spaces.length}")
     $(domEl).find('ul').html(htmlString)
     $(domEl).find("li#desktop#{space}").addClass('active')
  else
    $(domEl).find('li.active').removeClass('active')
    $(domEl).find("li#desktop#{space}").addClass('active')
