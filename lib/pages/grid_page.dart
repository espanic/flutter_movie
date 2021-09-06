import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie/components/grade_image_circle.dart';
import 'package:flutter_movie/movies_response.dart';

class GridPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.vertical,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 9 / 16,
      ),
      itemCount: movieResponses.length,
      itemBuilder: (context, index) => _buildGridItem(index),
    );
  }

  Widget _buildGridItem(int index) {
    MovieResponse movie = movieResponses[index];
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Image.network(
                  movie.image,
                  fit: BoxFit.fill,
                  width: double.infinity,
                  height: double.infinity,
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: GradeImageCircle(movie.grade),
                )
              ],
            ),
          ),
          SizedBox(height: 8),
          FittedBox(
            child: Text(
              '${movie.title}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          Text(
              '${movie.reservationGrade}위(${movie.userRating}) / ${movie.reservationRate}%'),
          SizedBox(height: 8),
          Text('${movie.date}'),
        ],
      ),
    );
  }
}
