import 'package:retrofit/dio.dart';
import 'package:youtube_apis/api_result.dart';
import 'package:youtube_apis/network_exceptions.dart';
import 'package:youtube_apis/user.dart';
import 'package:youtube_apis/web_services.dart';

class MyRepo {
  final WebServices webServices;

  MyRepo(this.webServices);

  Future<ApiResult<List<User>>> getAllUsers() async {
    try {
      var response = await webServices.getAllUsers();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<User> getUserById(String userId) async {
    return await webServices.getUserById(userId);
  }

  Future<ApiResult<User>> createNewUser(User newUser) async {
    try {
      var response = await webServices.createNewUser(newUser,
          'Bearer 266011b7625eba47bb22d916cc895be80d09523c732855d150f2852347bda0ad');

      return ApiResult.success(response);
      
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<HttpResponse> deleteUser(String id) async {
    return await webServices.deleteUser(id,
        'Bearer 266011b7625eba47bb22d916cc895be80d09523c732855d150f2852347bda0ad');
  }
}
