import 'package:firebase_auth/firebase_auth.dart';
import 'package:personal_financial_management/domain/models/user.dart';

class UserRepository {
  MyUser? user;

  Future<MyUser?> getUser() async {
    print("${FirebaseAuth.instance.currentUser} la user");
    MyUser user = MyUser.empty;
    return user;
  }
}
