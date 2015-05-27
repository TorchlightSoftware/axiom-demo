_ = require 'lodash'
environment = process.env.NODE_ENV or 'development'

base =
  app:
    name: 'Axiom Demo'
    url: 'http://localhost:4040'
    port: 4040
    ssl: false

  mongo:
    host: 'mongodb://localhost:27017/axiom-demo-dev'

config =

  development: base

  production:
    app:
      #url: 'http://app.onmodulus.net'
      port: 8080

    mongo:
      host: "mongodb://#{process.env.MONGO_USER}:#{process.env.MONGO_PW}@mongo.onmodulus.net:27017/#{process.env.MONGO_DB}"

  test:
    app:
      url: 'http://localhost:4041'
      port: 4041
    mongo:
      host: 'mongodb://localhost:27017/axiom-demo-test'

module.exports = _.merge {}, base, config[environment], {
  env: environment
}
