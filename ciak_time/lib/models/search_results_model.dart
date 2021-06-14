import 'package:ciak_time/constants.dart';

class SearchResultsModel {
  int page;
  List<SearchResults> results;
  int totalPages;
  int totalResults;

  SearchResultsModel(
      {this.page, this.results, this.totalPages, this.totalResults});

  SearchResultsModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        //TODO finire di implementare la logica per i filtri, capire cosa fare anche per gli attori
        //per il momento funziona se cambiamo le cose a mano, per esempio se mettiamo fantasy = true nelle costanti, se cerco harry mi mostra solo le corrispondenze con il genere fantasy
        //if (v.values.toList()[4] == 'movie') { //mettere questo && isFilteredApplied (?) perché che succede nel caso in cui
        //if media type == 'movie' -> serve perché altrimenti dice che contains non può essere chiamato su int (perché per le persone v.values.toList()[2] è un int)
        /*print(
            v.values.toList()[2].contains(genresIds[0]["Fantasy"]).toString() +
                "Fantasy id: " +
                genresIds[0]["Fantasy"].toString());*/

        //TODO:
        //facendo così mostra solo i film in base al genere, e mostra anche gli attori, capire come fare: se mette un filtro sul
        //genere l'utente vuole cercare solo film e non attori
        // --> aggiungere un filtro che permetta di decidere se cercare solo film o solo attori?
        if (v.values.toList()[4] == 'movie' && drama == true) {
          if (v.values.toList()[2].contains(genresIds[0]["Drama"])) {
            results.add(new SearchResults.fromJson(v));
          }
        } else if (v.values.toList()[4] == 'movie' && comedy == true) {
          if (v.values.toList()[2].contains(genresIds[0]["Comedy"])) {
            results.add(new SearchResults.fromJson(v));
          }
        } else if (v.values.toList()[4] == 'movie' && action == true) {
          if (v.values.toList()[2].contains(genresIds[0]["Action"])) {
            results.add(new SearchResults.fromJson(v));
          }
        } else if (v.values.toList()[4] == 'movie' && crime == true) {
          if (v.values.toList()[2].contains(genresIds[0]["Crime"])) {
            results.add(new SearchResults.fromJson(v));
          }
        } else if (v.values.toList()[4] == 'movie' && fantasy == true) {
          if (v.values.toList()[2].contains(genresIds[0]["Fantasy"])) {
            results.add(new SearchResults.fromJson(v));
          }
        } else if (v.values.toList()[4] == 'movie' && thriller == true) {
          if (v.values.toList()[2].contains(genresIds[0]["Thriller"])) {
            results.add(new SearchResults.fromJson(v));
          }
        } else if (v.values.toList()[4] == 'movie' && family == true) {
          if (v.values.toList()[2].contains(genresIds[0]["Family"])) {
            results.add(new SearchResults.fromJson(v));
          }
        } else if (v.values.toList()[4] == 'movie' && anime == true) {
          if (v.values.toList()[2].contains(genresIds[0]["Animation"])) {
            results.add(new SearchResults.fromJson(v));
          }
        } else if (v.values.toList()[4] == 'movie' && horror == true) {
          if (v.values.toList()[2].contains(genresIds[0]["Horror"])) {
            results.add(new SearchResults.fromJson(v));
          }
          //caso in cui i filtri non sono applicati:
        } else if (v.values.toList()[5] == 'person' ||
            v.values.toList()[4] == 'movie') {
          //if media type == movie or media type == person
          results.add(new SearchResults.fromJson(v));
        }
        //}
        /*if (drama == true) {
          if (v.values.toList()[2].contains(genresIds[0]["Drama"])) {
            results.add(new SearchResults.fromJson(v));
          }
        } else if (comedy == true) {
          if (v.values.toList()[2].contains(genresIds[0]["Comedy"])) {
            results.add(new SearchResults.fromJson(v));
          }
        } else if (action == true) {
          if (v.values.toList()[2].contains(genresIds[0]["Action"])) {
            results.add(new SearchResults.fromJson(v));
          }
        } else if (crime == true) {
          if (v.values.toList()[2].contains(genresIds[0]["Crime"])) {
            results.add(new SearchResults.fromJson(v));
          }
        } else if (fantasy == true) {
          if (v.values.toList()[2].contains(genresIds[0]["Fantasy"])) {
            results.add(new SearchResults.fromJson(v));
          }
        } else if (thriller == true) {
          if (v.values.toList()[2].contains(genresIds[0]["Thriller"])) {
            results.add(new SearchResults.fromJson(v));
          }
        } else if (family == true) {
          if (v.values.toList()[2].contains(genresIds[0]["Family"])) {
            results.add(new SearchResults.fromJson(v));
          }
        } else if (anime == true) {
          if (v.values.toList()[2].contains(genresIds[0]["Animation"])) {
            results.add(new SearchResults.fromJson(v));
          }
        } else if (horror == true) {
          if (v.values.toList()[2].contains(genresIds[0]["Horror"])) {
            results.add(new SearchResults.fromJson(v));
          }
          //caso in cui i filtri non sono applicati:
        } */

        //---PRIMA DI AVER MESSO I FILTRI AVEVAMO SOLO QUESTO---
        /* if (v.values.toList()[5] == 'person' ||
            v.values.toList()[4] == 'movie') { //if media type == movie or media type == person 
          results.add(new SearchResults.fromJson(v));
        }*/
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    data['total_pages'] = this.totalPages;
    data['total_results'] = this.totalResults;
    return data;
  }
}

class SearchResults {
  String backdropPath;
  String firstAirDate;
  List<int> genreIds;
  int id;
  String mediaType;
  String name;
  List<String> originCountry;
  String originalLanguage;
  String originalName;
  String overview;
  double popularity;
  String posterPath;
  double voteAverage;
  int voteCount;
  bool adult;
  String originalTitle;
  String releaseDate;
  String title;
  bool video;
  int gender;
  List<KnownFor> knownFor;
  String knownForDepartment;
  String profilePath;

  SearchResults(
      {this.backdropPath,
      this.firstAirDate,
      this.genreIds,
      this.id,
      this.mediaType,
      this.name,
      this.originCountry,
      this.originalLanguage,
      this.originalName,
      this.overview,
      this.popularity,
      this.posterPath,
      this.voteAverage,
      this.voteCount,
      this.adult,
      this.originalTitle,
      this.releaseDate,
      this.title,
      this.video,
      this.gender,
      this.knownFor,
      this.knownForDepartment,
      this.profilePath});

  SearchResults.fromJson(Map<String, dynamic> json) {
    backdropPath = json['backdrop_path'];
    firstAirDate = json['first_air_date'];
    if (json['genre_ids'] != null) {
      genreIds = json['genre_ids'].cast<int>();
    }

    id = json['id'];

    mediaType = json['media_type'];

    name = json['name'];
    //originCountry = json['origin_country'].cast<String>();
    originalLanguage = json['original_language'];
    originalName = json['original_name'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    //voteAverage = json['vote_average'];
    if (json['vote_average'] != null) {
      voteAverage = json['vote_average'].toDouble();
    }

    voteCount = json['vote_count'];
    adult = json['adult'];
    originalTitle = json['original_title'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    gender = json['gender'];
    if (json['known_for'] != null) {
      knownFor = [];
      json['known_for'].forEach((v) {
        knownFor.add(new KnownFor.fromJson(v));
      });
    }
    knownForDepartment = json['known_for_department'];
    profilePath = json['profile_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['backdrop_path'] = this.backdropPath;
    data['first_air_date'] = this.firstAirDate;
    data['genre_ids'] = this.genreIds;
    data['id'] = this.id;
    data['media_type'] = this.mediaType;
    data['name'] = this.name;
    data['origin_country'] = this.originCountry;
    data['original_language'] = this.originalLanguage;
    data['original_name'] = this.originalName;
    data['overview'] = this.overview;
    data['popularity'] = this.popularity;
    data['poster_path'] = this.posterPath;
    data['vote_average'] = this.voteAverage;
    data['vote_count'] = this.voteCount;
    data['adult'] = this.adult;
    data['original_title'] = this.originalTitle;
    data['release_date'] = this.releaseDate;
    data['title'] = this.title;
    data['video'] = this.video;
    data['gender'] = this.gender;
    if (this.knownFor != null) {
      data['known_for'] = this.knownFor.map((v) => v.toJson()).toList();
    }
    data['known_for_department'] = this.knownForDepartment;
    data['profile_path'] = this.profilePath;
    return data;
  }
}

class KnownFor {
  bool adult;
  String backdropPath;
  List<int> genreIds;
  int id;
  String mediaType;
  String originalLanguage;
  String originalTitle;
  String overview;
  String posterPath;
  String releaseDate;
  String title;
  bool video;
  double voteAverage;
  int voteCount;

  KnownFor(
      {this.adult,
      this.backdropPath,
      this.genreIds,
      this.id,
      this.mediaType,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount});

  KnownFor.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'].cast<int>();
    id = json['id'];
    mediaType = json['media_type'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'].toDouble();
    voteCount = json['vote_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adult'] = this.adult;
    data['backdrop_path'] = this.backdropPath;
    data['genre_ids'] = this.genreIds;
    data['id'] = this.id;
    data['media_type'] = this.mediaType;
    data['original_language'] = this.originalLanguage;
    data['original_title'] = this.originalTitle;
    data['overview'] = this.overview;
    data['poster_path'] = this.posterPath;
    data['release_date'] = this.releaseDate;
    data['title'] = this.title;
    data['video'] = this.video;
    data['vote_average'] = this.voteAverage;
    data['vote_count'] = this.voteCount;
    return data;
  }
}
