import 'package:dartz/dartz.dart';
import 'package:multiple_universe_superheroes/app/modules/search/domain/errors/errors.dart';
import 'package:multiple_universe_superheroes/app/modules/search/infra/models/super_hero_model.dart';

abstract class SearchRepository {
  Future<Either<Failure, List<SuperHeroModel>>> getHeroes(String searchText);
  Future<Either<Failure, SuperHeroModel>> getHeroById(String id);
}
