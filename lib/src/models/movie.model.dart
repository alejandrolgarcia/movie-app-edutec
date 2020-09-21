
class Movie {
  double popularity;
  int voteCount;
  bool video;
  String posterPath;
  int id;
  bool adult;
  String backdropPath;
  String originalLanguage;
  String originalTitle;
  List<int> genreIds;
  String title;
  double voteAverage;
  String overview;
  String releaseDate;

  Movie.fromJson(Map<String, dynamic> parsed) {
    popularity       = parsed['popularity'] / 1;
    voteCount        = parsed['vote_count'];
    video            = parsed['video'];
    posterPath       = parsed['poster_path'];
    id               = parsed['id'];
    adult            = parsed['adult'];
    backdropPath     = parsed['backdrop_path'];
    originalLanguage = parsed['original_language'];
    originalTitle    = parsed['original_title'];
    genreIds         = parsed['genre_ids'].cast<int>();
    title            = parsed['title'];
    voteAverage      = parsed['vote_average'] / 1;
    releaseDate      = parsed['release_date'];
    overview         = parsed['overview'];
  }

  getPosterImg(){
    if( posterPath == null ) {
      return 'https://extyseg.com/wp-content/uploads/2019/04/EXTYSEG-imagen-no-disponible.jpg';
    }else {
      return 'https://image.tmdb.org/t/p/w500/$posterPath';
    }
  }


}