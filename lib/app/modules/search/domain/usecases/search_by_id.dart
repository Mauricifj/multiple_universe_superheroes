import 'package:dartz/dartz.dart';
import 'package:multiple_universe_superheroes/app/modules/search/domain/entities/super_hero.dart';
import 'package:multiple_universe_superheroes/app/modules/search/domain/errors/errors.dart';
import 'package:multiple_universe_superheroes/app/modules/search/domain/repositories/search_repository.dart';

abstract class SearchById {
  Future<Either<Failure, SuperHero>> call(String id);
}

class SearchByIdImpl implements SearchById {
  final SearchRepository repository;

  SearchByIdImpl(this.repository);

  @override
  Future<Either<Failure, SuperHero>> call(String id) async {
    return repository.getHeroById(id);
  }
}
