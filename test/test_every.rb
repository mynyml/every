require 'set'
require 'minitest/autorun'
require 'minitest/spec'
require 'lib/every'

describe "Every" do

  it "should be a basic object" do
    whitelist = %w( __id__ __send__ method_missing ).to_set
    Enumerable::Proxy.instance_methods.to_set.must_equal(whitelist.to_set)
  end

  it "should pass message onto enumerable's items" do
    [1.4, 2.4, 3.4].every.floor.must_equal([1,2,3])
  end

  it "should allow arguments" do
    %w( axb dxf ).every.gsub(/x/,'y').must_equal(%w( ayb dyf ))
  end

  it "should allow blocks" do
    %w( axb dxf ).every.gsub(/x/) { 'y' }.must_equal(%w( ayb dyf ))
  end
end
