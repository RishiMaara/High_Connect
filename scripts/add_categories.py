import sys

file_path = r'd:\Downloads\Code Black\planb-flutterflow\lib\home\allcatagories2\allcatagories2_widget.dart'

categories_to_add = [
    {'t': 'Real estate companies', 'i': 'Icons.real_estate_agent'},
    {'t': 'Real estate mediators', 'i': 'Icons.handshake'},
    {'t': 'Drinking water suppliers', 'i': 'Icons.water_drop'},
    {'t': 'Water suppliers', 'i': 'Icons.water'},
    {'t': 'Security Service Providers', 'i': 'Icons.security'},
    {'t': 'Housekeeping services', 'i': 'Icons.cleaning_services'},
    {'t': 'Plumbing and Wiring workers', 'i': 'Icons.plumbing'},
    {'t': 'Catering services', 'i': 'Icons.restaurant_menu'},
    {'t': 'Tiles and Floor accessories', 'i': 'Icons.grid_on'},
    {'t': 'Event Organisers', 'i': 'Icons.event'},
    {'t': 'Building Contractors', 'i': 'Icons.construction'},
    {'t': 'Exterior house decorators', 'i': 'Icons.format_paint'},
    {'t': 'Drivers And Acting drivers', 'i': 'Icons.drive_eta'},
    {'t': 'Rental vehicles', 'i': 'Icons.car_rental'},
    {'t': "Home and Office Furniture's", 'i': 'Icons.chair'},
    {'t': 'Finance- Loan lenders', 'i': 'Icons.account_balance'},
    {'t': 'Government approved civil engineers', 'i': 'Icons.engineering'},
    {'t': 'Registered building planners', 'i': 'Icons.architecture'}
]

with open(file_path, 'r', encoding='utf-8') as f:
    content = f.read()

# build lines
lines_to_add = []
for c in categories_to_add:
    t = c['t'].replace("'", "\\'")
    lines_to_add.append(f"    {{'t': '{t}', 'i': {c['i']}}},")

lines_str = "\n".join(lines_to_add)

target_str = "    {'t': 'Water Supply Engineer', 'i': Icons.water_damage},\n  ];"
if target_str not in content:
    print('Failed to find target')
else:
    new_content = content.replace(target_str, "    {'t': 'Water Supply Engineer', 'i': Icons.water_damage},\n" + lines_str + "\n  ];")
    with open(file_path, 'w', encoding='utf-8') as f:
        f.write(new_content)
    print('Success adding categories to allcatagories2 widget!')
