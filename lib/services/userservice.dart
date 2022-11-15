import 'package:contactapp/db_helper/repository.dart';
import 'package:contactapp/model/user.dart';
import 'package:path_provider/path_provider.dart';

class UserService{
  late Repository _repository;
  UserService(){
    _repository = Repository();
  }
  //Save User
  SaveUser(User user)async{
    return await _repository.insertData("user", user.userMap());
  }
  //Read All Users
  readAllUsers() async{
    return await _repository.readData('user');
  }
}