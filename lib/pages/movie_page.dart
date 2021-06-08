import 'package:flutter/material.dart';
import 'package:movies/services/movie.dart';
import 'package:enum_to_string/enum_to_string.dart';

class MoviePage extends StatelessWidget {

  Movie instance;
  MoviePage(this.instance);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[800],
          title: Text('${instance.name}'),
        ),
        body: ListView(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget> [
                Image.asset('assets/${instance.img}'),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        Text(
                          '\n Rating: \n',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          '\n${instance.rate}\n',
                          style: TextStyle(
                            fontSize: 19,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          ' Length: \n',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                          ),
                        ),
                        Text(
                          '${instance.length}\n',
                          style: TextStyle(
                            fontSize: 19,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ' Genres: \n',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                          ),
                        ),
                        Container(
                          width: 160,
                          child: Text(
                            '${EnumToString.toList(instance.genres).join(',\n')}\n',
                            style: TextStyle(
                              fontSize: 19,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    'Description: ',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    '${instance.description}\n',
                    style: TextStyle(
                      fontSize: 19,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    'You may also like:',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 19,
                    ),
                  ),
                ),
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: getMovies(instance).length,
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
                                builder: (context) => MoviePage(getMovies(instance)[index])
                            )
                        );
                      },
                      title: Text(
                        '${getMovies(instance)[index].name}',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/${getMovies(instance)[index].img}'),
                      ),
                    ),
                  ),
                );
              }
            ),
          ],
        )
    );
  }
}