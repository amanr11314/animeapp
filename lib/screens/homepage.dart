import 'package:animeapp/models/show.dart';
import 'package:animeapp/screens/details_page.dart';
import 'package:animeapp/services/services.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Show>> shows;
  @override
  void initState() {
    super.initState();
    shows = fetchShows();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Anime App'),
      ),
      body: Center(
        child: FutureBuilder(
          builder: (context, AsyncSnapshot<List<Show>> snapshot) {
            if (snapshot.hasData) {
              return Center(
                child: ListView.separated(
                  padding: const EdgeInsets.all(8),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                            NetworkImage('${snapshot.data![index].imageUrl}'),
                      ),
                      title: Text('${snapshot.data![index].title}'),
                      subtitle: Text('Score: ${snapshot.data![index].score}'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPage(
                              item: snapshot.data![index].malId,
                              title: snapshot.data![index].title,
                            ),
                          ),
                        );
                      },
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                ),
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('Something went wrong :('));
            }

            return CircularProgressIndicator();
          },
          future: shows,
        ),
      ),
    );
  }
}
