import 'environment.dart';

class ProdConfig implements BaseConfig {
  @override
  String get appName => 'Axons';

  @override
  String get apiHost => 'https://www.axonstech.com';
}
