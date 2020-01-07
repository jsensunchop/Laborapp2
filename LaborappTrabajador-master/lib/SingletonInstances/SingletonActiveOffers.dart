import 'package:laborapp_trabajador/Util/Offert.dart';

class SingletonActiveOffers {
  static final SingletonActiveOffers _instance =
      SingletonActiveOffers._internal();

  factory SingletonActiveOffers() => _instance;

  List<Offert> activeOfferts = [];

  SingletonActiveOffers._internal() {
    // init things inside this
    activeOfferts = [];
  }
}
