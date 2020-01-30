import 'package:flutter/material.dart';
import 'package:insta_grid/models/i_post.dart';
import 'package:insta_grid/widgets/details_page.dart';

class ActionBar extends StatefulWidget {
  IPost _post;

  ActionBar(this._post);

  @override
  _ActionBarState createState() => _ActionBarState(_post);
}

class _ActionBarState extends State<ActionBar> {
  IPost _post;
  bool liked = false;
  String note = '';

  final myController = TextEditingController();

  _ActionBarState(this._post);

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(
              liked ? Icons.favorite_border : Icons.favorite,
            ),
            onPressed: () {
              setState(() {
                liked = !liked;
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.chat_bubble_outline),
            onPressed: () => _showNotes(),
          ),
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () => _showShare(),
          ),
          IconButton(
            icon: Icon(
              Icons.more,
            ),
            onPressed: () => _navigateToDetail(context),
          ),
        ]);
  }

  void _navigateToDetail(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => DetailsPage(_post)));
  }

  void _showShare() {
    showDialog(
        context: context,
        child: Icon(
          Icons.mail,
          size: 50.0,
        ));
  }

  void _showNotes() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text("Notes for ${_post.title}:"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                note,
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent),
              ),
              TextField(
                controller: myController,
              )
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("Close"),
              onPressed: () {
                myController.clear();
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text("Save"),
              onPressed: () {
                note = myController.text;
                myController.clear();
                setState(() {});
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
