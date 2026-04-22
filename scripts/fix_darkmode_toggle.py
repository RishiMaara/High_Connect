import re

filepath = 'lib/profile/profile/profile_widget.dart'

with open(filepath, 'r', encoding='utf-8') as f:
    content = f.read()

# Fix 1: Wrap text Column in Expanded instead of bare Padding,
# and close the Expanded properly after the Column closing paren.

old_text_col = (
    '                              Padding(\n'
    '                                padding: EdgeInsetsDirectional.fromSTEB(\n'
    '                                    16.0, 0.0, 0.0, 0.0),\n'
    '                                child: Column(\n'
    '                                  mainAxisSize: MainAxisSize.max,\n'
    '                                  mainAxisAlignment: MainAxisAlignment.center,\n'
    '                                  crossAxisAlignment: CrossAxisAlignment.start,\n'
    '                                  children: ['
)

new_text_col = (
    '                              Expanded(\n'
    '                                child: Padding(\n'
    '                                  padding: EdgeInsetsDirectional.fromSTEB(\n'
    '                                      16.0, 0.0, 15.0, 0.0),\n'
    '                                  child: Column(\n'
    '                                    mainAxisSize: MainAxisSize.min,\n'
    '                                    mainAxisAlignment: MainAxisAlignment.center,\n'
    '                                    crossAxisAlignment: CrossAxisAlignment.start,\n'
    '                                    children: ['
)

if old_text_col in content:
    print('FIX 1: Opening Padding -> Expanded found')
    content = content.replace(old_text_col, new_text_col, 1)
else:
    print('FIX 1: NOT FOUND - check indentation')

# Fix 2: close the extra Expanded by adding an extra '),' after the Column/Padding closing
old_close = (
    '                              ),\n'
    '                            Container(\n'
    '                              width: 48.0,\n'
    '                              height: 28.0,'
)

new_close = (
    '                              ),\n'
    '                            ),\n'
    '                            Container(\n'
    '                              width: 48.0,\n'
    '                              height: 28.0,'
)

if old_close in content:
    print('FIX 2: close paren found')
    content = content.replace(old_close, new_close, 1)
else:
    print('FIX 2: NOT FOUND')

with open(filepath, 'w', encoding='utf-8') as f:
    f.write(content)

print('DONE - file written')
