# Description:
#   Returns the link to Ziggy's Extra Life page
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   extra life
#
# Author:
#   tomheinan

module.exports = (robot) ->
  robot.respond /extra\s?life/i, (msg) ->
    msg.reply "http://www.extra-life.org/index.cfm?fuseaction=donordrive.participant&participantID=140766"
