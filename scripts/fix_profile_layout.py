import re

file_path = r'd:\Downloads\Code Black\planb-flutterflow\lib\profile\profile\profile_widget.dart'

with open(file_path, 'r', encoding='utf-8') as f:
    content = f.read()

def fix_expanded(text):
    lines = text.split('\n')
    new_lines = []
    
    i = 0
    total_removed = 0
    while i < len(lines):
        line = lines[i]
        # Look for the start of an Expanded wrapper we want to remove
        # Specifically targeting cases where Expanded is a direct child of the Column in the scroll view
        if 'Expanded(' in line and i + 1 < len(lines) and 'child:' in lines[i+1] and ('InkWell(' in lines[i+1] or 'Builder(' in lines[i+1] or 'wrapWithModel(' in lines[i+1]):
            # Found one!
            child_line = lines[i+1]
            new_lines.append(child_line.replace('child: ', ''))
            
            # Now we need to find the matching closing '),' and skip it.
            # We'll track the parenthesis balance
            balance = 0
            # How many parens are opened on the child_line?
            balance += child_line.count('(')
            balance -= child_line.count(')')
            
            j = i + 2
            found_end = False
            while j < len(lines):
                line_j = lines[j]
                # Update balance
                balance += line_j.count('(')
                balance -= line_j.count(')')
                
                if balance == 0:
                    # We reached the end of the child widget
                    new_lines.append(line_j)
                    # The next line should be the one we want to skip (closing Expanded paren)
                    if j + 1 < len(lines) and '),'.strip() == lines[j+1].strip():
                        j += 1
                        total_removed += 1
                        found_end = True
                    break
                else:
                    new_lines.append(line_j)
                j += 1
            
            if found_end:
                i = j + 1
            else:
                # If we didn't find the end, backtrack and just add the line normally
                # to avoid breaking the file
                new_lines.pop() # Remove the modified child line
                new_lines.append(line)
                i += 1
        else:
            new_lines.append(line)
            i += 1
            
    print(f"Removed {total_removed} Expanded wrappers.")
    return '\n'.join(new_lines)

fixed_content = fix_expanded(content)

if fixed_content != content:
    with open(file_path, 'w', encoding='utf-8') as f:
        f.write(fixed_content)
    print("Success: Modified profile_widget.dart")
else:
    print("No changes were applied.")
