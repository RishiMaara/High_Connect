import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/home/components/z_nawbar/z_nawbar_widget.dart';
import '/index.dart';

class Allcatagories2Widget extends StatefulWidget {
  const Allcatagories2Widget({super.key});

  static String routeName = 'Allcatagories2';
  static String routePath = '/allcatagories2';

  @override
  State<Allcatagories2Widget> createState() => _Allcatagories2WidgetState();
}

class _Allcatagories2WidgetState extends State<Allcatagories2Widget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  static const List<Map<String, dynamic>> categories = [
    {'t': 'Air Quality & Emissions Specialist', 'i': Icons.air},
    {'t': 'Airport Pavements & Airside Engineer', 'i': Icons.flight_takeoff},
    {'t': 'Architectural Engineer', 'i': Icons.architecture},
    {'t': 'Artificial Intelligence Technician', 'i': Icons.memory},
    {'t': 'Asphalt / Bitumen Specialist', 'i': Icons.layers},
    {'t': 'Asset Management Engineer', 'i': Icons.analytics},
    {'t': 'BIM Engineer', 'i': Icons.view_in_ar},
    {'t': 'Bridge Design Engineer', 'i': Icons.account_tree},
    {'t': 'Builder and Developers', 'i': Icons.business},
    {'t': 'Building Services Engineer', 'i': Icons.settings},
    {'t': 'CAD / Drafting Technician', 'i': Icons.draw},
    {'t': 'Climate Resilience Engineer', 'i': Icons.public},
    {'t': 'Coastal / Ocean Engineer', 'i': Icons.water},
    {'t': 'Computational Design Engineer', 'i': Icons.computer},
    {'t': 'Construction Engineer', 'i': Icons.construction},
    {'t': 'Construction Planner / Scheduler', 'i': Icons.schedule},
    {'t': 'Construction Project Manager', 'i': Icons.manage_accounts},
    {'t': 'Construction Robotics Specialist', 'i': Icons.smart_toy},
    {'t': 'Construction Tech Specialist', 'i': Icons.integration_instructions},
    {'t': 'Contracts & Commercial Engineer', 'i': Icons.attach_money},
    {'t': 'Corrosion & Durability Engineer', 'i': Icons.security},
    {'t': 'Dam and Reservoir Engineer', 'i': Icons.water_damage},
    {'t': 'Hydraulic Structures Engineer', 'i': Icons.storage},
    {'t': 'Digital Twin Engineer', 'i': Icons.copy},
    {'t': 'Drinking Water Consultant', 'i': Icons.local_drink},
    {'t': 'Electrical Engineer', 'i': Icons.electrical_services},
    {'t': 'Electrical Material Supplier', 'i': Icons.power},
    {'t': 'Electronic Accessories Supplier', 'i': Icons.cable},
    {'t': 'Elevation / 3D Designer', 'i': Icons.view_quilt},
    {'t': 'Environmental Compliance Specialist', 'i': Icons.gavel},
    {'t': 'Environmental Engineer', 'i': Icons.eco},
    {'t': 'Fabrication Consultant', 'i': Icons.build},
    {'t': 'Façade Engineer', 'i': Icons.dashboard},
    {'t': 'Field / QA Inspector', 'i': Icons.checklist},
    {'t': 'Floor Designer / Tile Supplier', 'i': Icons.square_foot},
    {'t': 'Foundation Engineer', 'i': Icons.foundation},
    {'t': 'Freight & Logistics Planner', 'i': Icons.local_shipping},
    {'t': 'GEM Consultant', 'i': Icons.account_balance},
    {'t': 'Geodetic Survey Engineer', 'i': Icons.explore},
    {'t': 'Geosynthetics Specialist', 'i': Icons.layers},
    {'t': 'Geotechnical Engineer', 'i': Icons.terrain},
    {'t': 'Geotechnical Risk Engineer', 'i': Icons.warning},
    {'t': 'Government Approved Civil Engineer', 'i': Icons.verified},
    {'t': 'Ground Improvement Specialist', 'i': Icons.trending_up},
    {'t': 'Groundwater Engineer', 'i': Icons.opacity},
    {'t': 'Harbour / Seaport Engineer', 'i': Icons.directions_boat},
    {'t': 'HSE Engineer', 'i': Icons.health_and_safety},
    {'t': 'High-Rise Building Specialist', 'i': Icons.apartment},
    {'t': 'Highway Design Engineer', 'i': Icons.alt_route},
    {'t': 'Hydraulic Engineer', 'i': Icons.waves},
    {'t': 'Hydrology / Flood Modeller', 'i': Icons.thunderstorm},
    {'t': 'ITS Engineer', 'i': Icons.traffic},
    {'t': 'Interior Design Engineer', 'i': Icons.chair},
    {'t': 'Irrigation Engineer', 'i': Icons.grass},
    {'t': 'Lab Testing Technician', 'i': Icons.science},
    {'t': 'Land Surveyor', 'i': Icons.map},
    {'t': 'Licensed Construction Engineer', 'i': Icons.engineering},
    {'t': 'Man Power Agency', 'i': Icons.people},
    {'t': 'Marine Structures Engineer', 'i': Icons.anchor},
    {'t': 'Material Supplier', 'i': Icons.inventory},
    {'t': 'Materials Engineer', 'i': Icons.biotech},
    {'t': 'Net-Zero Infrastructure Analyst', 'i': Icons.forest},
    {'t': 'NDT Specialist', 'i': Icons.search},
    {'t': 'Offshore Structure Engineer', 'i': Icons.oil_barrel},
    {'t': 'Painting Contractors', 'i': Icons.format_paint},
    {'t': 'Pavement Design Engineer', 'i': Icons.aspect_ratio},
    {'t': 'Photogrammetry Specialist', 'i': Icons.photo_camera},
    {'t': 'Pile & Deep Foundation Engineer', 'i': Icons.vertical_align_bottom},
    {'t': 'Pipeline Civil Engineer', 'i': Icons.swap_horiz},
    {'t': 'Precast Structures Engineer', 'i': Icons.grid_3x3},
    {'t': 'Prefabrication Specialist', 'i': Icons.dashboard},
    {'t': 'QA / QC Engineer', 'i': Icons.task_alt},
    {'t': 'Quantity Surveyor', 'i': Icons.calculate},
    {'t': 'Railway Civil Engineer', 'i': Icons.train},
    {'t': 'Registered Building Planner', 'i': Icons.description},
    {'t': 'Registered Structural Engineer', 'i': Icons.app_registration},
    {'t': 'Remote Sensing / UAV Specialist', 'i': Icons.satellite_alt},
    {'t': 'Retrofitting Engineer', 'i': Icons.upgrade},
    {'t': 'River Engineering Specialist', 'i': Icons.water},
    {'t': 'Rock Mechanics Engineer', 'i': Icons.landscape},
    {'t': 'Safety Engineer / Manager', 'i': Icons.safety_check},
    {'t': 'Site Engineer', 'i': Icons.supervisor_account},
    {'t': 'Site Monitoring / IoT Engineer', 'i': Icons.sensors},
    {'t': 'Skilled Workers', 'i': Icons.handyman},
    {'t': 'Slope Stability Engineer', 'i': Icons.terrain},
    {'t': 'Smart Cities Engineer', 'i': Icons.location_city},
    {'t': 'Soil Investigation Specialist', 'i': Icons.agriculture},
    {'t': 'Solar Panel Installation', 'i': Icons.solar_power},
    {'t': 'Solid Waste Management Engineer', 'i': Icons.delete},
    {'t': 'Steel Structures Engineer', 'i': Icons.view_column},
    {'t': 'Stormwater Design Engineer', 'i': Icons.water_drop},
    {'t': 'Structural Dynamics Specialist', 'i': Icons.vibration},
    {'t': 'Structural Engineer', 'i': Icons.apartment},
    {'t': 'Sustainable Infrastructure Consultant', 'i': Icons.eco},
    {'t': 'Temporary Works Engineer', 'i': Icons.timeline},
    {'t': 'Timber Structures Engineer', 'i': Icons.forest},
    {'t': 'Tunnel Engineer', 'i': Icons.horizontal_rule},
    {'t': 'Wastewater Treatment Engineer', 'i': Icons.clean_hands},
    {'t': 'Water Resources Engineer', 'i': Icons.water},
    {'t': 'Water Supply Engineer', 'i': Icons.water_damage},
    {'t': 'Real estate companies', 'i': Icons.real_estate_agent},
    {'t': 'Real estate mediators', 'i': Icons.handshake},
    {'t': 'Drinking water suppliers', 'i': Icons.water_drop},
    {'t': 'Water suppliers', 'i': Icons.water},
    {'t': 'Security Service Providers', 'i': Icons.security},
    {'t': 'Housekeeping services', 'i': Icons.cleaning_services},
    {'t': 'Plumbing and Wiring workers', 'i': Icons.plumbing},
    {'t': 'Catering services', 'i': Icons.restaurant_menu},
    {'t': 'Tiles and Floor accessories', 'i': Icons.grid_on},
    {'t': 'Event Organisers', 'i': Icons.event},
    {'t': 'Building Contractors', 'i': Icons.construction},
    {'t': 'Exterior house decorators', 'i': Icons.format_paint},
    {'t': 'Drivers And Acting drivers', 'i': Icons.drive_eta},
    {'t': 'Rental vehicles', 'i': Icons.car_rental},
    {'t': 'Home and Office Furniture\'s', 'i': Icons.chair},
    {'t': 'Finance- Loan lenders', 'i': Icons.account_balance},
    {'t': 'Government approved civil engineers', 'i': Icons.engineering},
    {'t': 'Registered building planners', 'i': Icons.architecture},
  ];

  List<Map<String, dynamic>> get filteredCategories {
    if (_searchQuery.isEmpty) return categories;
    return categories
        .where((c) => (c['t'] as String).toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          title: Text(
            'All Categories',
            style: FlutterFlowTheme.of(context).headlineSmall.override(
                  font: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                  ),
                  letterSpacing: 0.0,
                ),
          ),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(15.0, 12.0, 15.0, 12.0),
              child: Container(
                width: double.infinity,
                height: 50.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                      child: Icon(
                        Icons.search,
                        color: FlutterFlowTheme.of(context).primary,
                        size: 24.0,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 15.0, 0.0),
                        child: TextField(
                          controller: _searchController,
                          onChanged: (value) {
                            setState(() {
                              _searchQuery = value;
                            });
                          },
                          decoration: InputDecoration(
                            hintText: 'Search categories...',
                            hintStyle: FlutterFlowTheme.of(context).labelMedium,
                            border: InputBorder.none,
                          ),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ),
                    ),
                    if (_searchQuery.isNotEmpty)
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _searchController.clear();
                              _searchQuery = '';
                            });
                          },
                          child: Icon(
                            Icons.close,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 20.0,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            // Categories List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 15.0),
                itemCount: filteredCategories.length,
                itemBuilder: (context, index) {
                  final c = filteredCategories[index];
                  return _CategoryCard(
                    title: c['t'] as String,
                    icon: c['i'] as IconData,
                    onTap: () {
                      // Set selected category and navigate to services list
                      FFAppState().selectedCategories = [];
                      FFAppState().update(() {});
                      FFAppState().addToSelectedCategories(c['t'] as String);
                      FFAppState().update(() {});
                      context.pushNamed(ServicesListWidget.routeName);
                    },
                  );
                },
              ),
            ),
            // Bottom navbar for users
            ZNawbarWidget(),
          ],
        ),
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const _CategoryCard({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: const Color.fromRGBO(0, 0, 0, 0.05),
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  icon,
                  color: FlutterFlowTheme.of(context).info,
                  size: 22,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: FlutterFlowTheme.of(context).titleSmall.override(
                        font: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                        ),
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
