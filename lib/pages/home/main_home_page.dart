import 'package:flutter/widgets.dart';
import 'package:flutterdouban/model/home_model.dart';
import 'package:flutterdouban/pages/home/main_home_movie_item.dart';
import 'package:flutterdouban/service/home_request.dart';

class MainHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MainContent();
  }
}

class MainContent extends StatefulWidget {
  @override
  _MainContentState createState() => _MainContentState();
}

class _MainContentState extends State<MainContent> {
  List<MovieItem> movies = [];

  @override
  void initState() {
    super.initState();
    HomeRequest.requestMovieList(0).then((res) {
      setState(() {
        movies.addAll(res);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: movies.length,
        itemBuilder: (ctx, index) {
          return buildItem(movies[index]);
        });
  }

  Widget buildItem(MovieItem movie) {
    return FYHomeMovieItem(movie);
  }
}
