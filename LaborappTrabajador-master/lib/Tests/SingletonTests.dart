import 'package:laborapp_trabajador/SingletonInstances/SingletonActiveOffers.dart';
import 'package:laborapp_trabajador/SingletonInstances/SingletonOffert.dart';
import 'package:laborapp_trabajador/SingletonInstances/SingletonWorker.dart';
import 'package:laborapp_trabajador/Util/Offert.dart';

class SingletonTest {
  static initOffertSingleton() {
    var offert = SingletonOffert();
    offert.setAdress("Kra 65B #45-26");
    offert.setCity("Bogota");
    offert.setLocalidad("Usaquen");
    offert.companyName = "CLAUDIA LAGOS";
    offert.setSpecialty("Pintura");
    offert.setsubSpecialty("Segunda Mano");
    offert.setWorkersNedeed(10);
    offert.documents =
        "Cedula, certificado alturas, examen medico, certificado de procuraduría, eps";
    offert.setDate("9/08/2019");
    offert.setHour("9.30 a.m");
    offert.id = "XDXD";
  }

  static initWorkerSingleton() {
    var worker = SingletonWorker();

    worker.name = "XIMENA LAGOS";
    worker.IdType = "CEDULA";
    worker.IdNumber = 123456789;
    worker.CelNumber = "+57 123456789";
    worker.Specialty = "Estuco";
    worker.SubSpecialty = "Resane";
    worker.pss = "123";
    worker.Calification = 5.0;
    worker.appCode = "0001";
    worker.localidad = "Suba";
  }

  static initOffers() {
    var singletonActiveOffersInstance = SingletonActiveOffers();
    var offert = SingletonOffert();

    var worker = SingletonWorker();

    for (int i = 0; i < 10; i++) {
      print("Iinit");
      print(offert.companyName);

      var algo = Offert(
        [],
        offert.city,
        offert.localidad,
        offert.adress,
        offert.date,
        offert.hour,
        offert.workersNedeed,
        offert.specialty,
        offert.subSpecialty,
        i,
        offert.id,
        offert.companyName,
        offert.employeeName,
      );
      if (algo == null) {
        print("nulo");
      } else {
        singletonActiveOffersInstance.activeOfferts.add(algo);
        print(singletonActiveOffersInstance.activeOfferts[i].Comany);
        print(singletonActiveOffersInstance.activeOfferts[i].Specialty);
        print(singletonActiveOffersInstance.activeOfferts[i].SubSpecialty);
        print(singletonActiveOffersInstance.activeOfferts[i].Localidad);
        print(singletonActiveOffersInstance.activeOfferts[i].Date);
      }
    }
  }
}
