class C
  attr_accessor :value, :attr
  def initialize(v1,v2)
    @value = v1
    @attr = v2
  end
  def show()
    p @value
  end
end

c1 = C.new(10,20)
p c1.value
c1.value = 20
p c1.attr
