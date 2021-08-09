import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/search/domain/usecases/search_by_text.dart';
import 'modules/search/external/datasources/super_hero_datasource.dart';
import 'modules/search/infra/repositories/search_repository_impl.dart';
import 'modules/search/presenter/details/details_page.dart';
import 'modules/search/presenter/search/search_bloc.dart';
import 'modules/search/presenter/search/search_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => Dio()),
        Bind((i) => SuperHeroDatasource(i())),
        Bind((i) => SearchRepositoryImpl(i())),
        Bind((i) => SearchByTextImpl(i())),
        Bind((i) => SearchBloc(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute("/", child: (_, __) => SearchPage()),
        ChildRoute("/details/:id", child: (_, args) => DetailsPage(superHero: args.data)),
      ];
}
