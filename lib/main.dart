import 'package:flutter/material.dart';
import 'package:movies/pages/movie_page.dart';
import 'package:movies/pages/choose_movie.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/home',
  routes: {
    '/home': (context) => ChooseMovie(),
    //'/movie': (context) => MoviePage(),
  },
));