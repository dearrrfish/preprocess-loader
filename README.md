## preprocess-loader for webpack

> [Webpack](https://webpack.github.io) loader uses [preprocess](https://github.com/jsoverson/preprocess) to preprocess HTML, Javascript, and other module files based on custom or environment configurations.
> 
> Inspired by [gulp-preprocess](https://github.com/jas/gulp-preprocess) and [coffee-loader](https://github.com/webpack/coffee-loader). 

Usage
---
This loader is used within loader-chain before other loaders doing 'real' job.

```
var exports = require('coffee!preprocess?+DEBUG&NODE_ENV=production!./file.coffee')

```
[Webpack Doc: Using Loaders](http://webpack.github.io/docs/using-loaders.html)

#### webpack.config file
```
{
  module: {
    loaders: [{
      test: /\.coffee$/
      loader: 'coffee!preprocess?+DEBUG&NODE_ENV=production'
    }]
  }
}  

```

#### Example HTML
```
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
```
var configValue = '/* @echo FOO */' || 'default value';

// @ifdef DEBUG
someDebuggingCall()
// @endif
```

#### Example Coffeescript
```
configValue = '/* @echo FOO */' or 'default value'
# @ifdef DEBUG
somDebuggingCall()
# @endif
```

**More examples can be found in [README of preprocess](https://github.com/jsoverson/preprocess#directive-syntax).**



Licences
---
MIT