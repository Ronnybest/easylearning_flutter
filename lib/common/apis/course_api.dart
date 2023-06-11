import 'package:easylearning/common/entities/course.dart';
import 'package:easylearning/common/utils/http_utils.dart';

class CourseAPI {
  static Future<CourseListResponseEntity> courseList() async {
    var response = await HttpUtil().post(
      'api/courseList',
    );
    print(response.toString());
    return CourseListResponseEntity.fromJson(response);
  }
}
