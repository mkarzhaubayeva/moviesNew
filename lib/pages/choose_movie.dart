import 'package:flutter/material.dart';
import 'package:movies/pages/movie_page.dart';
import 'package:movies/services/movie.dart';

class ChooseMovie extends StatelessWidget {
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
            child: Card(
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
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
          );
        },
      ),
    );
  }
}