import 'package:flutter/material.dart';
import 'package:insta_grid/bloc/bloc_provider.dart';
import 'package:insta_grid/bloc/fetch_post_bloc.dart';
import 'package:insta_grid/widgets/home_page.dart';

void main() =>
    runApp(
        MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: PostBloc(),
      child: MaterialApp(
        title: 'InstaGrid',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Center(
              child: Text(
                'InstaGriDD',
                style: TextStyle(
                  color: Colors.white70,
                ),
              ),
            ),
          ),
          body: HomeScreen(),
      ),
    ));
  }
}

