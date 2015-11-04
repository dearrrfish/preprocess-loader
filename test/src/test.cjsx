#global define

define [], ->
  "use strict"

  # @exclude
  superExpensiveFunction('excluded')
  # @endexclude

  # @if NODE_ENV='production'
  superExpensiveFunction('production')
  # @endif

  # @include ./include.txt
  # @include ./base/include.txt
