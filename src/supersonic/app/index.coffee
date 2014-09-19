Promise = require 'bluebird'

module.exports = (steroids) ->
  sleep: require("./sleep")(steroids)
  getLaunchURL: require("./getLaunchURL")(steroids)
  splashscreen: require("./splashscreen")(steroids)
  openURL: require("./openURL")(steroids)
