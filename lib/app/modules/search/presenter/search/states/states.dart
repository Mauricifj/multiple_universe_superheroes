import 'package:multiple_universe_superheroes/app/modules/search/domain/errors/errors.dart';
import 'package:multiple_universe_superheroes/app/modules/search/infra/models/super_hero_model.dart';

abstract class SearchState {}

class SearchSuccess implements SearchState {
  final List<SuperHeroModel> list;

  SearchSuccess(this.list);
}

class SearchStart implements SearchState {}

class SearchLoading implements SearchState {}

class SearchError implements SearchState {
  final Failure error;

  SearchError(this.error);
}
