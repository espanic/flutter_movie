import 'package:flutter/material.dart';
import 'package:flutter_movie/model/movies_response.dart';
import 'package:intl/intl.dart';

class DetailPage extends StatelessWidget {
  final String id;
  const DetailPage(this.id);

  @override
  Widget build(BuildContext context) {
    MovieResponse movie =
        movieResponses.firstWhere((element) => element.id == id);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("${movie.title}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Row(
              children: [
                Image.network(
                  movie.image,
                  height: 220,
                  fit: BoxFit.fill,
                ),
                SizedBox(width: 10),
                _buildMovieSummaryTextColumn(movie),
              ],
            ),
            SizedBox(width: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildReservationRate(movie),
                _buildUserRating(movie),
                _buildAudience(movie),
              ],
            ),
            Divider(),
            _buildMovieSynopsis(movie),
          ],
        ),
      ),
    );
  }

  Widget _buildMovieSummaryTextColumn(MovieResponse movie) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${movie.title}",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Text("${movie.date} 개봉"),
        Text("${movie.genre} / ${movie.duration}분")
      ],
    );
  }

  Widget _buildReservationRate(MovieResponse movie) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          "예매율",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Text('${movie.reservationGrade}위 ${movie.reservationRate.toString()}%')
      ],
    );
  }

  Widget _buildUserRating(MovieResponse movie) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          "평점",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Text('${movie.userRating / 2}'),
      ],
    );
  }

  Widget _buildAudience(MovieResponse movie) {
    final numberFormatter = NumberFormat.decimalPattern();
    return Column(
      children: [
        Text(
          "누적관객수",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Text('${numberFormatter.format(movie.audience)}'),
      ],
    );
  }

  Widget _buildMovieSynopsis(MovieResponse movie) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 10),
          child: Text(
            '줄거리',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 16, top: 10, bottom: 5),
          child: Text('${movie.synopsis}'),
        )
      ],
    );
  }

  Widget _buildMovieCast(MovieResponse movie) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          width: double.infinity,
          child: Text(
            '줄거리',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 16, top: 10, bottom: 5),
          child: Text('${movie.synopsis}'),
        )
      ],
    );
  }
}
