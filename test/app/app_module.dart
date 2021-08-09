import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:multiple_universe_superheroes/app/app_module.dart';
import 'package:multiple_universe_superheroes/app/modules/search/domain/entities/super_hero.dart';
import 'package:multiple_universe_superheroes/app/modules/search/domain/usecases/search_by_text.dart';

import 'modules/search/utils/super_hero_response.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dio = DioMock();
  initModule(AppModule(), replaceBinds: [Bind<Dio>((i) => dio)]);

  test('Should get SearchByText implementation', () {
    final usecase = Modular.get<SearchByText>();
    expect(usecase, isA<SearchByText>());
  });

  test('Should return SuperHero list when usecase is retrieved', () async {
    when(() => dio.get(any())).thenAnswer((_) async => Response(
          data: jsonDecode(superHeroResponse),
          statusCode: 200,
          requestOptions: RequestOptions(path: "search"),
        ));

    final usecase = Modular.get<SearchByText>();
    final result = await usecase("iron man");

    expect(result.fold((l) => l, (r) => r), isA<List<SuperHero>>());
  });
}
