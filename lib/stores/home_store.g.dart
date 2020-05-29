// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStore, Store {
  Computed<UserFutureState> _$stateComputed;

  @override
  UserFutureState get state =>
      (_$stateComputed ??= Computed<UserFutureState>(() => super.state,
              name: '_HomeStore.state'))
          .value;

  final _$_userFutureAtom = Atom(name: '_HomeStore._userFuture');

  @override
  ObservableFuture<UserModel> get _userFuture {
    _$_userFutureAtom.reportRead();
    return super._userFuture;
  }

  @override
  set _userFuture(ObservableFuture<UserModel> value) {
    _$_userFutureAtom.reportWrite(value, super._userFuture, () {
      super._userFuture = value;
    });
  }

  final _$usermodelAtom = Atom(name: '_HomeStore.usermodel');

  @override
  UserModel get usermodel {
    _$usermodelAtom.reportRead();
    return super.usermodel;
  }

  @override
  set usermodel(UserModel value) {
    _$usermodelAtom.reportWrite(value, super.usermodel, () {
      super.usermodel = value;
    });
  }

  final _$usernameAtom = Atom(name: '_HomeStore.username');

  @override
  String get username {
    _$usernameAtom.reportRead();
    return super.username;
  }

  @override
  set username(String value) {
    _$usernameAtom.reportWrite(value, super.username, () {
      super.username = value;
    });
  }

  final _$errorMessageAtom = Atom(name: '_HomeStore.errorMessage');

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  final _$getUserDataAsyncAction = AsyncAction('_HomeStore.getUserData');

  @override
  Future<dynamic> getUserData(String username) {
    return _$getUserDataAsyncAction.run(() => super.getUserData(username));
  }

  final _$_HomeStoreActionController = ActionController(name: '_HomeStore');

  @override
  void setUsername(String value) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.setUsername');
    try {
      return super.setUsername(value);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
usermodel: ${usermodel},
username: ${username},
errorMessage: ${errorMessage},
state: ${state}
    ''';
  }
}
