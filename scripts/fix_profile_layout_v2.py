import re

files_to_fix = [
    r'd:\Downloads\Code Black\planb-flutterflow\lib\profile\profile\profile_widget.dart',
    r'd:\Downloads\Code Black\planb-flutterflow\lib\loading\l_bookingdetails_copy\l_bookingdetails_copy_widget.dart'
]

def fix_expanded(file_path):
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()
    
    lines = content.split('\n')
    new_lines = []
    
    i = 0
    total_removed = 0
    while i < len(lines):
        line = lines[i]
        # Look for the start of an Expanded wrapper we want to remove
        # We target Expanded( child: ... ) where child is a likely content widget
        # AND it's likely a direct child of a Column (indented)
        if 'Expanded(' in line and i + 1 < len(lines) and 'child:' in lines[i+1]:
            # Check if this Expanded is problematic (e.g. inside a scrollable column)
            # For now, let's be more specific about what we remove based on my code findings.
            
            should_remove = False
            if 'InkWell(' in lines[i+1] or 'Builder(' in lines[i+1] or 'wrapWithModel(' in lines[i+1] or 'Padding(' in lines[i+1]:
                # In l_bookingdetails_copy, line 370 is Expanded( child: Padding( ... ) )
                # In profile_widget, they were InkWell/Builder/wrapWithModel
                should_remove = True
            
            if should_remove:
                child_line = lines[i+1]
                new_lines.append(child_line.replace('child: ', ''))
                
                balance = 0
                balance += child_line.count('(')
                balance -= child_line.count(')')
                
                j = i + 2
                found_end = False
                while j < len(lines):
                    line_j = lines[j]
                    balance += line_j.count('(')
                    balance -= line_j.count(')')
                    
                    if balance == 0:
                        new_lines.append(line_j)
                        # Look for closing Expanded paren
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
                    continue
        
        new_lines.append(line)
        i += 1
            
    print(f"File {file_path}: Removed {total_removed} Expanded wrappers.")
    return '\n'.join(new_lines)

for file in files_to_fix:
    fixed_content = fix_expanded(file)
    with open(file, 'w', encoding='utf-8') as f:
        f.write(fixed_content)

print("Finished fixing layout issues.")
