import sys
import re

file_path = r'd:\Downloads\Code Black\planb-flutterflow\lib\home\realcategory\realcategory_widget.dart'

with open(file_path, 'r', encoding='utf-8') as f:
    content = f.read()

# I will find the flawed string and replace it.
content = content.replace(r"'Home and Office Furniture's'", r'"Home and Office Furniture\'s"')

with open(file_path, 'w', encoding='utf-8') as f:
    f.write(content)
print("replaced!")
