import 'package:easylearning/common/utils/http_utils.dart';

class CourseAPI {
  static courseList() async {
    var response = await HttpUtil().post(
      'api/courseList',
    );
    print(response.toString());
  }
}
