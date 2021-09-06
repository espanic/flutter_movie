import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie/components/grade_image_circle.dart';
import 'package:flutter_movie/model/movies_response.dart';
import 'package:flutter_movie/pages/detail_page.dart';
import 'package:get/get.dart';

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) => _movieInfo(index),
        separatorBuilder: (context, index) => Divider(
              color: Colors.grey,
            ),
        itemCount: movieResponses.length);
  }

  Widget _movieInfo(int index) {
    MovieResponse movie = movieResponses[index];
    return InkWell(
      onTap: () {
        Get.to(() => DetailPage(movie.id));
      },
      child: Container(
        padding: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              movie.image,
              height: 120,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "${movie.title}",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 8),
                      GradeImageCircle(movie.grade),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text("평점 ${movie.userRating}"),
                      SizedBox(width: 10),
                      Text("예매순위 : ${movie.reservationGrade}"),
                      SizedBox(width: 10),
                      Text('예매율 : ${movie.reservationRate}')
                    ],
                  ),
                  SizedBox(height: 10),
                  Text("개봉일 : ${movie.date}"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
