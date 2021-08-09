import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:multiple_universe_superheroes/app/modules/search/domain/errors/errors.dart';
import 'package:multiple_universe_superheroes/app/modules/search/infra/datasources/search_datasource.dart';
import 'package:multiple_universe_superheroes/app/modules/search/infra/models/super_hero_model.dart';
import 'package:multiple_universe_superheroes/app/modules/search/infra/repositories/search_repository_impl.dart';

class MockSearchDatasource extends Mock implements SearchDatasource {}

main() {
  final datasource = MockSearchDatasource();
  final repository = SearchRepositoryImpl(datasource);

  test('Should return SuperHeroModel list when datasource is ok', () async {
    when(() => datasource.searchByText(any())).thenAnswer((_) async => <SuperHeroModel>[
          SuperHeroModel(
              id: 1,
              codeName: "codeName",
              name: "name",
              gender: "gender",
              occupation: "occupation",
              image: "image",
              thumbnail: "thumbnail")
        ]);

    final result = await repository.getHeroes("iron man");

    expect(result.fold((l) => l, (r) => r), isA<List<SuperHeroModel>>());
  });

  test('Should return DatasourceResultNull when datasource fails', () async {
    when(() => datasource.searchByText(any())).thenThrow(Exception());

    final result = await repository.getHeroes("iron man");

    expect(result.fold(id, id), isA<DatasourceResultNull>());
  });
}
