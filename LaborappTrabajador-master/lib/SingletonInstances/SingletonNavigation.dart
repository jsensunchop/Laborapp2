class SingletonNavigation {
  static final SingletonNavigation _instance = SingletonNavigation._internal();

  factory SingletonNavigation() => _instance;

  SingletonNavigation._internal() {
    currentIndex=0;
  }
  int currentIndex;
}