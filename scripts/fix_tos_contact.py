import sys

file_path = r'd:\Downloads\Code Black\planb-flutterflow\lib\profile\term_of_service\term_of_service_widget.dart'

with open(file_path, 'r', encoding='utf-8') as f:
    content = f.read()

# Replace the email addresses
content = content.replace('support@highconnect.example', 'support.highconnect@gmail.com')
content = content.replace('Email: support@highconnect.\\nAddress: [Insert Company Address]\\n', 'Email: support.highconnect@gmail.com\\n')

with open(file_path, 'w', encoding='utf-8') as f:
    f.write(content)

print('Contact details updated successfully!')
