enum ServiceEnums {
  login('/login'),
  loginWithFacebook('/login/facebook'),
  loginWithGoogle('/login/google'),
  home('/home');

  final String path;
  const ServiceEnums(this.path);
}
