class SigninReqParams {
  final String email;
  final String password;

  SigninReqParams({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }
}
