import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:multiple_universe_superheroes/app/modules/search/presenter/search/search_bloc.dart';
import 'package:multiple_universe_superheroes/app/modules/search/presenter/search/states/states.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final bloc = Modular.get<SearchBloc>();

  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    var _controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Super Heroes'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
            child: TextField(
              controller: _controller,
              onChanged: bloc.add,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Search...",
                suffixIcon: IconButton(
                  onPressed: () {
                    _controller.clear();
                    bloc.add("");
                  },
                  icon: Icon(Icons.clear),
                ),
              ),
            ),
          ),
          Expanded(
            child: StreamBuilder(
              stream: bloc.stream,
              builder: (context, snapshot) {
                final state = bloc.state;

                if (state is SearchStart) {
                  return Center(child: Text("Type something to start the search"));
                }

                if (state is SearchError) {
                  return Center(child: Text("Something went wrong"));
                }

                if (state is SearchLoading) {
                  return Center(child: CircularProgressIndicator());
                }

                final list = (state as SearchSuccess).list;

                if (list.isEmpty) {
                  return Center(child: Text("Nothing found, try something different"));
                }

                return ListView.separated(
                  separatorBuilder: (BuildContext context, int index) => Divider(),
                  itemCount: list.length,
                  itemBuilder: (_, id) {
                    final item = list[id];
                    return ListTile(
                      title: Text(item.codeName),
                      subtitle: Text(item.name),
                      leading: CircleAvatar(backgroundImage: NetworkImage(item.thumbnail)),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
