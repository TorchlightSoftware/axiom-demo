require.config({
  baseUrl: 'behavior',
  paths: {
    signals: 'vendor/signals',
    pages: 'views/pages'
  }
});

require(['load/main']);
