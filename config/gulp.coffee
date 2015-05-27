logger = require 'torch'
_ = require 'lodash'

module.exports = (config) ->
  bower = @rel.bind(@, 'bower_components')
  npm = @rel.bind(@, 'node_modules')

  return {

    clientConfig:
      values: _.pick config.app, ['publicPort', 'url', 'api']
      filename: 'behavior/config.js'

    custom: [
        src: bower 'es5-shim/es5-shim.min.js'
        dest: 'behavior/vendor/es5-shim.js'
      ,
        src: bower 'es5-shim/es5-shim.map'
        dest: 'behavior/vendor/es5-shim.map'
      ,
        src: bower 'es5-shim/es5-sham.map'
        dest: 'behavior/vendor/es5-sham.map'
      ,
        src: bower 'es5-shim/es5-sham.min.js'
        dest: 'behavior/vendor/es5-sham.js'
      ,
        src: bower 'crossroads.js/dist/crossroads.min.js'
        dest: 'behavior/vendor/crossroads.js'
      ,
        src: bower 'hasher/dist/js/hasher.min.js'
        dest: 'behavior/vendor/hasher.js'
      ,
        src: bower 'js-signals/dist/signals.min.js'
        dest: 'behavior/vendor/signals.js'
      ,
        src: bower 'async/lib/async.js'
        dest: 'behavior/vendor/async.js'
      ,
        src: bower 'react/react-with-addons.js'
        dest: 'behavior/vendor/react.js'
      ,
        src: bower 'bootstrap/dist/js/bootstrap.min.js'
        dest: 'behavior/vendor/bootstrap.js'
      ,
        src: bower 'bootstrap/dist/css/bootstrap.min.css'
        dest: 'style/vendor/bootstrap.css'
      ,
        src: bower 'bootstrap/dist/css/bootstrap-theme.min.css'
        dest: 'style/vendor/bootstrap-theme.css'
      ,
        src: bower 'bootstrap/dist/fonts/glyphicons-halflings-regular.woff'
        dest: 'style/fonts/glyphicons-halflings-regular.woff'
      ,
        src: bower 'bootstrap/dist/fonts/glyphicons-halflings-regular.ttf'
        dest: 'style/fonts/glyphicons-halflings-regular.ttf'
      ,
        src: bower 'bootstrap/dist/fonts/glyphicons-halflings-regular.svg'
        dest: 'style/fonts/glyphicons-halflings-regular.svg'
      ,
        src: npm 'lodash/dist/lodash.min.js'
        dest: 'behavior/vendor/lodash.js'
    ]
  }
