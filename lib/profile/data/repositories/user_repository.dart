import 'package:recipe_app/core/client.dart';
import 'package:recipe_app/profile/data/models/user_model.dart';

class UserRepository {
  final ApiClient client;

  UserRepository({required this.client});

  UserModel? user;

  Future<UserModel> fetchUser(int userId) async {
    if (user != null) return user!;
    var rawUser = await client.fetchUser(userId);
    user = UserModel.fromJson(rawUser);
    return user!;
  }
}
