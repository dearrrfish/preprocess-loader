#global define

define [], ->
  "use strict"

  # @exclude NODE_ENV='production'
  superExpensiveFunction('exclude')
  # @endexclude

  # @if NODE_ENV='production'
  superExpensiveFunction('production')
  # @endif

  # @include ./include.txt
