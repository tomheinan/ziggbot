# Description:
#   Find out who's talking in Ziggy's Mumble room
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   who's talking
#
# Author:
#   tomheinan

module.exports = (robot) ->

  getMumbleUsers = new Promise (resolve, reject) ->
    robot.http("http://mumble.limenotlemon.com/servers/1").get() (err, res, body) ->
      if err?
        reject err
      else
        resolve JSON.parse body

  robot.hear /who(?:'?s| is) talking/i, (msg) ->
    getMumbleUsers.then (result) ->

      # mumble REST plugin appears to be borken, so we have to find the correct
      # channel ourselves
      users = []
      for sub_channel in result.sub_channels
        if sub_channel.c.name.match /Live Streams/i
          for child in sub_channel.children
            if child.c.name.match /Ziggittyzig Live/i
              users = child.users
      
      names = []
      for user in users
        names.push user.name.toLowerCase()

      response = switch names.length
        when 0 then "nobody's talking at the moment"
        when 1 then "#{names[0]} is the only person talking right now"
        when 2 then "#{names[0]} and #{names[1]} are talking"
        else
          res = ""
          for i in [0...names.length - 1]
            res += "#{names[i]}, "
          res += "and #{names[names.length - 1]} are talking"

      msg.send response

    , (err) ->
      console.error err
