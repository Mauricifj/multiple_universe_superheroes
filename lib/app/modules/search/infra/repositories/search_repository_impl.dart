import 'package:dartz/dartz.dart';
import 'package:multiple_universe_superheroes/app/modules/search/domain/entities/super_hero.dart';
import 'package:multiple_universe_superheroes/app/modules/search/domain/errors/errors.dart';
import 'package:multiple_universe_superheroes/app/modules/search/domain/repositories/search_repository.dart';
import 'package:multiple_universe_superheroes/app/modules/search/infra/datasources/search_datasource.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchDatasource datasource;

  SearchRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, List<SuperHero>>> getHeroes(String searchText) async {
    try {
      final list = await datasource.searchByText(searchText);
      if (list == null) {
        return Left<Failure, List<SuperHero>>(DatasourceResultNull());
      }
      return Right<Failure, List<SuperHero>>(list);
    } catch (e) {
      return Left(DatasourceResultNull());
    }
  }
}
