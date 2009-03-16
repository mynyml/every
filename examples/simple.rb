require 'pathname'
root  =  Pathname(__FILE__).dirname.parent
require root.join('lib/every')

enum = [1.4, 2.4 ,3.4]
puts enum.map {|i| i.floor }.inspect
puts enum.map(&:floor).inspect
puts enum.every.floor.inspect

puts %w( axb dxf ).every.gsub(/x/,'y').inspect
