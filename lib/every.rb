class Every
  instance_methods.each { |m| undef_method(m) unless m.match(/^__/) }
  def initialize(enum, method=:map)
    @enum, @method = enum, method
  end
  def method_missing(method, *args, &block)
    @enum.send(@method) {|o| o.__send__(method, *args, &block) }
  end
end

module Enumerable
  def every(&block)
    block_given? ?
      Every.new(self).instance_eval(&block) :
      Every.new(self)
  end
  def select_every(&block)
    block_given? ?
      Every.new(self, :select).instance_eval(&block) :
      Every.new(self, :select)
  end
  def reject_every(&block)
    block_given? ?
      Every.new(self, :reject).instance_eval(&block) :
      Every.new(self, :reject)
  end
end
