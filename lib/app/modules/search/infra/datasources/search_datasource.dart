import 'package:multiple_universe_superheroes/app/modules/search/infra/models/super_hero_model.dart';

abstract class SearchDatasource {
  Future<List<SuperHeroModel>?> searchByText(String searchText);
  Future<SuperHeroModel?> searchById(String id);
}
