define(['vendor/react', 'load/router'], function(React, Router) {
  var target;
  target = document.getElementById('content');
  return React.renderComponent(Router({
    startingPage: 'welcome',
    pages: ['welcome', 'foo'],
    routes: {}
  }), target);
});
