import 'package:github_app/models/repos_model.dart';
import 'package:github_app/repositories/repos_repository.dart';
import 'package:mobx/mobx.dart';
part 'repos_store.g.dart';

class RepoStore = _RepoStore with _$RepoStore;
enum RepoState { initial, loading, loaded }

abstract class _RepoStore with Store {
  final ReposRepository _reposRepository;
  _RepoStore(this._reposRepository);

  @observable
  ObservableFuture<List<ReposModel>> _reposFuture;

  @observable
  List<ReposModel> repositories;

  @observable
  String errorMessage;

  @computed
  RepoState get state {
    if (_reposFuture == null || _reposFuture.status == FutureStatus.rejected) {
      return RepoState.initial;
    }
    return _reposFuture.status == FutureStatus.pending
        ? RepoState.loading
        : RepoState.loaded;
  }

  @action
  Future getReposData(String username) async {
    errorMessage = null;
    try {
      _reposFuture = ObservableFuture(_reposRepository.getRepos(username));
      repositories = await _reposFuture;
    } catch (e) {
      errorMessage = e.response.data["message"];
    }
  }
}
