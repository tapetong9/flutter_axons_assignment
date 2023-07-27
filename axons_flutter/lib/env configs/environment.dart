import 'config_dev.dart';
import 'config_prod.dart';

abstract class BaseConfig {
  String get appName;
  String get apiHost;
}

class Environment {
  static final Environment _singleton = Environment._internal();
  BaseConfig? config;

  Environment._internal();

  factory Environment() {
    return _singleton;
  }

  void initConfig(String environment) {
    switch (environment) {
      case 'dev':
        config = DevConfig();
        break;
      case 'prod':
        config = ProdConfig();
        break;
      default:
        throw Exception('The environment `$environment` is not found, don' 't forget to set environment in launch.json');
    }
  }
}
