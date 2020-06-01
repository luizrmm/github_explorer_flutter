// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repos_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RepoStore on _RepoStore, Store {
  Computed<RepoState> _$stateComputed;

  @override
  RepoState get state => (_$stateComputed ??=
          Computed<RepoState>(() => super.state, name: '_RepoStore.state'))
      .value;

  final _$_reposFutureAtom = Atom(name: '_RepoStore._reposFuture');

  @override
  ObservableFuture<List<ReposModel>> get _reposFuture {
    _$_reposFutureAtom.reportRead();
    return super._reposFuture;
  }

  @override
  set _reposFuture(ObservableFuture<List<ReposModel>> value) {
    _$_reposFutureAtom.reportWrite(value, super._reposFuture, () {
      super._reposFuture = value;
    });
  }

  final _$repositoriesAtom = Atom(name: '_RepoStore.repositories');

  @override
  List<ReposModel> get repositories {
    _$repositoriesAtom.reportRead();
    return super.repositories;
  }

  @override
  set repositories(List<ReposModel> value) {
    _$repositoriesAtom.reportWrite(value, super.repositories, () {
      super.repositories = value;
    });
  }

  final _$errorMessageAtom = Atom(name: '_RepoStore.errorMessage');

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

  final _$getReposDataAsyncAction = AsyncAction('_RepoStore.getReposData');

  @override
  Future<dynamic> getReposData(String username) {
    return _$getReposDataAsyncAction.run(() => super.getReposData(username));
  }

  @override
  String toString() {
    return '''
repositories: ${repositories},
errorMessage: ${errorMessage},
state: ${state}
    ''';
  }
}
