class Every
  instance_methods.each { |m| undef_method(m) unless m.match(/^__/) }
  def initialize(obj)
    @obj = obj
  end
  def method_missing(method, *args, &block)
    @obj.map {|o| o.__send__(method, *args, &block) }
  end
end

module Enumerable
  def every(&block)
    block_given? ?
      Every.new(self).instance_eval(&block) :
      Every.new(self)
  end
end
