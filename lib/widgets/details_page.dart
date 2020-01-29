import 'package:flutter/material.dart';
import 'package:insta_grid/models/i_post.dart';

class DetailsPage extends StatelessWidget {
  final IPost _post;

  DetailsPage(this._post);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${_post.originalTitle} details:'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
//          Center(child: Text(_post.title)),
          Container(
            child: Image.network(
                "https://image.tmdb.org/t/p/w600_and_h900_bestv2${_post.posterPath}",
                width: 200,
                height: 300,
                fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(_post.overview),
          ),
        ],
      ),
    );
  }
}
