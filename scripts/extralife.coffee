# Description:
#   Periodically reps Ziggy's Extra Life page
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   None
#
# Author:
#   tomheinan

module.exports = (robot) ->

  repExtraLife = ->
    setInterval () ->
      robot.messageRoom '#ziggittyzig', 'ziggy\'s url here'
    , 10000

  robot.adapter.on 'connected', repExtraLife
