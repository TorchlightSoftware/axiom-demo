should = require "should"
traffic = require 'traffic'
_ = require 'lodash'

patience = 200

describe 'App Setup', ->

  beforeEach (done) ->
    @timeout 8000
    traffic.visit @config.app.url, (@t, @fin) =>
      done()

  afterEach ->
    @fin?()

  it 'should start the server', (done) ->
    @t.drive [

      # wait for page to load
      @t.waitForText "Hello, world!", patience

    ], done
