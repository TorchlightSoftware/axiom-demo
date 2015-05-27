module.exports = (main) ->

  staticLocations: [
    @rel 'domain/gulp/public'
  ]

  url: main.app.url
  port: main.app.port

  routes: [
  ]
