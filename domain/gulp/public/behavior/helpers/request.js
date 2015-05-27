jQuery.support.cors = true;

define(['config'], function(config) {
  var api;
  api = config.api;
  return function(method, route, args, done) {
    if (((typeof args) === 'function') && (done == null)) {
      done = args;
      args = null;
    }
    return $.ajax({
      type: method.toUpperCase(),
      url: [api, route].join('/'),
      dataType: 'json',
      data: args,
      success: function(data) {
        return done(null, data);
      },
      error: function(xhr, status, error) {
        return done(error);
      }
    });
  };
});
