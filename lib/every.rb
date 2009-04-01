module Enumerable
  class Proxy
    instance_methods.each { |m| undef_method(m) unless m.match(/^__/) }
    def initialize(enum, method=:map)
      @enum, @method = enum, method
    end
    def method_missing(method, *args, &block)
      @enum.send(@method) {|o| o.__send__(method, *args, &block) }
    end
  end
end

module Enumerable
  def every(&block)
    block_given? ?
      Proxy.new(self).instance_eval(&block) :
      Proxy.new(self)
  end
  def select_every(&block)
    block_given? ?
      Proxy.new(self, :select).instance_eval(&block) :
      Proxy.new(self, :select)
  end
  def reject_every(&block)
    block_given? ?
      Proxy.new(self, :reject).instance_eval(&block) :
      Proxy.new(self, :reject)
  end

  alias :pick    :select_every
  alias :without :reject_every
end
