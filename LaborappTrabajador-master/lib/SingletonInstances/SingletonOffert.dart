class SingletonOffert {
  static final SingletonOffert _instance = SingletonOffert._internal();

  factory SingletonOffert() => _instance;

  SingletonOffert._internal() {
    // init things inside this
  }

// Methods, variables ...

  setAllToNull() {
    _city = "";
    _localidad = "";
    _subSpecialty = "";
    _specialty = "";
    _workersNedeed = 0;
    _hour = "";
    _date = "";
    _adress = "";
    id = "";
    companyName = "";
  }

  String id;

  String documents;
  String _city;
  String _localidad;
  String _adress;
  String _date;
  String _hour;

  int _workersNedeed;
  int index;
  String _specialty;
  String _subSpecialty;
  String companyName;
  String employeeName;

  String get city => _city;

  setCity(String value) {
    _city = value;
  }

  String get localidad => _localidad;

  setLocalidad(String value) {
    _localidad = value;
  }

  String get adress => _adress;

  setAdress(String value) {
    _adress = value;
  }

  String get date => _date;

  setDate(String value) {
    _date = value;
  }

  String get hour => _hour;

  setHour(String value) {
    _hour = value;
  }

  int get workersNedeed => _workersNedeed;

  setWorkersNedeed(int value) {
    _workersNedeed = value;
  }

  String get specialty => _specialty;

  setSpecialty(String value) {
    _specialty = value;
  }

  String get subSpecialty => _subSpecialty;

  setsubSpecialty(String value) {
    _subSpecialty = value;
  }
}
