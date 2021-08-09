import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:multiple_universe_superheroes/app/modules/search/domain/entities/super_hero.dart';
import 'package:multiple_universe_superheroes/app/modules/search/domain/errors/errors.dart';
import 'package:multiple_universe_superheroes/app/modules/search/domain/usecases/search_by_text.dart';
import 'package:multiple_universe_superheroes/app/modules/search/presenter/search/search_bloc.dart';
import 'package:multiple_universe_superheroes/app/modules/search/presenter/search/states/states.dart';

class SearchByTextMock extends Mock implements SearchByText {}

main() {
  final usecase = SearchByTextMock();
  final bloc = SearchBloc(usecase);

  test('Should return SearchSuccess when text is ok', () {
    when(() => usecase.call(any())).thenAnswer((_) async => Right(<SuperHero>[]));

    expect(
        bloc.stream,
        emitsInOrder([
          isA<SearchLoading>(),
          isA<SearchSuccess>(),
        ]));

    bloc.add("iron man");
  });
}
