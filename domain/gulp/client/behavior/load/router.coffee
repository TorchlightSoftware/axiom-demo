define ['vendor/lodash', 'vendor/crossroads', 'vendor/hasher', 'vendor/react'],
  (_, crossroads, hasher, React) ->

    r = React.DOM

    React.createClass
      getInitialProps: ->
        startingPage: 'index'
        pages: []
        routes: {}

      getInitialState: ->
        page: r.div {}, 'Page not found.'

      componentWillMount: ->
        @initializeCrossroads()

      render: ->
        @state.page

      initializeCrossroads: ->
        console.log 'initializing crossroads'

        setDefaultHash = (curHash) =>
          console.log 'setting default hash'
          hasher.replaceHash @props.startingPage unless curHash

        # find the new page to load
        parseHash = (newHash, oldHash) =>
          console.log 'parsing hash:', {newHash, oldHash}
          crossroads.parse(newHash)

        attachPage = (route, pageName) =>
          console.log 'attaching page:', {route, pageName}
          crossroads.addRoute route, (args) =>

            # each page is a React component
            require ["components/pages/#{pageName}"], (Component) =>
              @setState
                page: Component({route, pageName})

        # add routing for pages
        for page in @props.pages
          attachPage(page, page)

        for route, page of @props.routes
          attachPage(route, page)

        # send our handlers objects, not arrays
        crossroads.normalizeFn = crossroads.NORM_AS_OBJECT

        # initialize router
        hasher.initialized.add setDefaultHash
        hasher.initialized.add parseHash
        hasher.changed.add parseHash
        hasher.init()
