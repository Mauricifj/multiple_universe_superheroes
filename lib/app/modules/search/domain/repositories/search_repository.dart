import 'package:dartz/dartz.dart';
import 'package:multiple_universe_superheroes/app/modules/search/domain/entities/super_hero.dart';
import 'package:multiple_universe_superheroes/app/modules/search/domain/errors/errors.dart';

abstract class SearchRepository {
  Future<Either<Failure, List<SuperHero>>> getHeroes(String searchText);
}
