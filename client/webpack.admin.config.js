const webpack = require('webpack');

const config = require('./webpack.base.config');

config.entry.vendor.push(
  'reactabular',
  'react-dropzone',
  'react-router'
);
config.entry.admin = [
  './app/bundles/administrate/startup/clientRegistration'
];
config.plugins.push(
  // https://webpack.github.io/docs/list-of-plugins.html#2-explicit-vendor-chunk
  new webpack.optimize.CommonsChunkPlugin({

    // This name 'vendor' ties into the entry definition
    name: 'vendor',

    // We don't want the default vendor.js name
    filename: 'admin-vendor-bundle.js',

    // Passing Infinity just creates the commons chunk, but moves no modules into it.
    // In other words, we only put what's in the vendor entry definition in vendor-bundle.js
    minChunks: Infinity,
  })
);


module.exports = config;