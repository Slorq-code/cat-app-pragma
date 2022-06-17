import 'package:flutter/material.dart';
import 'package:cat_aplication/services/cat_service.dart';
import 'package:cat_aplication/search/search_response.dart';

class CatSearchDelegate extends SearchDelegate {
  @override
  String get searchFieldLabel => "  Search for a kitten <3";

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () => query = "",
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text("build...");
  }

  Widget _emptyContainer() {
    return Container(
      child: const Center(
        child: Icon(
          Icons.pest_control_rodent,
          color: Colors.black38,
          size: 130,
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return _emptyContainer();
    }
/*
      final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);
      moviesProvider.getSuggestionsByQuery( query );
*/
    return StreamBuilder(
        builder: (_, AsyncSnapshot<List<Breeds>> snapshot) {
        if (!snapshot.hasData) return _emptyContainer();

        final breed = snapshot.data!;

        return ListView.builder(
            itemCount: breed.length,
            itemBuilder: (_, int index) => _CatItem(breed[index]));
      },
    );
  }
}

class _CatItem extends StatelessWidget {
  final Breeds breed;

  const _CatItem(this.breed);

  @override
  Widget build(BuildContext context) {
    breed.name = 'search-${breed.name}';

    return ListTile(
      leading: Hero(
        tag: breed.name,
        child: FadeInImage(
          placeholder: const AssetImage('assets/no-image.jpg'),
          image: NetworkImage("${breed.image}"),
          width: 50,
          fit: BoxFit.contain,
        ),
      ),
      title: Text(breed.name),
      onTap: () {
        Navigator.pushNamed(context, 'details', arguments: breed);
      },
    );
  }
}
