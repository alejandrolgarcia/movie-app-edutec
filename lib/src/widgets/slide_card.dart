import 'package:flutter/material.dart';
import 'package:movie_app/src/models/movie.model.dart';

class SlideCard extends StatelessWidget {

  final List<Movie> movies;
  
  SlideCard({@required this.movies});

  @override
  Widget build(BuildContext context) {

    final _screenSize = MediaQuery.of(context).size;

    return Container(
      height: _screenSize.height * 0.50,
      child: PageView(
        controller: PageController(
          initialPage: 1,
          viewportFraction: 0.7
        ),
        children: _slide(),
      )
    );
  }

  List<Widget> _slide(){

    return movies.map( (movie) {
      return Container(
        margin: EdgeInsets.only(right: 15.0),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                image: NetworkImage(movie.getPosterImg()),
                placeholder: AssetImage('assets/img/no-image.jpg'),
                fit: BoxFit.cover,
                height: 425.0,
              )
            )
          ],
        ),
      );
    }).toList();

  }
}