import 'package:flutter/material.dart';
import 'search.dart';

class CatSearchDelegate extends SearchDelegate {
  @override
  String get searchFieldLabel => "  Search Cat";
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
    // ignore: prefer_is_empty
    if (query.length == 0) {
      // ignore: avoid_unnecessary_containers
      return Container(
        child: const Center(
          child: Icon(
            Icons.question_mark_sharp,
            color: Colors.black38,
            size: 150,
          ),
        ),
      );
    }
    // ignore: avoid_print, unnecessary_new
    final breedsService = new BreedsService();

    return FutureBuilder(
      future: breedsService.getBreedsByName(query),
      builder: (_, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {

          return _ShowMeCats(snapshot.data);

        } else if (!snapshot.hasData || snapshot.hasError) {

          return _NotCats();

        } else {

          return const Center(
              child: CircularProgressIndicator(strokeWidth: 10));
        }
      },
    );
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
    return _emptyContainer();
  }
//-------------------------- // fin del search delegate // -------------------

  // ignore: non_constant_identifier_names
  Widget _ShowMeCats(breeds) {
    return ListView.builder(
      itemCount: breeds?.length,
      itemBuilder: (context, i) {
        final breend = breeds[i];
        // print(breend.name);
        return ListTile(
            leading: const Icon(Icons.pets),
            title: Text(breend.name),
            subtitle: Text("Country of origin ${breend.name}"),
            // ignore: prefer_interpolation_to_compose_strings
            trailing: Text("Code country from " + breend.countryCode),
            onTap: () {
              close(context, breeds);
            });
      },
    );
  }

  // ignore: non_constant_identifier_names
  Widget _NotCats() {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: const Center(child: Text('I cant find the Michi')),
    );
  }
}

/*

class _NewItemCat extends StatelessWidget {
  final List<Breeds> breed;
  const _NewItemCat(this.breed);

  @override
  Widget build(BuildContext context) {
    breed.id = 'search-${breed.id}';

    return ListTile(
      leading: Hero(
        tag: breed.id,
        child: FadeInImage(
          placeholder: const AssetImage('assets/img/no-image.jpg'),
          image: NetworkImage(breed.referenceImageId),
          width: 50,
          fit: BoxFit.contain,
        ),
      ),
      title: Text(breed.name),
      subtitle: Text(breed.origin),
    );
  }
}

*/
