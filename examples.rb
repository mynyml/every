require 'pathname'
root  =  Pathname(__FILE__).dirname.expand_path
require  root.join('lib/every.rb')

enum = [1.4, 2.4 ,3.4]
puts enum.every.floor.inspect

enum = %w( axb dxf )
puts enum.every.gsub(/x/) { 'y' }.inspect

enum = %w( foo bar )
enum.every.upcase!
puts enum.inspect

enum = %w( foo bar ) << ''
puts enum.every.empty?.all?
puts enum.every.empty?.any?