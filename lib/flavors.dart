enum Flavor {
  dev,
  pro,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'Tech Labs Dev';
      case Flavor.pro:
        return 'Tech Labs';
      default:
        return 'Tech Labs';
    }
  }

}
