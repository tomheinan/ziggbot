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
    robot.messageRoom '#ziggittyzig', 'ziggy\'s url here'

  robot.adapter.on 'connected', repExtraLife
