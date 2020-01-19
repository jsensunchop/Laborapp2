class SingletonWorker {
  static final SingletonWorker _instance = SingletonWorker._internal();

  factory SingletonWorker() => _instance;

  SingletonWorker._internal() {
    // init things inside this
    City = 'BOGOTA';
    Active = true;
    documents = [];
    d = 0;
  }

// Methods, variables ...
  String name;
  String IdType;
  int IdNumber;
  String CelNumber;
  String Specialty;
  String SubSpecialty;
  String City;
  String pss;
  var Calification;
  String appCode;
  String localidad;
  bool Active;
  List<dynamic> documents;

  int d;
}
