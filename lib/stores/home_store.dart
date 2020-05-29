import 'package:github_app/models/user_model.dart';
import 'package:github_app/repositories/user_repository.dart';
import 'package:mobx/mobx.dart';
part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;
enum UserFutureState { initial, loading, loaded }

abstract class _HomeStore with Store {
  final UserRepository _userRepository;

  _HomeStore(this._userRepository);

  @observable
  ObservableFuture<UserModel> _userFuture;

  @observable
  UserModel usermodel;

  @observable
  String username = '';

  @action
  void setUsername(String value) => username = value;

  @computed
  UserFutureState get state {
    if (_userFuture == null || _userFuture.status == FutureStatus.rejected) {
      return UserFutureState.initial;
    }
    return _userFuture.status == FutureStatus.pending
        ? UserFutureState.loading
        : UserFutureState.loaded;
  }

  @action
  Future getUserData(String username) async {
    try {
      _userFuture = ObservableFuture(_userRepository.getUser(username));
      usermodel = await _userFuture;
    } catch (e) {
      print(e);
    }
  }
}
