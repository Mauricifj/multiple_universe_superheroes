import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:multiple_universe_superheroes/app/modules/search/domain/errors/errors.dart';
import 'package:multiple_universe_superheroes/app/modules/search/external/datasources/super_hero_datasource.dart';

import '../../utils/super_hero_response.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dio = DioMock();
  final datasource = SuperHeroDatasource(dio);

  test('Should return SuperHeroModel list when dio returns status code 200', () async {
    when(() => dio.get(any())).thenAnswer((_) async => Response(
          data: jsonDecode(superHeroResponse),
          statusCode: 200,
          requestOptions: RequestOptions(path: "search"),
        ));

    final future = datasource.searchByText("iron man");

    expect(future, completes);
  });

  test('Should return DatasourceResultNull when dio does not return status code 200', () async {
    when(() => dio.get(any())).thenAnswer((_) async => Response(
          data: null,
          statusCode: 401,
          requestOptions: RequestOptions(path: "search"),
        ));

    final future = datasource.searchByText("iron man");

    expect(future, throwsA(isA<DatasourceResultNull>()));
  });
}
