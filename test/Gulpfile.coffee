'use strict'

path = require 'path'
gulp = require 'gulp'
gutil = require 'gulp-util'
webpack = require 'webpack'

__WEBPACK_CONFIG__ = require './webpack.config'

# Tasks
gulp.task 'webpack', (cb) ->
    webpack __WEBPACK_CONFIG__, (err, stats) ->
        throw new gutil.PluginError 'webpack', err if err
        gutil.log 'webpack', stats.toString colors: true
        cb?()

gulp.task 'default', ['webpack']

