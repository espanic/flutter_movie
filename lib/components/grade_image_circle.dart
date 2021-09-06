import 'package:flutter/material.dart';

class GradeImageCircle extends StatelessWidget {
  final int age;

  const GradeImageCircle(this.age);

  @override
  Widget build(BuildContext context) {
    MaterialColor color;
    if (age < 12) {
      color = Colors.green;
      return _gradeCircle(color, "all");
    } else if (age == 12) {
      color = Colors.blue;
    } else if (age == 15) {
      color = Colors.amber;
    } else {
      color = Colors.red;
    }
    return _gradeCircle(color, age);
  }
}

Container _gradeCircle(MaterialColor color, dynamic age) {
  return Container(
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      child: Text(
        "$age",
        style: TextStyle(color: Colors.white, fontSize: 10),
      ));
}
