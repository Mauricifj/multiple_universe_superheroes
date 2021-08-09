import 'package:multiple_universe_superheroes/app/modules/search/domain/entities/super_hero.dart';

abstract class SearchDatasource {
  Future<List<SuperHero>?> searchByText(String searchText);
}
