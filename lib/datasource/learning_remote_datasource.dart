import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_edspert/model/course_model_response.dart';

class CourseRemoteDataSource {
  Future<CourseResponse> getCourses()async{
     try {
      const url = "https://edspert.widyaedu.com/exercise/data_course?major_name=IPA&user_email=testerngbayu@gmail.com";

      final result = await Dio().get(url, options: Options(
        headers: {
          'x-api-key': '18be70c0-4e4d-44ff-a475-50c51ece99a0'
        }
      ));

      final bannerResponse = CourseResponse.fromJson(result.data);

      return bannerResponse;
    } catch (e, stacktrace) {
      log(e.toString(),
        stackTrace: stacktrace,
        error: e
      );
      rethrow;
    }
  }
}