import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      if (prefs.containsKey('ff_selectedLang')) {
        try {
          final serializedData = prefs.getString('ff_selectedLang') ?? '{}';
          _selectedLang =
              LangDataStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          // Silently ignore decode errors for persisted data
        }
      }
    });
    _safeInit(() {
      _darkMode = prefs.getBool('ff_darkMode') ?? _darkMode;
    });
    _safeInit(() {
      _faceID = prefs.getBool('ff_faceID') ?? _faceID;
    });
    _safeInit(() {
      _touchID = prefs.getBool('ff_touchID') ?? _touchID;
    });
    _safeInit(() {
      _rememberMe = prefs.getBool('ff_rememberMe') ?? _rememberMe;
    });
    _safeInit(() {
      _googleAuthenticator =
          prefs.getBool('ff_googleAuthenticator') ?? _googleAuthenticator;
    });
    _safeInit(() {
      _notificationsSound =
          prefs.getBool('ff_notificationsSound') ?? _notificationsSound;
    });
    _safeInit(() {
      _notificationsVibration =
          prefs.getBool('ff_notificationsVibration') ?? _notificationsVibration;
    });
    _safeInit(() {
      _startHour = prefs.getInt('ff_startHour') ?? _startHour;
    });
    _safeInit(() {
      _startMin = prefs.getInt('ff_startMin') ?? _startMin;
    });
    _safeInit(() {
      _endHour = prefs.getInt('ff_endHour') ?? _endHour;
    });
    _safeInit(() {
      _endMin = prefs.getInt('ff_endMin') ?? _endMin;
    });
    _safeInit(() {
      _location = prefs.getBool('ff_location') ?? _location;
    });
    _safeInit(() {
      _cameraPhotos = prefs.getBool('ff_cameraPhotos') ?? _cameraPhotos;
    });
    _safeInit(() {
      _microphone = prefs.getBool('ff_microphone') ?? _microphone;
    });
    _safeInit(() {
      _storageAccess = prefs.getBool('ff_storageAccess') ?? _storageAccess;
    });
    _safeInit(() {
      _clearCache = prefs.getBool('ff_clearCache') ?? _clearCache;
    });
    _safeInit(() {
      _defaultBrowser = prefs.getInt('ff_defaultBrowser') ?? _defaultBrowser;
    });
    _safeInit(() {
      _smsAuthenticator =
          prefs.getBool('ff_smsAuthenticator') ?? _smsAuthenticator;
    });
    _safeInit(() {
      _bookingUpdates = prefs.getBool('ff_bookingUpdates') ?? _bookingUpdates;
    });
    _safeInit(() {
      _serviceProvider =
          prefs.getBool('ff_serviceProvider') ?? _serviceProvider;
    });
    _safeInit(() {
      _jobCompletion = prefs.getBool('ff_jobCompletion') ?? _jobCompletion;
    });
    _safeInit(() {
      _paymentNot = prefs.getBool('ff_paymentNot') ?? _paymentNot;
    });
    _safeInit(() {
      _invoiceReceipts =
          prefs.getBool('ff_invoiceReceipts') ?? _invoiceReceipts;
    });
    _safeInit(() {
      _reviewRequests = prefs.getBool('ff_reviewRequests') ?? _reviewRequests;
    });
    _safeInit(() {
      _reviewResponses =
          prefs.getBool('ff_reviewResponses') ?? _reviewResponses;
    });
    _safeInit(() {
      _promotions = prefs.getBool('ff_promotions') ?? _promotions;
    });
    _safeInit(() {
      _exclusiveDeals = prefs.getBool('ff_exclusiveDeals') ?? _exclusiveDeals;
    });
    _safeInit(() {
      _securityAlerts = prefs.getBool('ff_securityAlerts') ?? _securityAlerts;
    });
    _safeInit(() {
      _appUpdates = prefs.getBool('ff_appUpdates') ?? _appUpdates;
    });
    _safeInit(() {
      _favorite = prefs
              .getStringList('ff_favorite')
              ?.map((path) => path.ref)
              .toList() ??
          _favorite;
    });
    _safeInit(() {
      _PaymentMethod =
          prefs.getString('ff_PaymentMethod')?.ref ?? _PaymentMethod;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<LangDataStruct> _langList = [
    LangDataStruct.fromSerializableMap(jsonDecode(
        '{\"language\":\"English\",\"flag\":\"https://firebasestorage.googleapis.com/v0/b/infocus-1903c.firebasestorage.app/o/flags%2Fgreat_britain.png?alt=media&token=4065decd-2928-4f87-ba81-6dabdd17dde1\",\"langCode\":\"en\"}'))
  ];
  List<LangDataStruct> get langList => _langList;
  set langList(List<LangDataStruct> value) {
    _langList = value;
  }

  void addToLangList(LangDataStruct value) {
    langList.add(value);
  }

  void removeFromLangList(LangDataStruct value) {
    langList.remove(value);
  }

  void removeAtIndexFromLangList(int index) {
    langList.removeAt(index);
  }

  void updateLangListAtIndex(
    int index,
    LangDataStruct Function(LangDataStruct) updateFn,
  ) {
    langList[index] = updateFn(_langList[index]);
  }

  void insertAtIndexInLangList(int index, LangDataStruct value) {
    langList.insert(index, value);
  }

  LangDataStruct _selectedLang = LangDataStruct.fromSerializableMap(jsonDecode(
      '{\"language\":\"English\",\"flag\":\"https://firebasestorage.googleapis.com/v0/b/infocus-1903c.firebasestorage.app/o/flags%2Fgreat_britain.png?alt=media&token=4065decd-2928-4f87-ba81-6dabdd17dde1\",\"langCode\":\"en\"}'));
  LangDataStruct get selectedLang => _selectedLang;
  set selectedLang(LangDataStruct value) {
    _selectedLang = value;
    prefs.setString('ff_selectedLang', value.serialize());
  }

  void updateSelectedLangStruct(Function(LangDataStruct) updateFn) {
    updateFn(_selectedLang);
    prefs.setString('ff_selectedLang', _selectedLang.serialize());
  }

  String _tempSignupEmail = '';
  String get tempSignupEmail => _tempSignupEmail;
  set tempSignupEmail(String value) {
    _tempSignupEmail = value;
  }

  String _tempSignupPassword = '';
  String get tempSignupPassword => _tempSignupPassword;
  set tempSignupPassword(String value) {
    _tempSignupPassword = value;
  }

  String _Gender = '';
  String get Gender => _Gender;
  set Gender(String value) {
    _Gender = value;
  }

  String _rebuildPage = '';
  String get rebuildPage => _rebuildPage;
  set rebuildPage(String value) {
    _rebuildPage = value;
  }

  bool _darkMode = false;
  bool get darkMode => _darkMode;
  set darkMode(bool value) {
    _darkMode = value;
    prefs.setBool('ff_darkMode', value);
  }

  int _sortBy = 0;
  int get sortBy => _sortBy;
  set sortBy(int value) {
    _sortBy = value;
  }

  List<String> _serviceAspects = [];
  List<String> get serviceAspects => _serviceAspects;
  set serviceAspects(List<String> value) {
    _serviceAspects = value;
  }

  void addToServiceAspects(String value) {
    serviceAspects.add(value);
  }

  void removeFromServiceAspects(String value) {
    serviceAspects.remove(value);
  }

  void removeAtIndexFromServiceAspects(int index) {
    serviceAspects.removeAt(index);
  }

  void updateServiceAspectsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    serviceAspects[index] = updateFn(_serviceAspects[index]);
  }

  void insertAtIndexInServiceAspects(int index, String value) {
    serviceAspects.insert(index, value);
  }

  List<DocumentReference> _selectedNotificationa = [];
  List<DocumentReference> get selectedNotificationa => _selectedNotificationa;
  set selectedNotificationa(List<DocumentReference> value) {
    _selectedNotificationa = value;
  }

  void addToSelectedNotificationa(DocumentReference value) {
    selectedNotificationa.add(value);
  }

  void removeFromSelectedNotificationa(DocumentReference value) {
    selectedNotificationa.remove(value);
  }

  void removeAtIndexFromSelectedNotificationa(int index) {
    selectedNotificationa.removeAt(index);
  }

  void updateSelectedNotificationaAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    selectedNotificationa[index] = updateFn(_selectedNotificationa[index]);
  }

  void insertAtIndexInSelectedNotificationa(
      int index, DocumentReference value) {
    selectedNotificationa.insert(index, value);
  }

  bool _allNotifications = false;
  bool get allNotifications => _allNotifications;
  set allNotifications(bool value) {
    _allNotifications = value;
  }

  bool _faceID = false;
  bool get faceID => _faceID;
  set faceID(bool value) {
    _faceID = value;
    prefs.setBool('ff_faceID', value);
  }

  bool _touchID = false;
  bool get touchID => _touchID;
  set touchID(bool value) {
    _touchID = value;
    prefs.setBool('ff_touchID', value);
  }

  bool _rememberMe = false;
  bool get rememberMe => _rememberMe;
  set rememberMe(bool value) {
    _rememberMe = value;
    prefs.setBool('ff_rememberMe', value);
  }

  bool _googleAuthenticator = false;
  bool get googleAuthenticator => _googleAuthenticator;
  set googleAuthenticator(bool value) {
    _googleAuthenticator = value;
    prefs.setBool('ff_googleAuthenticator', value);
  }

  bool _notificationsSound = true;
  bool get notificationsSound => _notificationsSound;
  set notificationsSound(bool value) {
    _notificationsSound = value;
    prefs.setBool('ff_notificationsSound', value);
  }

  bool _notificationsVibration = true;
  bool get notificationsVibration => _notificationsVibration;
  set notificationsVibration(bool value) {
    _notificationsVibration = value;
    prefs.setBool('ff_notificationsVibration', value);
  }

  int _startHour = 0;
  int get startHour => _startHour;
  set startHour(int value) {
    _startHour = value;
    prefs.setInt('ff_startHour', value);
  }

  int _startMin = 0;
  int get startMin => _startMin;
  set startMin(int value) {
    _startMin = value;
    prefs.setInt('ff_startMin', value);
  }

  int _endHour = 0;
  int get endHour => _endHour;
  set endHour(int value) {
    _endHour = value;
    prefs.setInt('ff_endHour', value);
  }

  int _endMin = 0;
  int get endMin => _endMin;
  set endMin(int value) {
    _endMin = value;
    prefs.setInt('ff_endMin', value);
  }

  bool _location = true;
  bool get location => _location;
  set location(bool value) {
    _location = value;
    prefs.setBool('ff_location', value);
  }

  bool _cameraPhotos = true;
  bool get cameraPhotos => _cameraPhotos;
  set cameraPhotos(bool value) {
    _cameraPhotos = value;
    prefs.setBool('ff_cameraPhotos', value);
  }

  bool _microphone = false;
  bool get microphone => _microphone;
  set microphone(bool value) {
    _microphone = value;
    prefs.setBool('ff_microphone', value);
  }

  bool _storageAccess = true;
  bool get storageAccess => _storageAccess;
  set storageAccess(bool value) {
    _storageAccess = value;
    prefs.setBool('ff_storageAccess', value);
  }

  bool _clearCache = true;
  bool get clearCache => _clearCache;
  set clearCache(bool value) {
    _clearCache = value;
    prefs.setBool('ff_clearCache', value);
  }

  int _defaultBrowser = 0;
  int get defaultBrowser => _defaultBrowser;
  set defaultBrowser(int value) {
    _defaultBrowser = value;
    prefs.setInt('ff_defaultBrowser', value);
  }

  String _feedbackType = '';
  String get feedbackType => _feedbackType;
  set feedbackType(String value) {
    _feedbackType = value;
  }

  bool _smsAuthenticator = false;
  bool get smsAuthenticator => _smsAuthenticator;
  set smsAuthenticator(bool value) {
    _smsAuthenticator = value;
    prefs.setBool('ff_smsAuthenticator', value);
  }

  bool _bookingUpdates = true;
  bool get bookingUpdates => _bookingUpdates;
  set bookingUpdates(bool value) {
    _bookingUpdates = value;
    prefs.setBool('ff_bookingUpdates', value);
  }

  bool _serviceProvider = false;
  bool get serviceProvider => _serviceProvider;
  set serviceProvider(bool value) {
    _serviceProvider = value;
    prefs.setBool('ff_serviceProvider', value);
  }

  bool _jobCompletion = false;
  bool get jobCompletion => _jobCompletion;
  set jobCompletion(bool value) {
    _jobCompletion = value;
    prefs.setBool('ff_jobCompletion', value);
  }

  bool _paymentNot = true;
  bool get paymentNot => _paymentNot;
  set paymentNot(bool value) {
    _paymentNot = value;
    prefs.setBool('ff_paymentNot', value);
  }

  bool _invoiceReceipts = true;
  bool get invoiceReceipts => _invoiceReceipts;
  set invoiceReceipts(bool value) {
    _invoiceReceipts = value;
    prefs.setBool('ff_invoiceReceipts', value);
  }

  bool _reviewRequests = true;
  bool get reviewRequests => _reviewRequests;
  set reviewRequests(bool value) {
    _reviewRequests = value;
    prefs.setBool('ff_reviewRequests', value);
  }

  bool _reviewResponses = true;
  bool get reviewResponses => _reviewResponses;
  set reviewResponses(bool value) {
    _reviewResponses = value;
    prefs.setBool('ff_reviewResponses', value);
  }

  bool _promotions = false;
  bool get promotions => _promotions;
  set promotions(bool value) {
    _promotions = value;
    prefs.setBool('ff_promotions', value);
  }

  bool _exclusiveDeals = false;
  bool get exclusiveDeals => _exclusiveDeals;
  set exclusiveDeals(bool value) {
    _exclusiveDeals = value;
    prefs.setBool('ff_exclusiveDeals', value);
  }

  bool _securityAlerts = true;
  bool get securityAlerts => _securityAlerts;
  set securityAlerts(bool value) {
    _securityAlerts = value;
    prefs.setBool('ff_securityAlerts', value);
  }

  bool _appUpdates = false;
  bool get appUpdates => _appUpdates;
  set appUpdates(bool value) {
    _appUpdates = value;
    prefs.setBool('ff_appUpdates', value);
  }

  bool _forgotPassword = false;
  bool get forgotPassword => _forgotPassword;
  set forgotPassword(bool value) {
    _forgotPassword = value;
  }

  LatLng? _filterPlace1 = LatLng(40.7127753, -74.0059728);
  LatLng? get filterPlace1 => _filterPlace1;
  set filterPlace1(LatLng? value) {
    _filterPlace1 = value;
  }

  LatLng? _filterPlace2 = LatLng(40.7127753, -74.0059728);
  LatLng? get filterPlace2 => _filterPlace2;
  set filterPlace2(LatLng? value) {
    _filterPlace2 = value;
  }

  double _Within = 0.0;
  double get Within => _Within;
  set Within(double value) {
    _Within = value;
  }

  List<DocumentReference> _favorite = [];
  List<DocumentReference> get favorite => _favorite;
  set favorite(List<DocumentReference> value) {
    _favorite = value;
    prefs.setStringList('ff_favorite', value.map((x) => x.path).toList());
  }

  void addToFavorite(DocumentReference value) {
    favorite.add(value);
    prefs.setStringList('ff_favorite', _favorite.map((x) => x.path).toList());
  }

  void removeFromFavorite(DocumentReference value) {
    favorite.remove(value);
    prefs.setStringList('ff_favorite', _favorite.map((x) => x.path).toList());
  }

  void removeAtIndexFromFavorite(int index) {
    favorite.removeAt(index);
    prefs.setStringList('ff_favorite', _favorite.map((x) => x.path).toList());
  }

  void updateFavoriteAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    favorite[index] = updateFn(_favorite[index]);
    prefs.setStringList('ff_favorite', _favorite.map((x) => x.path).toList());
  }

  void insertAtIndexInFavorite(int index, DocumentReference value) {
    favorite.insert(index, value);
    prefs.setStringList('ff_favorite', _favorite.map((x) => x.path).toList());
  }

  List<String> _roomsQuantity = [];
  List<String> get roomsQuantity => _roomsQuantity;
  set roomsQuantity(List<String> value) {
    _roomsQuantity = value;
  }

  void addToRoomsQuantity(String value) {
    roomsQuantity.add(value);
  }

  void removeFromRoomsQuantity(String value) {
    roomsQuantity.remove(value);
  }

  void removeAtIndexFromRoomsQuantity(int index) {
    roomsQuantity.removeAt(index);
  }

  void updateRoomsQuantityAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    roomsQuantity[index] = updateFn(_roomsQuantity[index]);
  }

  void insertAtIndexInRoomsQuantity(int index, String value) {
    roomsQuantity.insert(index, value);
  }

  double _promoCode = 1.0;
  double get promoCode => _promoCode;
  set promoCode(double value) {
    _promoCode = value;
  }

  DocumentReference? _selectedService =
      FirebaseFirestore.instance.doc('/services/123');
  DocumentReference? get selectedService => _selectedService;
  set selectedService(DocumentReference? value) {
    _selectedService = value;
  }

  int _workingHours = 0;
  int get workingHours => _workingHours;
  set workingHours(int value) {
    _workingHours = value;
  }

  DateTime? _bookingStartDate =
      DateTime.fromMillisecondsSinceEpoch(1740918960000);
  DateTime? get bookingStartDate => _bookingStartDate;
  set bookingStartDate(DateTime? value) {
    _bookingStartDate = value;
  }

  List<ServiceOfferingsStruct> _selectedOfferings = [];
  List<ServiceOfferingsStruct> get selectedOfferings => _selectedOfferings;
  set selectedOfferings(List<ServiceOfferingsStruct> value) {
    _selectedOfferings = value;
  }

  void addToSelectedOfferings(ServiceOfferingsStruct value) {
    selectedOfferings.add(value);
  }

  void removeFromSelectedOfferings(ServiceOfferingsStruct value) {
    selectedOfferings.remove(value);
  }

  void removeAtIndexFromSelectedOfferings(int index) {
    selectedOfferings.removeAt(index);
  }

  void updateSelectedOfferingsAtIndex(
    int index,
    ServiceOfferingsStruct Function(ServiceOfferingsStruct) updateFn,
  ) {
    selectedOfferings[index] = updateFn(_selectedOfferings[index]);
  }

  void insertAtIndexInSelectedOfferings(
      int index, ServiceOfferingsStruct value) {
    selectedOfferings.insert(index, value);
  }

  double _serviceTotalPrice = 0.0;
  double get serviceTotalPrice => _serviceTotalPrice;
  set serviceTotalPrice(double value) {
    _serviceTotalPrice = value;
  }

  String _selectedOptions = '';
  String get selectedOptions => _selectedOptions;
  set selectedOptions(String value) {
    _selectedOptions = value;
  }

  DocumentReference? _PaymentMethod =
      FirebaseFirestore.instance.doc('/payment_methods/123');
  DocumentReference? get PaymentMethod => _PaymentMethod;
  set PaymentMethod(DocumentReference? value) {
    _PaymentMethod = value;
    value != null
        ? prefs.setString('ff_PaymentMethod', value.path)
        : prefs.remove('ff_PaymentMethod');
  }

  double _PriceByStart = 0.0;
  double get PriceByStart => _PriceByStart;
  set PriceByStart(double value) {
    _PriceByStart = value;
  }

  double _PriceByEnd = 50000.0;
  double get PriceByEnd => _PriceByEnd;
  set PriceByEnd(double value) {
    _PriceByEnd = value;
  }

  double _RatingsBy = 0.0;
  double get RatingsBy => _RatingsBy;
  set RatingsBy(double value) {
    _RatingsBy = value;
  }

  List<String> _selectedCategories = [];
  List<String> get selectedCategories => _selectedCategories;
  set selectedCategories(List<String> value) {
    _selectedCategories = value;
  }

  void addToSelectedCategories(String value) {
    selectedCategories.add(value);
  }

  void removeFromSelectedCategories(String value) {
    selectedCategories.remove(value);
  }

  void removeAtIndexFromSelectedCategories(int index) {
    selectedCategories.removeAt(index);
  }

  void updateSelectedCategoriesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    selectedCategories[index] = updateFn(_selectedCategories[index]);
  }

  void insertAtIndexInSelectedCategories(int index, String value) {
    selectedCategories.insert(index, value);
  }

  AvailableTimeStruct _availableTime = AvailableTimeStruct();
  AvailableTimeStruct get availableTime => _availableTime;
  set availableTime(AvailableTimeStruct value) {
    _availableTime = value;
  }

  void updateAvailableTimeStruct(Function(AvailableTimeStruct) updateFn) {
    updateFn(_availableTime);
  }

  AvailableTimeStruct _newAvailableTime = AvailableTimeStruct();
  AvailableTimeStruct get newAvailableTime => _newAvailableTime;
  set newAvailableTime(AvailableTimeStruct value) {
    _newAvailableTime = value;
  }

  void updateNewAvailableTimeStruct(Function(AvailableTimeStruct) updateFn) {
    updateFn(_newAvailableTime);
  }

  bool _updateApp = false;
  bool get updateApp => _updateApp;
  set updateApp(bool value) {
    _updateApp = value;
  }

  int _NavBar = 0;
  int get NavBar => _NavBar;
  set NavBar(int value) {
    _NavBar = value;
  }

  // Booking dot indicator - shows when new bookings arrive
  bool _hasNewBookings = false;
  bool get hasNewBookings => _hasNewBookings;
  set hasNewBookings(bool value) {
    _hasNewBookings = value;
    notifyListeners();
  }

  // Timestamp of last time user viewed bookings (to detect new ones)
  DateTime? _lastBookingsViewTime;
  DateTime? get lastBookingsViewTime => _lastBookingsViewTime;
  set lastBookingsViewTime(DateTime? value) {
    _lastBookingsViewTime = value;
  }

  String _serviceHeadline = '';
  String get serviceHeadline => _serviceHeadline;
  set serviceHeadline(String value) {
    _serviceHeadline = value;
  }

  String _serviceDescription = '';
  String get serviceDescription => _serviceDescription;
  set serviceDescription(String value) {
    _serviceDescription = value;
  }

  String _serviceCover = '';
  String get serviceCover => _serviceCover;
  set serviceCover(String value) {
    _serviceCover = value;
  }

  List<AvailableTimeStruct> _serviceAvailableTime = [];
  List<AvailableTimeStruct> get serviceAvailableTime => _serviceAvailableTime;
  set serviceAvailableTime(List<AvailableTimeStruct> value) {
    _serviceAvailableTime = value;
  }

  void addToServiceAvailableTime(AvailableTimeStruct value) {
    serviceAvailableTime.add(value);
  }

  void removeFromServiceAvailableTime(AvailableTimeStruct value) {
    serviceAvailableTime.remove(value);
  }

  void removeAtIndexFromServiceAvailableTime(int index) {
    serviceAvailableTime.removeAt(index);
  }

  void updateServiceAvailableTimeAtIndex(
    int index,
    AvailableTimeStruct Function(AvailableTimeStruct) updateFn,
  ) {
    serviceAvailableTime[index] = updateFn(_serviceAvailableTime[index]);
  }

  void insertAtIndexInServiceAvailableTime(
      int index, AvailableTimeStruct value) {
    serviceAvailableTime.insert(index, value);
  }

  bool _isAuthLoading = false;
  bool get isAuthLoading => _isAuthLoading;
  set isAuthLoading(bool value) {
    _isAuthLoading = value;
    notifyListeners();
  }

  List<DateTime> _serviceAvailableDay = [];
  List<DateTime> get serviceAvailableDay => _serviceAvailableDay;
  set serviceAvailableDay(List<DateTime> value) {
    _serviceAvailableDay = value;
  }

  void addToServiceAvailableDay(DateTime value) {
    serviceAvailableDay.add(value);
  }

  void removeFromServiceAvailableDay(DateTime value) {
    serviceAvailableDay.remove(value);
  }

  void removeAtIndexFromServiceAvailableDay(int index) {
    serviceAvailableDay.removeAt(index);
  }

  void updateServiceAvailableDayAtIndex(
    int index,
    DateTime Function(DateTime) updateFn,
  ) {
    serviceAvailableDay[index] = updateFn(_serviceAvailableDay[index]);
  }

  void insertAtIndexInServiceAvailableDay(int index, DateTime value) {
    serviceAvailableDay.insert(index, value);
  }

  AddressStruct _serviceAddress = AddressStruct();
  AddressStruct get serviceAddress => _serviceAddress;
  set serviceAddress(AddressStruct value) {
    _serviceAddress = value;
  }

  void updateServiceAddressStruct(Function(AddressStruct) updateFn) {
    updateFn(_serviceAddress);
  }

  List<String> _servicePortfolio = [];
  List<String> get servicePortfolio => _servicePortfolio;
  set servicePortfolio(List<String> value) {
    _servicePortfolio = value;
  }

  void addToServicePortfolio(String value) {
    servicePortfolio.add(value);
  }

  void removeFromServicePortfolio(String value) {
    servicePortfolio.remove(value);
  }

  void removeAtIndexFromServicePortfolio(int index) {
    servicePortfolio.removeAt(index);
  }

  void updateServicePortfolioAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    servicePortfolio[index] = updateFn(_servicePortfolio[index]);
  }

  void insertAtIndexInServicePortfolio(int index, String value) {
    servicePortfolio.insert(index, value);
  }

  List<String> _serviceOfferings = [];
  List<String> get serviceOfferings => _serviceOfferings;
  set serviceOfferings(List<String> value) {
    _serviceOfferings = value;
  }

  void addToServiceOfferings(String value) {
    serviceOfferings.add(value);
  }

  void removeFromServiceOfferings(String value) {
    serviceOfferings.remove(value);
  }

  void removeAtIndexFromServiceOfferings(int index) {
    serviceOfferings.removeAt(index);
  }

  void updateServiceOfferingsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    serviceOfferings[index] = updateFn(_serviceOfferings[index]);
  }

  void insertAtIndexInServiceOfferings(int index, String value) {
    serviceOfferings.insert(index, value);
  }

  List<ServiceOfferingsStruct> _selectedServiceOfferings = [];
  List<ServiceOfferingsStruct> get selectedServiceOfferings =>
      _selectedServiceOfferings;
  set selectedServiceOfferings(List<ServiceOfferingsStruct> value) {
    _selectedServiceOfferings = value;
  }

  void addToSelectedServiceOfferings(ServiceOfferingsStruct value) {
    selectedServiceOfferings.add(value);
  }

  void removeFromSelectedServiceOfferings(ServiceOfferingsStruct value) {
    selectedServiceOfferings.remove(value);
  }

  void removeAtIndexFromSelectedServiceOfferings(int index) {
    selectedServiceOfferings.removeAt(index);
  }

  void updateSelectedServiceOfferingsAtIndex(
    int index,
    ServiceOfferingsStruct Function(ServiceOfferingsStruct) updateFn,
  ) {
    selectedServiceOfferings[index] =
        updateFn(_selectedServiceOfferings[index]);
  }

  void insertAtIndexInSelectedServiceOfferings(
      int index, ServiceOfferingsStruct value) {
    selectedServiceOfferings.insert(index, value);
  }

  double _serviceHourlyRate = 0.0;
  double get serviceHourlyRate => _serviceHourlyRate;
  set serviceHourlyRate(double value) {
    _serviceHourlyRate = value;
  }

  DocumentReference? _serviceCategory =
      FirebaseFirestore.instance.doc('/categories/111');
  DocumentReference? get serviceCategory => _serviceCategory;
  set serviceCategory(DocumentReference? value) {
    _serviceCategory = value;
  }

  ServicePaymentStruct _servicePayment = ServicePaymentStruct();
  ServicePaymentStruct get servicePayment => _servicePayment;
  set servicePayment(ServicePaymentStruct value) {
    _servicePayment = value;
  }

  void updateServicePaymentStruct(Function(ServicePaymentStruct) updateFn) {
    updateFn(_servicePayment);
  }
  bool _hasPromptedAddress = false;
  bool get hasPromptedAddress => _hasPromptedAddress;
  set hasPromptedAddress(bool value) {
    _hasPromptedAddress = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}
