import 'package:personal_financial_management/domain/models/user.dart';

class UserRepository {
  User? user;

  Future<User?> getUser() async {
    return user;
  }
}
