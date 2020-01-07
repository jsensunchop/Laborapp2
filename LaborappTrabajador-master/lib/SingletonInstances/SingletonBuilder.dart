class SingletonBuilder {
  static final SingletonBuilder _instance = SingletonBuilder._internal();

  factory SingletonBuilder() => _instance;

  SingletonBuilder._internal() {
    // init things inside this
  }

// Methods, variables ...
  String _companyName;
  String _employeeName;
  String _city;
  double _calification;
  String _incials;

  //setters
  setCompanyName(companyName) {
    this._companyName = companyName;
  }

  setEmployeeName(employeeName) {
    this._employeeName = employeeName;
  }

  setCity(city) {
    this._city = city;
  }

  setCalification(calification) {
    this._calification = calification;
  }

  setIncials(incials) {
    this._incials = incials;
  }

  //getters
  getCompanyName() {
    return this._companyName;
  }

  getEmployeeName() {
    return this._employeeName;
  }

  getCity() {
    return this._city;
  }

  getCalification() {
    return this._calification;
  }

  getIncials() {
    return this._incials;
  }
}
