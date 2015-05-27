jQuery.support.cors = true

define ['config'], (config) ->
  api = config.api # or config.url

  return (method, route, args, done) ->
    if ((typeof args) is 'function') and not done?
      done = args
      args = null

    $.ajax {
      type: method.toUpperCase()
      url: [api, route].join '/'

      dataType: 'json'

      #converters:
        #'text json': $.parseJSON
        #'application json': $.parseJSON

      data: args

      success: (data) ->
        done null, data

      error: (xhr, status, error) ->
        done error
    }
