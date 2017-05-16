import re
text = 'UPPER PYTHON, lower python, Mixed Python'
result1 = re.findall('python', text, flags=re.IGNORECASE)
result2 = re.sub('python', 'RUBY', text, flags=re.IGNORECASE)

print(result1)
print(result2)
