import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalService {
  Future<bool> isLoggedIn();
}

class AuthLocalServiceImpl extends AuthLocalService {
  @override
  Future<bool> isLoggedIn() async {
    SharedPreferences sharedPrefs =await SharedPreferences.getInstance();
    var token = sharedPrefs.getString("token");
    if(token != null && token.isNotEmpty){
      return true;
    }else{
      return false;
    }
  }
}
