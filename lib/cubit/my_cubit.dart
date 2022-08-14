import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:youtube_apis/api_result.dart';
import 'package:youtube_apis/cubit/result_state.dart';
import 'package:youtube_apis/my_repo.dart';
import 'package:youtube_apis/network_exceptions.dart';
import 'package:youtube_apis/user.dart';

class MyCubit extends Cubit<ResultState<User>> {
  final MyRepo myRepo;
  MyCubit(this.myRepo) : super(const Idle());

  // void emitGetAllUsers() async {
  //   var data = await myRepo.getAllUsers();

  //   data.when(success: (List<User> allUsers) {
  //     emit(ResultState.success(allUsers));
  //   }, failure: (NetworkExceptions networkExceptions) {
  //     emit(ResultState.error(networkExceptions));
  //   });
  // }

  // void emitGetUserDetails(String userId) {
  //   myRepo.getUserById(userId).then((userDetails) {
  //     emit(GetUserDetails(userDetails));
  //   });
  // }

  void emitCreateNewUser(User newUser) async {
    var result = await myRepo.createNewUser(newUser);

    result.when(success: (User userData) {
      emit(ResultState.success(userData));
    }, failure: (NetworkExceptions networkExceptions) {
      emit(ResultState.error(networkExceptions));
    });
  }

  // void emitDeleteUser(String id) {
  //   myRepo.deleteUser(id).then((data) {
  //     emit(DeleteUser(data));
  //   });
  // }
}
