require 'erb'
template = ERB.new %q{Chunky <%= food %>!}
food = "bacon"
template.result(binding) # => "Chunky bacon!"
# food = "peanut butter cream"
# template.result(binding) # => "Chunky peanut butter!"

p template.result(binding)
