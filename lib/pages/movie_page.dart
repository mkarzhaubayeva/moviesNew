import 'package:flutter/material.dart';
import 'package:movies/services/movie.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:movies/services/list_of_movies.dart';

List<Movie> getMovies(Movie instance) {
  List<Movie> filtered =[];
  for (int i = 0; i < movies.length; i++) {
    for (int j = 0; j < instance.genres.length; j++) {
      if (movies[i].genres.contains(instance.genres[j]) && !filtered.contains(movies[i]))
        filtered.add(movies[i]);
    }
  }
  return filtered;
}

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
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget> [
                    Image.asset('assets/${instance.img}'),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget> [
                          SizedBox(height: 8,),
                          Container(
                            width: 230,
                            child: RichText(
                              text: new TextSpan(
                                style: new TextStyle(
                                  fontSize: 19.0,
                                  color: Colors.black,
                                ),
                                children: <TextSpan>[
                                  new TextSpan(text: 'Rating: ',
                                      style: new TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  new TextSpan(text: '${instance.rate}\n\n'),
                                  new TextSpan(text: 'Length: ',
                                      style: new TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  new TextSpan(text: '${instance.length}\n\n'),
                                  new TextSpan(text: 'Genres: ',
                                      style: new TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  new TextSpan(text: '${EnumToString.toList(instance.genres).join(', ')}'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RichText(
                      textAlign: TextAlign.justify,
                      text: new TextSpan(
                        style: new TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          new TextSpan(text: 'Description:\n',
                              style: new TextStyle(
                                  fontWeight: FontWeight.bold)),
                          new TextSpan(text: '${instance.description}'),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'You may also like:',
                      textAlign: TextAlign.left,
                      //maxLines: 100,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: getMovies(instance).length,
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
                          ),
                        ),
                      );
                    }
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}