require 'pathname'
require 'set'
root  =  Pathname(__FILE__).dirname.parent
require root.join('test/test_helper')
require root.join('lib/every')

class EveryTest < Test::Unit::TestCase
  context "Every" do
    test "is a basic object" do
      whitelist = %w( __id__ __send__ method_missing )
      Enumerable::Proxy.instance_methods.to_set.should be(whitelist.to_set)
    end
    context "#every" do
      test "passes message onto enumerable's items" do
        [1.4, 2.4, 3.4].every.floor.should be([1,2,3])
      end
      test "allows arguments" do
        %w( axb dxf ).every.gsub(/x/,'y').should be(%w( ayb dyf ))
      end
      test "allows blocks" do
        %w( axb dxf ).every.gsub(/x/) { 'y' }.should be(%w( ayb dyf ))
      end
      test "accepts multi-level message passing" do
        [1.4, 2.4, 3.4].every { floor.next + 2 }.should be([4,5,6])
      end
    end
    context "#select_every" do
      test "passes message onto enumerable's items" do
        %w( axb ayb xyz ).select_every.match(/x/).should be(%w( axb xyz ))
      end
      test "accepts multi-level message passing" do
        [1.4, 2.4, 3.4].select_every { floor.next > 2 }.should be([2.4, 3.4])
      end
    end
    context "#reject_every" do
      test "passes message onto enumerable's items" do
        %w( axb ayb xyz ).reject_every.match(/x/).should be(%w( ayb ))
      end
      test "accepts multi-level message passing" do
        [1.4, 2.4, 3.4].reject_every { floor.next > 3 }.should be([1.4, 2.4])
      end
    end
  end
end
