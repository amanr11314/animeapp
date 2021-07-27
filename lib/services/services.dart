import 'dart:convert';

import 'package:animeapp/models/episode.dart';
import 'package:animeapp/models/show.dart';
import 'package:http/http.dart' as http;

Future<List<Episode>> fetchEpisodes(id) async {
  final response = await http
      .get(Uri.parse('https://api.jikan.moe/v3/anime/$id/episodes/1'));

  if (response.statusCode == 200) {
    var episodesJson = jsonDecode(response.body)['episodes'] as List;
    return episodesJson.map((episode) => Episode.fromJson(episode)).toList();
  } else {
    throw Exception('Failed to load episodes');
  }
}

Future<List<Show>> fetchShows() async {
  final response =
      await http.get(Uri.parse('https://api.jikan.moe/v3/top/anime/1'));

  if (response.statusCode == 200) {
    var topShowsJson = jsonDecode(response.body)['top'] as List;
    return topShowsJson.map((show) => Show.fromJson(show)).toList();
  } else {
    throw Exception('Failed to load shows');
  }
}
