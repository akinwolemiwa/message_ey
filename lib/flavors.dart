enum Flavor {
  development,
  staging,
  production,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.development:
        return 'Message App - Dev';
      case Flavor.staging:
        return 'Message App - Staging';
      case Flavor.production:
        return 'Message App';
      default:
        return 'title';
    }
  }

  static String get baseUrl {
    switch (appFlavor) {
      case Flavor.development:
        return 'https://flutter-assessment-backend-rioz.onrender.com/api/v1/';
      case Flavor.staging:
        return 'https://flutter-assessment-backend-rioz.onrender.com/api/v1/';
      case Flavor.production:
        return 'https://flutter-assessment-backend-rioz.onrender.com/api/v1/';
      default:
        return 'baseUrl';
    }
  }
}
