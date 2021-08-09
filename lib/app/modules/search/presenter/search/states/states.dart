import 'package:multiple_universe_superheroes/app/modules/search/domain/entities/super_hero.dart';
import 'package:multiple_universe_superheroes/app/modules/search/domain/errors/errors.dart';

abstract class SearchState {}

class SearchSuccess implements SearchState {
  final List<SuperHero> list;

  SearchSuccess(this.list);
}

class SearchStart implements SearchState {}

class SearchLoading implements SearchState {}

class SearchError implements SearchState {
  final Failure error;

  SearchError(this.error);
}
