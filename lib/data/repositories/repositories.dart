
import '../../local/db/local_database.dart';
import '../models/user_model.dart';

class UserRepository{
  UserRepository();


  Future<void> addUser({required UserModel userModel})async{
    await LocalDatabase.insertUser(userModel);
  }

  Future<List<UserModel>> getUsers()async{
    return LocalDatabase.getAllUsers();
  }

  Future<void> deleteUser({required int id})async{
    await LocalDatabase.deleteUser(id);
  }

  Future<void> updateUser({required UserModel userModel})async{
    await LocalDatabase.updateUser(userModel: userModel);
  }

}