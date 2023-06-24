import 'package:easylearning/common/entities/course.dart';

class HomeStates {
  const HomeStates({
    this.index = 0,
    this.courseItem = const <CourseItem>[],
  });

  final int index;
  final List<CourseItem> courseItem;

  HomeStates copyWith({int? index, List<CourseItem>? courseItem}) {
    return HomeStates(
      index: index ?? this.index,
      courseItem: courseItem ?? this.courseItem,
    );
  }
}
