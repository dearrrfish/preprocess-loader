###
 * Webpack development server configuration
 *
 * This file is set up for serving the webpack-dev-server, which will watch for changes and recompile as required if
 * the subfolder /webpack-dev-server/ is visited. Visiting the root will not automatically reload.
###

'use strict';
webpack = require 'webpack'
path = require 'path'

module.exports =
    output:
        path: path.join(__dirname, './dist')
        filename: '[name].bundle.js'
        publicPath: '/assets/'

    cache: true
    debug: true
    devtool: false
    entry:
        coffeescript: './src/test.coffee'
        cjsx: './src/test.cjsx'
        test_pp_options: './src/test.test_pp_options'
        javascript: './src/test.js'

    stats:
        colors: true
        reasons: true

    resolve:
        extensions: ['', '.js', '.coffee', '.cjsx']
        #alias:
            #'commons': __dirname + '/src/javascripts/commons'

    module:
        loaders: [{
            test: /\.coffee$/
            loader: 'coffee!../?+DEBUG&NODE_ENV=production'
        }, {
            test: /\.cjsx$/
            loader: 'coffee!cjsx!../?+DEBUG&NODE_ENV=production'
        }, {
            test: /\.test_pp_options$/
            loader: "../?{ppOptions:{type:'js'}}!coffee!cjsx!../?{DEBUG:true,ppOptions:{type:'cjsx'}}"
        }, {
            test: /\.js$/
            loader: 'babel-loader!../?+DEBUG'
        }]

