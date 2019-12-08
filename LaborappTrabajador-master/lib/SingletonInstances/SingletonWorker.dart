class SingletonWorker {
  static final SingletonWorker _instance = SingletonWorker._internal();

  factory SingletonWorker() => _instance;

  SingletonWorker._internal() {
    // init things inside this
  }

// Methods, variables ...
  String name;
  String IdType;
  int IdNumber;
  String CelNumber;
  String Specialty;
  String SubSpecialty;
  String pss;
  var Calification;
  String appCode;
  String localidad;
  String specialty;
  String subSpecialty;
}
