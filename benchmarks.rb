#!/usr/lib/env ruby

require 'pathname'
require 'benchmark'
root  =  Pathname(__FILE__).dirname
require  root.join('lib/every.rb')
 
unless defined?(:a.to_proc)
  class Symbol
    def to_proc() proc { |obj| obj.__send__(self) } end
  end
end

puts
puts "One iteration"
n = 100_000
Benchmark.bm(15) do |bm|
  bm.report('Block:')           { (0..n).map {|i| i.floor } }
  bm.report('Symbol#to_proc:')  { (0..n).map(&:floor) }
  bm.report('every:')           { (0..n).every.floor }
end

puts
puts "Two iterations"
n = 100_000
Benchmark.bm(15) do |bm|
  bm.report('Block:')           { (0..n).map {|i| i.floor.next } }
  bm.report('Block2:')          { (0..n).map {|i| i.floor }.map {|i| i.next } }
  bm.report('Symbol#to_proc:')  { (0..n).map(&:floor).map(&:next) }
  bm.report('every:')           { (0..n).every.floor.every.next }
  bm.report('every (chain):')   { (0..n).every { floor.next } }
end
