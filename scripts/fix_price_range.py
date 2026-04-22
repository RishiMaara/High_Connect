"""
Fix price range across all filter files:
  old max: 500  →  new max: 50000
  old divisions: 100  →  new divisions: 500  (50000/100 step increments)
"""

import re

changes = []

# ── 1. z_filter_model.dart ─────────────────────────────────────────────────
path = 'lib/home/components/z_filter/z_filter_model.dart'
with open(path, 'r', encoding='utf-8') as f:
    content = f.read()

old = '  double? end = 500.0;'
new = '  double? end = 50000.0;'
if old in content:
    content = content.replace(old, new, 1)
    changes.append(f'  ✔  {path}: end default  500 → 50000')
else:
    changes.append(f'  ✘  {path}: end default NOT FOUND')

with open(path, 'w', encoding='utf-8') as f:
    f.write(content)

# ── 2. z_filter_widget.dart ────────────────────────────────────────────────
path = 'lib/home/components/z_filter/z_filter_widget.dart'
with open(path, 'r', encoding='utf-8') as f:
    content = f.read()

# Reset button sets end back to 500
old = '              _model.end = 500.0;'
new = '              _model.end = 50000.0;'
if old in content:
    content = content.replace(old, new, 1)
    changes.append(f'  ✔  {path}: reset end  500 → 50000')
else:
    changes.append(f'  ✘  {path}: reset end NOT FOUND')

# bottom bar condition "< 500" → "< 50000"  (may appear twice)
before = content.count('< 500.0')
content = content.replace('< 500.0', '< 50000.0')
after_count = content.count('< 50000.0')
changes.append(f'  ✔  {path}: replaced {before} occurrences of < 500.0 → < 50000.0')

with open(path, 'w', encoding='utf-8') as f:
    f.write(content)

# ── 3. app_state.dart ──────────────────────────────────────────────────────
path = 'lib/app_state.dart'
with open(path, 'r', encoding='utf-8') as f:
    content = f.read()

old = '  double _PriceByEnd = 500.0;'
new = '  double _PriceByEnd = 50000.0;'
if old in content:
    content = content.replace(old, new, 1)
    changes.append(f'  ✔  {path}: _PriceByEnd default  500 → 50000')
else:
    changes.append(f'  ✘  {path}: _PriceByEnd default NOT FOUND')

with open(path, 'w', encoding='utf-8') as f:
    f.write(content)

# ── 4. z_filter_list_widget.dart ──────────────────────────────────────────
path = 'lib/home/components/z_filter_list/z_filter_list_widget.dart'
with open(path, 'r', encoding='utf-8') as f:
    content = f.read()

before = content.count('500.0')
content = content.replace('500.0', '50000.0')
changes.append(f'  ✔  {path}: replaced {before} occurrences of 500.0 → 50000.0')

with open(path, 'w', encoding='utf-8') as f:
    f.write(content)

# ── 5. z_sort_price_by_widget.dart ────────────────────────────────────────
path = 'lib/home/register/components/z_sort_price_by/z_sort_price_by_widget.dart'
with open(path, 'r', encoding='utf-8') as f:
    content = f.read()

# max: 500.0 → 50000.0
old = '                    max: 500.0,'
new = '                    max: 50000.0,'
if old in content:
    content = content.replace(old, new, 1)
    changes.append(f'  ✔  {path}: slider max  500 → 50000')
else:
    changes.append(f'  ✘  {path}: slider max NOT FOUND; trying fallback')
    # fallback: any "max: 500.0"
    old2 = 'max: 500.0,'
    new2 = 'max: 50000.0,'
    if old2 in content:
        content = content.replace(old2, new2, 1)
        changes.append(f'  ✔  {path}: slider max replaced via fallback')
    else:
        changes.append(f'  ✘  {path}: slider max STILL NOT FOUND')

# divisions: 100 → 500  (for finer steps on 50 000 range)
old = '                    divisions: 100,'
new = '                    divisions: 500,'
if old in content:
    content = content.replace(old, new, 1)
    changes.append(f'  ✔  {path}: divisions  100 → 500')
else:
    changes.append(f'  ✘  {path}: divisions NOT FOUND')

with open(path, 'w', encoding='utf-8') as f:
    f.write(content)

# ── Summary ───────────────────────────────────────────────────────────────
print('\n=== Price Range Fix Summary ===')
for c in changes:
    print(c)
print('\nDONE')
