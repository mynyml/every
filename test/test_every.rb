require 'pathname'
root  =  Pathname(__FILE__).dirname.parent
require root.join('test/test_helper')
require root.join('lib/every')

class EveryTest < Test::Unit::TestCase
  context "Every" do
    test "is a basic object" do
      whitelist = %w( __id__ __send__ method_missing )
      Every.instance_methods.to_set.should be(whitelist.to_set)
    end
    test "calls method on enumerable's items" do
      [1.4, 2.4, 3.4].every.floor.should be([1,2,3])
    end
    test "allows arguments" do
      %w( axb dxf ).every.gsub(/x/,'y').should be(%w( ayb dyf ))
    end
    test "chains method calls" do
      [1.4, 2.4, 3.4].every!.floor.next.+(2).end.should be([4,5,6])
    end
  end
end
