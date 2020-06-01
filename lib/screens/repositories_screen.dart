import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:github_app/stores/home_store.dart';
import 'package:github_app/stores/repos_store.dart';
import 'package:provider/provider.dart';

class RepositoriesScreen extends StatefulWidget {
  @override
  _RepositoriesScreenState createState() => _RepositoriesScreenState();
}

class _RepositoriesScreenState extends State<RepositoriesScreen> {
  @override
  void didChangeDependencies() {
    final repoStore = Provider.of<RepoStore>(context, listen: false);
    final homeStore = Provider.of<HomeStore>(context, listen: false);
    repoStore.getReposData(homeStore.username);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final repoStore = Provider.of<RepoStore>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Repositórios'),
      ),
      body: Observer(
        builder: (BuildContext context) {
          switch (repoStore.state) {
            case RepoState.initial:
              return Container(
                child: Text('inicial'),
              );
            case RepoState.loading:
              return Center(
                child: CircularProgressIndicator(),
              );
            case RepoState.loaded:
              return Container(
                child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider();
                  },
                  itemCount: repoStore.repositories.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(repoStore.repositories[index].name ?? ""),
                      subtitle:
                          Text(repoStore.repositories[index].language ?? ""),
                      leading: Icon(Icons.folder),
                    );
                  },
                ),
              );
            default:
              return Container(
                child: Text('default'),
              );
          }
        },
      ),
    );
  }
}
