enum MoviesType {
  nowPlaying(rawValue: "now_playing"),
  popular(rawValue: "popular"),
  topRated(rawValue: "top_rated"),
  upcoming(rawValue: "upcoming");

  String get title {
    switch (this) {
      case MoviesType.nowPlaying:
        return "Now Playing";
      case MoviesType.popular:
        return "Popular";
      case MoviesType.topRated:
        return "Top Rated";
      case MoviesType.upcoming:
        return "Upcoming";
    }
  }

  final String rawValue;

  const MoviesType({required this.rawValue});
}
