class Every
  instance_methods.each { |m| undef_method(m) unless m.match(/^__/) }
  def initialize(obj, chain=false)
    @obj, @chain = obj, chain
  end
  def method_missing(method, *args)
    @@enum = @obj.map {|o| o.__send__(method,*args) }
    @chain ? Every.new(@@enum, true) : @@enum
  end
  def end
    @@enum
  end
end

module Enumerable
  def every
    Every.new(self)
  end
  def every!
    Every.new(self, true)
  end
end
