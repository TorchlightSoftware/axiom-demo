define(['vendor/lodash', 'vendor/crossroads', 'vendor/hasher', 'vendor/react'], function(_, crossroads, hasher, React) {
  var r;
  r = React.DOM;
  return React.createClass({
    getInitialProps: function() {
      return {
        startingPage: 'index',
        pages: [],
        routes: {}
      };
    },
    getInitialState: function() {
      return {
        page: r.div({}, 'Page not found.')
      };
    },
    componentWillMount: function() {
      return this.initializeCrossroads();
    },
    render: function() {
      return this.state.page;
    },
    initializeCrossroads: function() {
      var attachPage, page, parseHash, route, setDefaultHash, _i, _len, _ref, _ref1;
      console.log('initializing crossroads');
      setDefaultHash = (function(_this) {
        return function(curHash) {
          console.log('setting default hash');
          if (!curHash) {
            return hasher.replaceHash(_this.props.startingPage);
          }
        };
      })(this);
      parseHash = (function(_this) {
        return function(newHash, oldHash) {
          console.log('parsing hash:', {
            newHash: newHash,
            oldHash: oldHash
          });
          return crossroads.parse(newHash);
        };
      })(this);
      attachPage = (function(_this) {
        return function(route, pageName) {
          console.log('attaching page:', {
            route: route,
            pageName: pageName
          });
          return crossroads.addRoute(route, function(args) {
            return require(["components/pages/" + pageName], function(Component) {
              return _this.setState({
                page: Component({
                  route: route,
                  pageName: pageName
                })
              });
            });
          });
        };
      })(this);
      _ref = this.props.pages;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        page = _ref[_i];
        attachPage(page, page);
      }
      _ref1 = this.props.routes;
      for (route in _ref1) {
        page = _ref1[route];
        attachPage(route, page);
      }
      crossroads.normalizeFn = crossroads.NORM_AS_OBJECT;
      hasher.initialized.add(setDefaultHash);
      hasher.initialized.add(parseHash);
      hasher.changed.add(parseHash);
      return hasher.init();
    }
  });
});
