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

enum = [{:name => 'Foo'}, {:name => 'Bar'}]
puts enum.every[:name].inspect
#=> ["Foo", "Bar"]

enum = [1,2,3]
puts (enum.every + 1).inspect
#puts enum.every.+(1).inspect
#=> [2, 3, 4] 
