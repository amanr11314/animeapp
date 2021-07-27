import 'package:animeapp/models/episode.dart';
import 'package:animeapp/services/services.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  // const DetailPage({Key? key}) : super(key: key);
  final int item;
  final String title;
  DetailPage({Key? key, required this.item, required this.title})
      : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late Future<List<Episode>> episodes;

  @override
  void initState() {
    super.initState();
    episodes = fetchEpisodes(widget.item);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: FutureBuilder(
          builder: (context, AsyncSnapshot<List<Episode>> snapshot) {
            if (snapshot.hasData) {
              return Center(
                child: ListView.separated(
                  padding: const EdgeInsets.all(8),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: CircleAvatar(
                          child: Text('${snapshot.data![index].episodeId}')),
                      title: Text(snapshot.data![index].title),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Something went wrong :('),
              );
            }
            return CircularProgressIndicator();
          },
          future: episodes,
        ),
      ),
    );
  }
}
