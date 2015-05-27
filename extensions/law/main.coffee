law = require 'law'
_ = require 'lodash'

module.exports =
  config:
    serviceDir: 'services'

  extends:
    loadServices: ['server.run/load', 'server.test/load']

  services:
    loadServices: (args, done) ->

      try
        policy = @retrieve 'policy/policy'

      try
        jargon = @retrieve 'policy/jargon'

      try
        customizeContext = @retrieve 'policy/context'

      # assemble the context we'll be passing to our application services
      context = _.merge {}, @appUtils, @appRetriever

      # give application opportunity to modify the context and add further helpers
      if customizeContext?
        customizeContext.call(context)

      # load our services from the configured location
      services = law.load @rel(@config.serviceDir)
      services = law.create {services, policy, jargon}

      # attach the application services to our namespace
      for name, def of services
        @respond name, def.bind(context)

      done()
