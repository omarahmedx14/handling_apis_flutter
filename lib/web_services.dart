import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:retrofit/retrofit.dart';
import 'package:youtube_apis/user.dart';

part 'web_services.g.dart';

@RestApi(baseUrl: "https://gorest.co.in/public/v2/")
abstract class WebServices {
  factory WebServices(Dio dio, {String baseUrl}) = _WebServices;

  @GET('users')
  Future<List<User>> getAllUsers();

  @GET("users/{id}")
  Future<User> getUserById(@Path() String id);

  @POST("users")
  Future<User> createNewUser(
      @Body() User newuser, @Header('Authorization') String token);

  @DELETE("users/{id}")
  Future<HttpResponse> deleteUser(@Path() String id, @Header('Authorization') String token);
}
