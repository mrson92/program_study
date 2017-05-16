hash = { key1: "val1", key2: "val2" }
string = ""
hash.each { |k,v| string << "#{k} is #{v}\n" }
puts string


puts hash.keys.join("\n") + "\n"


data = ['1', '2', '3']
s = ''
#data.each { |x| s << x << ' and a '}
# p s # => "1 and a 2 and a 3 and a "
p data.join(' and a ')


s = ""
data.each_with_index { |x, i| s << x; s << "|" if i < data.length-1 }
p s
