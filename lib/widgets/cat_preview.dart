import 'package:flutter/material.dart';
import 'package:cat_aplication/pages/details_screen.dart';
import 'package:cat_aplication/models/cats_models.dart';

class CatPreview extends StatelessWidget {
  final List<Cat>? minino;

  // ignore: use_key_in_widget_constructors
  const CatPreview(this.minino);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: minino?.length,
      itemBuilder: (BuildContext context, int index) {
        return _GatitoCard(
          minino: minino![index],
          index: index,
        );
      },
    );
  }
}

class _GatitoCard extends StatelessWidget {
  final Cat minino;
  final int index;

  const _GatitoCard({required this.minino, required this.index});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailsScreen(
                      minino: minino,
                    )));
      },
      child: Column(
        children: <Widget>[
          const Divider(height: 50),
          _TarjetaTitulo(minino),
          _TarjetaImagen(minino),
          _TarjetaFooter(minino),
          const SizedBox(height: 10),
          const Divider(height: 50),
        ],
      ),
    );
  }
}

class _TarjetaImagen extends StatelessWidget {
  final Cat minino;

  const _TarjetaImagen(this.minino);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
        child: Container(
            child: (minino.image != null)
                ? FadeInImage(
                    placeholder: const AssetImage('assets/img/giphy.gif'),
                    image: NetworkImage("${minino.image?.url}"))
                : const Image(
                    image: AssetImage('assets/img/no-image.png'),
                  )),
      ),
    );
  }
}

class _TarjetaTitulo extends StatelessWidget {
  final Cat minino;

  const _TarjetaTitulo(this.minino);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        "Name of breed: ${minino.name}.",
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _TarjetaFooter extends StatelessWidget {
  final Cat minino;

  const _TarjetaFooter(this.minino);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        "Country of origin: ${minino.origin}.",
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      ),
    );
  }
}
