import sys

privacy_file = r'd:\Downloads\Code Black\planb-flutterflow\lib\profile\privacy_policy\privacy_policy_widget.dart'

with open(privacy_file, 'r', encoding='utf-8') as f:
    content = f.read()

# Replace the contact section in Privacy Policy
old_contact = r"12. Contact Us\n \nIf you have any questions or concerns about this Privacy Policy or our data practices, please contact us at:\n\nEmail: privacy@highconnect\nAddress: {}"
new_contact = r"11. Contact Us\nIf you have any questions about this Privacy Policy, please contact us at:\nEmail: support.highconnect@gmail.com"

content = content.replace(old_contact, new_contact)

# Just in case there are any other emails
content = content.replace('privacy@highconnect', 'support.highconnect@gmail.com')

with open(privacy_file, 'w', encoding='utf-8') as f:
    f.write(content)

print('Privacy policy updated successfully!')
