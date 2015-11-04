## preprocess-loader for webpack

> [Webpack](https://webpack.github.io) loader uses [preprocess](https://github.com/jsoverson/preprocess) to preprocess HTML, Javascript, and other module files based on custom or environment configurations.
> 
> Inspired by [gulp-preprocess](https://github.com/jas/gulp-preprocess) and [coffee-loader](https://github.com/webpack/coffee-loader). 

## Usage

This loader is used within loader-chain before other loaders doing 'real' job.

``` 
var exports = require('coffee!preprocess?+DEBUG&NODE_ENV=production!./file.coffee')

```

[Webpack Doc: Using Loaders](http://webpack.github.io/docs/using-loaders.html)

#### loadUtils.parseQuery examples

``` 
null                   -> {}
?                      -> {}
?flag                  -> { flag: true }
?+flag                 -> { flag: true }
?-flag                 -> { flag: false }
?xyz=test              -> { xyz: "test" }
?xyz[]=a               -> { xyz: ["a"] }
?flag1&flag2           -> { flag1: true, flag2: true }
?+flag1,-flag2         -> { flag1: true, flag2: false }
?xyz[]=a,xyz[]=b       -> { xyz: ["a", "b"] }
?a%2C%26b=c%2C%26d     -> { "a,&b": "c,&d" }
?{json:5,data:{a:1}}   -> { json: 5, data: { a: 1 } }
```

#### webpack.config file

``` coffeescript
{
  module: {
    loaders: [{
        test: /\.coffee$/
        loader: 'coffee!preprocess?+DEBUG&NODE_ENV=production'
    }, {
        test: /\.cjsx$/
        loader: 'coffee!cjsx!preprocess?+DEBUG&NODE_ENV=production'
    }, {
        test: /\.test_pp_options$/
        loader: "coffee!cjsx!preprocess?{DEBUG:true,ppOptions:{type:'cjsx'}}"
    }, {
        test: /\.js$/
        loader: 'babel-loader!preprocess?+DEBUG'
    }]
  }
}
```

Loader supports `.cjsx` as an alias type of `.coffee`.

You can override default **preprocess options** by passing `ppOptions` object in query.  See [preprocess API](https://github.com/jsoverson/preprocess#options) for available options.

#### Example HTML

``` html
<head>
  <title>Your App

  <!-- @if NODE_ENV='production' -->
  <script src="some/production/lib/like/analytics.js"></script>
  <!-- @endif -->

</head>
<body>
  <!-- @ifdef DEBUG -->
  <h1>Debugging mode - <!-- @echo RELEASE_TAG --> </h1>
  <!-- @endif -->
  <p>
  <!-- @include welcome_message.txt -->
  </p>
</body>
```

#### Example Javascript

``` javascript
var configValue = '/* @echo FOO */' || 'default value';

// @ifdef DEBUG
someDebuggingCall()
// @endif
```

#### Example Coffeescript

``` coffeescript
configValue = '/* @echo FOO */' or 'default value'
# @ifdef DEBUG
somDebuggingCall()
# @endif
```

`@echo`  block won't be processed in `coffee/shell` type unless applying another preprocess loading after it is compiled to javascript.

``` coffeescript
loader: "preprocess?{ppOptions:{type:'js'}}!coffee!cjsx!preprocess?{DEBUG:true,ppOptions:{type:'cjsx'}}"
```

**More examples can be found in [README of preprocess](https://github.com/jsoverson/preprocess#directive-syntax).**



## Licences

MIT