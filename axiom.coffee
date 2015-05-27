law = require 'law'
_ = require 'lodash'
global.LOG = require 'torch'

module.exports =
  timeout: 20000
  logDepth: 3

  extensions:
    protocol: "*"
    connect: "*"
    gulp: "*"
    mocha: "*"
    mongoose: "*"
    law: require './extensions/law'

  config: require './config'

  routes: [
    #['link', 'connect.routes', 'law']
    ['link', 'connect.routes', 'mongoose.resources']
  ]
