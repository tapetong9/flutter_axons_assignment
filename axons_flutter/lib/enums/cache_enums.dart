enum CacheEnum {
  isFirstLaunch('isFirstLaunch'),
  isLoggedIn('isLogin'),
  token('token');

  final String key;
  const CacheEnum(this.key);
}
