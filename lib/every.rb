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

  def every() Proxy.new(self) end
end
