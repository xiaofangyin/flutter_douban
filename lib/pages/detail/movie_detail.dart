import 'package:flutter/material.dart';

class MovieDetailActivity extends StatelessWidget {
  final String _message;

  MovieDetailActivity(this._message);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("详情页"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => _backToHome(context),
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text("详情页"),
            RaisedButton(
              child: Text("${_message}"),
              onPressed: () {
                _backToHome(context);
              },
            )
          ],
        ),
      ),
    );
  }

  String _backToHome(BuildContext context) {
    Navigator.of(context).pop("message from detail");
  }
}
