_ = require 'lodash'

module.exports = (done) ->
  @api = @request.bind(@, 'connect.request')
  @factory = @request.ns 'mongoose.factory'

  done()
