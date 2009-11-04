require 'set'
require 'test/unit'
require 'context'
require 'matchy'
require 'lib/every'

class EveryTest < Test::Unit::TestCase
  context "Every" do
    test "is a basic object" do
      whitelist = %w( __id__ __send__ method_missing )
      Enumerable::Proxy.instance_methods.to_set.should be(whitelist.to_set)
    end
    test "passes message onto enumerable's items" do
      [1.4, 2.4, 3.4].every.floor.should be([1,2,3])
    end
    test "allows arguments" do
      %w( axb dxf ).every.gsub(/x/,'y').should be(%w( ayb dyf ))
    end
    test "allows blocks" do
      %w( axb dxf ).every.gsub(/x/) { 'y' }.should be(%w( ayb dyf ))
    end
  end
end
