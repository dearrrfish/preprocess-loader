/*global define*/

define([], function () {
  "use strict";

  //@echo firstOption

  //@exclude NODE_ENV='production'
  superExpensiveFunction('exclude')
  //@endexclude

  //@if NODE_ENV='production'
  superExpensiveFunction('production')
  //@endif

  /*@include include.txt */

  console.log('/* @echo NODE_ENV */')

});
