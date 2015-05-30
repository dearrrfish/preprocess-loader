'use strict'

path = require 'path'
pp = require 'preprocess'
loaderUtils = require 'loader-utils'

module.exports = (source) ->
    @cacheable?()
    # parse and init context from query
    context = (loaderUtils.parseQuery @query) or {}
    context.src = @resourcePath
    context.srcDir = @context
    context.NODE_ENV = context.NODE_ENV or 'development'
    # parse file extension
    [..., extension] = path.extname(@resourcePath or '').split('.')
    # pp
    processed = pp.preprocess source, context, extension
    @callback null, processed

