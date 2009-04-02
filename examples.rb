require 'lib/every'

enum = [1.4, 2.4 ,3.4]
puts enum.every.floor.inspect
#=> [1, 2, 3]

enum = %w( axb dxf )
puts enum.every.gsub(/x/) { 'y' }.inspect
#=> ["ayb", "dyf"]

enum = %w( foo bar )
enum.every.upcase!
puts enum.inspect
#=> ["FOO", "BAR"]

enum = %w( foo bar ) << ''
puts enum.every.empty?.all?
#=> false
puts enum.every.empty?.any?
#=> true

enum = %w( foo bar baz )
puts enum.select_every.match(/^ba/).inspect
#=> ["bar", "baz"]
puts enum.reject_every.match(/^ba/).inspect
#=> ["foo"]

enum = [1.4, 2.4 ,3.4]
puts (enum.select_every > 1.5).inspect
#=> [2.4, 3.4]
puts (enum.reject_every > 2.5).inspect
#=> [1.4, 2.4]
