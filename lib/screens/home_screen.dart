import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:github_app/stores/home_store.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homeStore = Provider.of<HomeStore>(context);
    TextEditingController _searchControler = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset('assets/github.png'),
            Padding(
              padding: EdgeInsets.only(top: 60.0),
              child: Row(
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
                          controller: _searchControler,
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
                      _searchControler.clear();
                    },
                  ),
                ],
              ),
            ),
            Observer(
              builder: (context) {
                switch (homeStore.state) {
                  case UserFutureState.initial:
                    return Center(
                      child: Text('1'),
                    );
                  case UserFutureState.loading:
                    return Text('carregando');
                  case UserFutureState.loaded:
                    return Text(homeStore.usermodel.name);
                  default:
                    return Text('Container');
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
