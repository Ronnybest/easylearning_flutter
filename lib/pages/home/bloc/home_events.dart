import 'package:easylearning/common/entities/course.dart';

abstract class HomeEvents {
  const HomeEvents();
}

class HomeDots extends HomeEvents {
  final int index;
  const HomeDots(this.index) : super();
}

class HomePageCourseItem extends HomeEvents {
  const HomePageCourseItem(this.courseItem);
  final List<CourseItem> courseItem;
}
