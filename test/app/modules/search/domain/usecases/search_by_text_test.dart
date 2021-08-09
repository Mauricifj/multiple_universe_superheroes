import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:multiple_universe_superheroes/app/modules/search/domain/entities/super_hero.dart';
import 'package:multiple_universe_superheroes/app/modules/search/domain/errors/errors.dart';
import 'package:multiple_universe_superheroes/app/modules/search/domain/repositories/search_repository.dart';
import 'package:multiple_universe_superheroes/app/modules/search/domain/usecases/search_by_text.dart';

class MockSearchRepository extends Mock implements SearchRepository {}

main() {
  final repository = MockSearchRepository();
  final usecase = SearchByTextImpl(repository);

  test('Should return SuperHero list when text is ok', () async {
    when(() => repository.getHeroes(any())).thenAnswer((_) async => Right(<SuperHero>[]));

    final result = await usecase("maurici");

    expect(result.isRight(), true);
    expect(result.fold((l) => l, (r) => r), isA<List<SuperHero>>());
  });
}
