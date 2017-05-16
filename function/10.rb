arr = [1,3,23,24,21,77]

arr.delete_if {|item|
  item > 7
}
puts arr
