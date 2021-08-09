import 'package:dio/dio.dart';
import 'package:multiple_universe_superheroes/app/modules/search/domain/errors/errors.dart';
import 'package:multiple_universe_superheroes/app/modules/search/infra/datasources/search_datasource.dart';
import 'package:multiple_universe_superheroes/app/modules/search/infra/models/super_hero_model.dart';

class SuperHeroDatasource implements SearchDatasource {
  final Dio dio;

  SuperHeroDatasource(this.dio);

  @override
  Future<List<SuperHeroModel>> searchByText(String textSearch) async {
    final url = "https://akabab.github.io/superhero-api/api/all.json";
    final response = await dio.get(url);

    if (response.statusCode == 200) {
      var trimmedTextSearch = textSearch.trim();

      return response.data
          .where((item) => _searchByCodeName(item, trimmedTextSearch) || _searchByName(item, trimmedTextSearch))
          .map((item) => SuperHeroModel.fromMap(item))
          .cast<SuperHeroModel>()
          .toList();
    } else {
      throw DatasourceResultNull();
    }
  }

  bool _searchByCodeName(item, String textSearch) {
    var codeName = item['name'].toLowerCase();
    return codeName.contains(textSearch.toLowerCase());
  }

  bool _searchByName(item, String textSearch) {
    var name = item['biography']['fullName'].toLowerCase();
    return name.contains(textSearch.toLowerCase());
  }
}
