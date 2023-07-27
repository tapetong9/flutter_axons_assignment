import '../../enums/cache_enums.dart';
import '../network/dio_manager.dart';
import 'cache_manager.dart';

class AuthCacheManager {
  Future<bool> isFirstEntry() async {
    return !(await CacheManager.getBool(CacheEnum.isFirstLaunch.key) ?? false);
  }

  Future<bool> isLoggedIn() async {
    return (await CacheManager.getBool(CacheEnum.isLoggedIn.key)) ?? false;
  }

  Future<void> signOut() async {
    await CacheManager.clearAll();
  }

  Future<void> updateFirstEntry() async {
    await CacheManager.setBool(CacheEnum.isFirstLaunch.key, true);
  }

  Future<void> updateLoggedIn(bool isLoggedIn) async {
    await CacheManager.setBool(CacheEnum.isLoggedIn.key, isLoggedIn);
  }

  Future<void> updateToken(String? token) async {
    if (token != null) {
      await CacheManager.setString(CacheEnum.token.key, token);
      DioManager.instance.dio.options.headers[(MapEntry('Authorization', 'Bearer $token'))];

      /// Actually, we will not need it for this application.
      /// But I've included it here for instructive purposes.
    } else {
      if (await CacheManager.containsKey(CacheEnum.token.key)) {
        await CacheManager.remove(CacheEnum.token.key);
        DioManager.instance.dio.options.headers.clear();
      }
    }
  }

  Future<void> updateTokenFromStorage() async {
    if (await CacheManager.containsKey(CacheEnum.token.key)) {
      final token = await CacheManager.getString(CacheEnum.token.key);

      if (token != null) {
        DioManager.instance.dio.options.headers[(MapEntry('Authorization', 'Bearer $token'))];

        /// Actually, we will not need it for this application.
        /// But I've included it here for instructive purposes.
      }
    }
  }
}
