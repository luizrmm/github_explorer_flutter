import 'package:flutter/material.dart';
import 'package:github_app/repositories/repos_repository.dart';
import 'package:github_app/repositories/user_repository.dart';
import 'package:github_app/screens/home_screen.dart';
import 'package:github_app/stores/home_store.dart';
import 'package:github_app/stores/repos_store.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => HomeStore(UserRepository()),
        ),
        Provider(
          create: (context) => RepoStore(ReposRepository()),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.black,
          backgroundColor: Colors.amber[50],
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
