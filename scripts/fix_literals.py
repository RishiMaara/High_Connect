import sys

file_path = r'd:\Downloads\Code Black\planb-flutterflow\lib\home\realcategory\realcategory_widget.dart'

with open(file_path, 'r', encoding='utf-8') as f:
    content = f.read()

# Replace literal \n and \'
content = content.replace(r'\n', '\n')
content = content.replace(r"\'", "'")

with open(file_path, 'w', encoding='utf-8') as f:
    f.write(content)
print("replaced literals!")
