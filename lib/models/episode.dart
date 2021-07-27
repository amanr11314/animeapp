class Episode {
  final int episodeId;
  final String title;

  Episode({required this.episodeId, required this.title});

  factory Episode.fromJson(Map<String, dynamic> json) {
    return Episode(episodeId: json['episode_id'], title: json['title']);
  }
}
