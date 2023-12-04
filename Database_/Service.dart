import 'package:myproject/Database_/model/usermodel.dart';
import 'package:myproject/Database_/repository.dart';

class Userservice {
  late Repository repository;

  Userservice() {
    //object innitialization
    repository = Repository();
  }

  saveuser(UserModel userModel) async {
    return await repository.insertdata('students', userModel!.UserMap());
  }

//read all data from user
  readuser() async {
    return await repository.getData('students');
  }

  updateUser(UserModel userModel) async {
    return await repository.updatedata('students', userModel.UserMap());
  }
}
