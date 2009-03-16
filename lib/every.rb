class Every
  instance_methods.each { |m| undef_method(m) unless m.match(/^__/) }
  def initialize(obj)
    @obj = obj
  end
  def method_missing(method, *args)
    @obj.map {|o| o.__send__(method,*args) }
  end
end

module Enumerable
  def every
    Every.new(self)
  end
end
