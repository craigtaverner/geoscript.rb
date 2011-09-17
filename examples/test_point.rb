#!/usr/bin/env jruby

# useful if being run inside a source code checkout
$: << 'lib'
$: << '../lib'

require 'rubygems'
require 'geoscript'

p = GeoScript::Geom::Point.new(1,2)
puts p
p = GeoScript::Geom.fromWKT('POINT(2 3)')
puts p
