const webpack = require('webpack');

const config = require('./webpack.base.config');

config.entry.vendor.push(
  'axios',
  'react-router'
);
config.entry.app = [
  './app/bundles/untouched/startup/clientRegistration'
];
config.plugins.push(
  // https://webpack.github.io/docs/list-of-plugins.html#2-explicit-vendor-chunk
  new webpack.optimize.CommonsChunkPlugin('vendor', 'app-vendor-bundle.js', Infinity)
);

module.exports = config;