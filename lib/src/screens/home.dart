import 'package:flutter/material.dart';
import 'package:movie_app/src/api/tmdb.api.dart';
import 'package:movie_app/src/models/result.model.dart';
import 'package:movie_app/src/widgets/horizontal_card.dart';
import 'package:movie_app/src/widgets/slide_card.dart';

class Home extends StatelessWidget {
  
  final TmbdApi _api = TmbdApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: CustomScrollView(
          slivers: <Widget>[

            SliverAppBar(
              backgroundColor: Colors.deepPurple,
              title: Text('Cinepolito'),
              floating: true,
              pinned: false,
              actions: [
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: (){}
                )
              ],
            ),

            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'Movies',
                      style: Theme.of(context).textTheme.headline6
                    )
                  ),
                  _slideCard(context),
                  _popularsCard(context),
                  SizedBox(height: 20.0),
                  _upcomingCard(context),

                  Container(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'Series',
                      style: Theme.of(context).textTheme.headline6
                    )
                  ),

                ]
              ),
            )
          ]
        ),

      ),
    );
  }

  Widget _slideCard(BuildContext context){

    return Container(
      child: Column(
        children: [

          FutureBuilder(
            future: _api.getNowPlaying(),
            builder: (BuildContext context, AsyncSnapshot<Result> snapshot) {
              
              switch (snapshot.connectionState) {
                case ConnectionState.active:
                case ConnectionState.done:
                  
                  return SlideCard(movies: snapshot.data.results);
                  break;

                default:
                  return Container(
                    height: 400.0,
                    child: Center(
                      child: CircularProgressIndicator()));
                  break;
              }
            }
          ),
        ],
      ),
    );
  }

  Widget _popularsCard(BuildContext context) {

    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          Container(
            padding: EdgeInsets.only(left: 20.0),
            child: Text('Popular Movies', style: Theme.of(context).textTheme.subtitle1 )
          ),
          SizedBox(height: 10.0),

          FutureBuilder(
            future: _api.getPopular(),
            builder: (BuildContext context, AsyncSnapshot<Result> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.active:
                case ConnectionState.done:
                  return HorizontalCard(movies: snapshot.data.results);
                  
                  break;
                default:
                  return Center(child: CircularProgressIndicator());
              }
            }
          )
        ],
      ),
    );
  }

  Widget _upcomingCard(BuildContext context) {

    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          Container(
            padding: EdgeInsets.only(left: 20.0),
            child: Text('Upcoming Movies', style: Theme.of(context).textTheme.subtitle1 )
          ),
          SizedBox(height: 10.0),

          FutureBuilder(
            future: _api.getUpcoming(),
            builder: (BuildContext context, AsyncSnapshot<Result> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.active:
                case ConnectionState.done:
                  return HorizontalCard(movies: snapshot.data.results);
                  
                  break;
                default:
                  return Center(child: CircularProgressIndicator());
              }
            }
          )
        ],
      ),
    );

  }
}