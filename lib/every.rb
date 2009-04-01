module Enumerable
  class Proxy
    instance_methods.each { |m| undef_method(m) unless m.match(/^__/) }
    def initialize(enum, method=:map)
      @enum, @method = enum, method
    end
    def method_missing(method, *args, &block)
      @enum.__send__(@method) {|o| o.__send__(method, *args, &block) }
    end
  end
end

module Enumerable
  def every(&block)
    block_given? ?
      Proxy.new(self).instance_eval(&block) :
      Proxy.new(self)
  end
end
