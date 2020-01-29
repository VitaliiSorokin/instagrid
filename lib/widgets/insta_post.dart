import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:insta_grid/models/i_post.dart';
import 'package:insta_grid/widgets/details_page.dart';

class InstaPost extends StatelessWidget {
  final IPost _post;

  InstaPost(this._post);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: new BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: new BorderRadius.circular(20.0),
            ),
        child: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              _post.title,
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.cyanAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            ),
          ),
          Image.network(
              'https://image.tmdb.org/t/p/w600_and_h900_bestv2${_post.posterPath}',
              width: 200,
              height: 300,
              fit: BoxFit.fitWidth),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Icon(Icons.favorite_border),
              Icon(Icons.chat_bubble_outline),
              Icon(Icons.send),
              Icon(Icons.bookmark_border),
              RaisedButton(
                  onPressed: () => _navigateToDetail(context),
                  child: Text('Details', style: TextStyle(fontSize: 20)))
            ],
          ),
          Container(
              margin: EdgeInsets.all(6.0),
              alignment: Alignment.bottomLeft,
              child: Text('Liked: ${_post.voteCount}')),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'The ${_post.originalTitle} was wathced '
              '${_post.popularity} times.',
              style: TextStyle(color: Colors.yellowAccent, fontSize: 16.0),
            ),
          ),
          Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(8.0),
              child: Text(_post.releaseDate,
                  style: TextStyle(fontStyle: FontStyle.italic)))
        ]),
      ),
    );
  }

  void _navigateToDetail(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => DetailsPage(_post)));
  }
}
