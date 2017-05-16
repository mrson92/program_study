class Cal
  attr_reader :v1, :v2
  attr_writer :v1
  @@_history = []
  def initialize(v1,v2)
    @v1 = v1
    @v2 = v2
  end
  def add()
    result = @v1+@v2
    @@_history.push("add : #{@v1}+#{@v2}=#{result}")
    return result
  end
  def subtract()
    result = @v1-@v2
    @@_history.push("subtrat : #{@v1}-#{@v2}=#{result}")
    return result
  end
  def Cal.history()
    for item in @@_history
      p item
    end
  end
end
class CalMultiply < Cal
  def multiply()
    result = @v1-@v2
    @@_history.push("multiply : #{@v1}*#{@v2}=#{result}")
    return result
  end
end
class CalDivice < CalMultiply
  def devide()
    result = @v1/@v2
    @@_history.push("devide : #{@v1}/#{@v2}=#{result}")
    return result
  end
end


c1 = CalMultiply.new(10,10)
p c1.add()
p c1.subtract()
p c1.multiply()
c2 = CalMultiply.new(30,20)
p c2.add()
p c2.multiply()
c3 = CalDivice.new(20,10)
p c3.devide()

# p c2.add()
Cal.history()
