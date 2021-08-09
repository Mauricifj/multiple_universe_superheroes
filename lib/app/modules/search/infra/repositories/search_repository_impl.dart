import 'package:dartz/dartz.dart';
import 'package:multiple_universe_superheroes/app/modules/search/domain/errors/errors.dart';
import 'package:multiple_universe_superheroes/app/modules/search/domain/repositories/search_repository.dart';
import 'package:multiple_universe_superheroes/app/modules/search/infra/datasources/search_datasource.dart';
import 'package:multiple_universe_superheroes/app/modules/search/infra/models/super_hero_model.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchDatasource datasource;

  SearchRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, List<SuperHeroModel>>> getHeroes(String searchText) async {
    try {
      final list = await datasource.searchByText(searchText);
      if (list == null) {
        return Left<Failure, List<SuperHeroModel>>(DatasourceResultNull());
      }
      return Right<Failure, List<SuperHeroModel>>(list);
    } catch (e) {
      return Left(DatasourceResultNull());
    }
  }

  @override
  Future<Either<Failure, SuperHeroModel>> getHeroById(String id) async {
    try {
      final superHero = await datasource.searchById(id);
      if (superHero == null) {
        return Left<Failure, SuperHeroModel>(DatasourceResultNull());
      }
      return Right<Failure, SuperHeroModel>(superHero);
    } catch (e) {
      return Left(DatasourceResultNull());
    }
  }
}
