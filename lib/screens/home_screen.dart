import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:github_app/screens/repositories_screen.dart';
import 'package:github_app/stores/home_store.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import '../stores/home_store.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _searchController = TextEditingController();
  List<ReactionDisposer> _disposers;

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  void initState() {
    var homeStore = Provider.of<HomeStore>(context, listen: false);

    _disposers = [
      reaction<String>(
        (reaction) => homeStore.errorMessage,
        (String errorMessage) {
          _scaffoldKey.currentState.showSnackBar(
            SnackBar(
              backgroundColor: Colors.red[400],
              content: Text(errorMessage),
            ),
          );
        },
      )
    ];
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _disposers.forEach(
      (dispose) => dispose(),
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final homeStore = Provider.of<HomeStore>(context, listen: false);
    print('oi');

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width * 0.98,
          ),
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.asset('assets/github.png'),
              Row(
                children: <Widget>[
                  Expanded(
                    child: SizedBox(
                      height: 46,
                      child: Material(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(4),
                          bottomLeft: Radius.circular(4),
                        ),
                        elevation: 4,
                        child: TextField(
                          controller: _searchController,
                          autofocus: false,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Pesquisar nome de usuário",
                            contentPadding: EdgeInsets.only(
                                top: 0, bottom: 0, left: 8, right: 8),
                          ),
                          onChanged: homeStore.setUsername,
                        ),
                      ),
                    ),
                  ),
                  MaterialButton(
                    height: 46,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(4.0),
                        bottomRight: Radius.circular(4.0),
                      ),
                    ),
                    color: Colors.green,
                    child: Icon(Icons.search),
                    onPressed: () {
                      homeStore.getUserData(homeStore.username);
                      _searchController.clear();
                    },
                  ),
                ],
              ),
              Observer(
                builder: (context) {
                  switch (homeStore.state) {
                    case UserFutureState.initial:
                      return Padding(
                        padding: EdgeInsets.only(top: 40),
                        child: Text(
                          'Nenhum resultado para exbir!',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.lato(
                              color: Colors.grey[700], fontSize: 20),
                        ),
                      );
                    case UserFutureState.loading:
                      return Container(
                        padding: EdgeInsets.only(top: 180),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    case UserFutureState.loaded:
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 40, bottom: 20),
                            height: 100,
                            width: 100,
                            child: CircleAvatar(
                              backgroundImage:
                                  NetworkImage(homeStore.usermodel.avatarUrl),
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Text(
                                  homeStore.usermodel.login ?? "",
                                  style: GoogleFonts.notoSans(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[800]),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Text(
                                  homeStore.usermodel.name ?? "",
                                  maxLines: 4,
                                  overflow: TextOverflow.clip,
                                  style: GoogleFonts.notoSans(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[700]),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 22.0,
                          ),
                          Text(
                            homeStore.usermodel.bio ?? "",
                            maxLines: 4,
                            overflow: TextOverflow.clip,
                            style: GoogleFonts.notoSans(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[700]),
                          ),
                          SizedBox(
                            height: 12.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.location_on,
                                size: 20,
                                color: Colors.red[300],
                              ),
                              Text(
                                homeStore.usermodel.location ?? "",
                                maxLines: 4,
                                overflow: TextOverflow.clip,
                                style: GoogleFonts.notoSans(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[700],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: RaisedButton(
                              color: Colors.green,
                              child: Text('Repositorios'),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RepositoriesScreen(),
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      );
                    default:
                      return Text('Container');
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
