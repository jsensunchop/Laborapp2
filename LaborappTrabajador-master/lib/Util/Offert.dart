
class Offert {

  List CurrentWorkers;
  String City;
  String Localidad;
  String Adress;
  String Date;
  String Hour;
  int WorkersNedeed;
  String Specialty;
  String SubSpecialty;
  String Id;
  String Comany;
  int Index;
  String EmployeeName;
  List Documents;

  List get currentWorkers => CurrentWorkers;

  setCurrentWorkers(List value) {
    CurrentWorkers = value;
  }

  String get city => City;

  setCity(String value) {
    City = value;
  }

  String get localidad => Localidad;

  setLocalidad(String value) {
    Localidad = value;
  }

  String get adress => Adress;

  setAdress(String value) {
    Adress = value;
  }

  String get date => Date;

  setDate(String value) {
    Date = value;
  }

  String get hour => Hour;

  setHour(String value) {
    Hour = value;
  }

  int get workersNedeed => WorkersNedeed;

  setWorkersNedeed(int value) {
    WorkersNedeed = value;
  }

  String get specialty => Specialty;

  setSpecialty(String value) {
    Specialty = value;
  }

  String get subSpecialty => SubSpecialty;

  setSubSpecialty(String value) {
    SubSpecialty = value;
  }

  String get id => Id;
  int get index => Index;

  Offert(
      this.CurrentWorkers,
      this.City,
      this.Localidad,
      this.Adress,
      this.Date,
      this.Hour,
      this.WorkersNedeed,
      this.Specialty,
      this.SubSpecialty,
      this.Index,
      this.Id,
      this.Comany,
      this.EmployeeName,
      this.Documents
      );

  set currentWorkers(List value) {
    CurrentWorkers = value;
  }

  set city(String value) {
    City = value;
  }

  set localidad(String value) {
    Localidad = value;
  }

  set adress(String value) {
    Adress = value;
  }

  set date(String value) {
    Date = value;
  }

  set hour(String value) {
    Hour = value;
  }

  set workersNedeed(int value) {
    WorkersNedeed = value;
  }

  set specialty(String value) {
    Specialty = value;
  }

  set subSpecialty(String value) {
    SubSpecialty = value;
  }
}