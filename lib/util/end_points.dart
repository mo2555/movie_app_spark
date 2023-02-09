class EndPoints {
  static const String apiKey = '2a81b0f3fbbe3656bd9be040bdeed583';
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const latest = '/movie/latest?api_key=';

  static const newRelease = '/movie/popular?api_key=';
  static const String recommended = '/movie/top_rated?api_key=';
  static const String search = '/search/movie?api_key=$apiKey&query=';
  static const String imageBaseUrl= 'https://www.themoviedb.org/t/p/w300_and_h450_bestv2';
}
