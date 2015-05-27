define ['vendor/react', 'load/router'],
  (React, Router) ->

    # TODO: load models?

    target = document.getElementById('content')
    React.renderComponent Router(
      startingPage: 'welcome'
      pages: ['welcome', 'foo']
      routes: {
      }
    ), target
