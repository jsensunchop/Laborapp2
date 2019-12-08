class Offert {
  List _currentWorkers;
  String _city;
  String _localidad;
  String _adress;
  String _date;
  String _hour;
  int _workersNedeed;
  String _specialty;
  String _subSpecialty;
  String _id;
  String comany;
  int _index;
  String employeeName;

  List get currentWorkers => _currentWorkers;

  setCurrentWorkers(List value) {
    _currentWorkers = value;
  }

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

  setSubSpecialty(String value) {
    _subSpecialty = value;
  }

  String get id => _id;
  int get index => index;

  Offert(

    this._currentWorkers,
    this._city,
    this._localidad,
    this._adress,
    this._date,
    this._hour,
    this._workersNedeed,
    this._specialty,
    this._subSpecialty,
    this._index,
    this._id,
    this.comany,
    this.employeeName

      );

  set currentWorkers(List value) {
    _currentWorkers = value;
  }

  set city(String value) {
    _city = value;
  }

  set localidad(String value) {
    _localidad = value;
  }

  set adress(String value) {
    _adress = value;
  }

  set date(String value) {
    _date = value;
  }

  set hour(String value) {
    _hour = value;
  }

  set workersNedeed(int value) {
    _workersNedeed = value;
  }

  set specialty(String value) {
    _specialty = value;
  }

  set subSpecialty(String value) {
    _subSpecialty = value;
  }
}
