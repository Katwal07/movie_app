class ApiUrl {

  static const baseURL = 'http://localhost:5001/'; 
  static const apiV = 'api/v1/';
  
  static const signup = '${apiV}auth/signup';
  static const signin = '${apiV}auth/signin';
  static const logout = '${apiV}auth/logout';
  static const trendingMovies = '${apiV}movie/trending';
  static const nowPlayingMovies = '${apiV}movie/nowplaying';
  static const popularMovies = '${apiV}movie/popular';
  static const topRatedMovies = '${apiV}movie/top_rated';
  static const upcommingMovies = '${apiV}movie/upcoming';
  static const movie = '${apiV}movie/';
  static const search = '${apiV}search/';

  static const trailerBase = 'https://www.youtube.com/watch?v=';
}