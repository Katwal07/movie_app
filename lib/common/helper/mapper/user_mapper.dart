import 'package:movie_app/data/auth/models/user.dart';
import 'package:movie_app/domain/auth/entity/user.dart';

class UserMapper {
  static UserEntity toEntity(UserModel model) {
    return UserEntity(
      id: model.id,
      email: model.email,
      image: model.image,
      token: model.token,
    );
  }
}
