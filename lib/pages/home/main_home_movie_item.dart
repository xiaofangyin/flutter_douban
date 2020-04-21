import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterdouban/model/home_model.dart';
import 'package:flutterdouban/widget/start_rating.dart';

class FYHomeMovieItem extends StatelessWidget {
  final MovieItem _movieItem;

  FYHomeMovieItem(this._movieItem);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 8, color: Color(0xffcccccc)))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildHeader(),
          SizedBox(
            height: 6,
          ),
          buildContent(),
          SizedBox(
            height: 6,
          ),
          buildFooter(),
          SizedBox(
            height: 6,
          )
        ],
      ),
    );
  }

  Widget buildHeader() {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: Color.fromARGB(255, 238, 205, 144)),
      child: Text(
        "No.${_movieItem.rank}",
        style: TextStyle(color: Color.fromARGB(255, 131, 95, 36)),
      ),
    );
  }

  Widget buildContent() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        buildContentImage(),
        SizedBox(
          width: 8,
        ),
        buildContentInfo(),
        SizedBox(
          width: 8,
        ),
        buildContentWish()
      ],
    );
  }

  Widget buildContentImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        _movieItem.imageURL,
        height: 150,
        width: 100,
      ),
    );
  }

  Widget buildContentInfo() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildContentInfoTitle(),
          buildContentInfoRate(),
          buildContentInfoDirector(),
          buildContentInfoActor(),
        ],
      ),
    );
  }

  Widget buildContentInfoTitle() {
    return Text.rich(TextSpan(children: [
      WidgetSpan(
          child: Icon(
        Icons.play_circle_outline,
        color: Colors.red,
      )),
      TextSpan(
          text: _movieItem.title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      TextSpan(
          text: "(${_movieItem.playDate})",
          style: TextStyle(fontSize: 14, color: Colors.grey)),
    ]));
  }

  Widget buildContentInfoRate() {
    return Row(
      children: <Widget>[
        MyHomeContent(
          curValues: _movieItem.rating,
          size: 20,
        ),
        SizedBox(
          width: 6,
        ),
        Text(
          "${_movieItem.rating}",
          style: TextStyle(color: Colors.grey, fontSize: 12),
        )
      ],
    );
  }

  Widget buildContentInfoDirector() {
    return Text("导演:${_movieItem.director.name}");
  }

  Widget buildContentInfoActor() {
    return Text(
      "演员:${_movieItem.casts.map((item) {
        return item.name;
      }).join(" ")}",
      maxLines: 2,
    );
  }

  Widget buildContentWish() {
    return Text("想看");
  }

  Widget buildFooter() {
    return Container(
      padding: EdgeInsets.all(8),
      width: double.infinity,
      child: Text(
        "${_movieItem.originalTitle}",
        style: TextStyle(color: Color(0xff666666)),
      ),
      decoration: BoxDecoration(
          color: Color(0xffe2e2e2), borderRadius: BorderRadius.circular(2)),
    );
  }
}
