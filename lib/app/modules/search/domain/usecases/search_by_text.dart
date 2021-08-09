import 'package:dartz/dartz.dart';
import 'package:multiple_universe_superheroes/app/modules/search/domain/entities/super_hero.dart';
import 'package:multiple_universe_superheroes/app/modules/search/domain/errors/errors.dart';
import 'package:multiple_universe_superheroes/app/modules/search/domain/repositories/search_repository.dart';

abstract class SearchByText {
  Future<Either<Failure, List<SuperHero>>> call(String searchText);
}

class SearchByTextImpl implements SearchByText {
  final SearchRepository repository;

  SearchByTextImpl(this.repository);

  @override
  Future<Either<Failure, List<SuperHero>>> call(String textSearch) async {
    return repository.getHeroes(textSearch);
  }
}
