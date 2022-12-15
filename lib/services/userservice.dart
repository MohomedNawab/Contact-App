import 'package:contactapp/db_helper/repository.dart';
import 'package:contactapp/model/user.dart';

class UserService {
  late Repository _repository;
  UserService() {
    _repository = Repository();
  }
  //Save User
  // ignore: non_constant_identifier_names
  SaveUser(User user) async {
    return await _repository.insertData("user", user.userMap());
  }

  //Read All Users
  readAllUsers() async {
    return await _repository.readData("user");
  }

  UpdateUser(User user) async {
    return await _repository.updateData('user', user.userMap());
  }

  deleteUser(userId) async {
    return await _repository.deleteDataById('user', userId);
  }
}
