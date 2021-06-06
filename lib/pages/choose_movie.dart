import 'package:flutter/material.dart';
import 'package:movies/pages/movie_page.dart';
import 'package:movies/services/list_of_movies.dart';

class ChooseMovie extends StatefulWidget {
  @override
  _ChooseMovieState createState() => _ChooseMovieState();
}

class _ChooseMovieState extends State<ChooseMovie> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Choose the movie'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 1, horizontal: 4),
            child: SizedBox(
              height: 80,
              child: Card(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MoviePage(movies[index])
                        )
                      );
                    },
                    title: Text(
                      '${movies[index].name}',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/${movies[index].img}'),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}