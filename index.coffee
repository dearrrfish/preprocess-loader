'use strict'

_ = require 'lodash'
path = require 'path'
pp = require 'preprocess'
loaderUtils = require 'loader-utils'

module.exports = (source) ->
    @cacheable?()
    # parse file extension
    [..., extension] = path.extname(@resourcePath or '').split('.')

    # prepare preprocess options
    options =
        #fileNotFoundSilentFail: false
        #srcEol: os.EOL
        srcDir: @context
        type: extension

    # parse and init context from query
    query = loaderUtils.getOptions(this) || {}

    # get possible user-specific preprocess options from query
    if _.isObject query.ppOptions
        options = _.merge options, query.ppOptions
        delete query.ppOptions

    # add .cjsx alias
    options.type = 'coffee' if /cjsx/i.test options.type

    # prepare context variables
    context = _.merge {}, process.env, query
    context.NODE_ENV = context.NODE_ENV or 'development'

    # pp
    processed = pp.preprocess source, context, options
    @callback null, processed

