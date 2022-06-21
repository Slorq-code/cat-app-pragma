import 'package:cat_aplication/search/search.dart';
import 'package:cat_aplication/search/search_response.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    return const Text("searching michi...");
  }

  Widget _emptyContainer() {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: const Center(
        child: Icon(
          Icons.pest_control_rodent,
          color: Colors.black38,
          size: 150,
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return _emptyContainer();
    }
     return _emptyContainer();
    /*
    final breedsService = Provider.of<BreedsService>(context, listen: false);
    breedsService.getSuggestionsByQuery(query);

    return StreamBuilder(
      stream: breedsService.suggestionStream,
      builder: (_, AsyncSnapshot<List<Breed>> snapshot) {
        if (!snapshot.hasData) return _emptyContainer();

        final breed = snapshot.data!;
        // return ListView.builder(
        //   itemCount: breed.length,
        //   itemBuilder: ( _, int index ) => _CatItem( breed[index])
        // );
        // ignore: avoid_unnecessary_containers
        return Container(child: _CatItem(breed));
      },
    );
    */
  }
}

class _CatItem extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final breed;

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


/*
funcionalidad provider no se acopla
*/ 