import 'package:flutter/material.dart';
import 'package:cat_aplication/pages/details_screen.dart';
import 'package:cat_aplication/models/cats_models.dart';
import 'package:provider/provider.dart';

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
    return Column(
      children: <Widget>[
        const Divider(height: 50),
        _TarjetaTitulo(minino),
        _TarjetaImagen(minino),
        _TarjetaFooter(minino),
        const SizedBox(height: 10),
        const Divider(height: 50),
      ],
    );
  }
}

class _TarjetaImagen extends StatelessWidget {
  final Cat minino;

  const _TarjetaImagen(this.minino);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailsScreen(
                      minino: minino,
                    )));
      },
      child: Container(
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
        "Nombre de raza ${minino.name}",
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
        "Pais de origen: ${minino.origin}",
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      ),
    );
  }
}


/*
class _TarjetaImagen extends StatelessWidget {
  final Cat minino;
  const _TarjetaImagen(this.minino);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      child: Container(
        width: double.infinity,
        height: 430,
        decoration: BoxDecoration(
            color: Colors.yellow, borderRadius: BorderRadius.circular(50)),
        child: Column(

            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[
              // ignore: prefer_const_constructors
              _Gatito(minino),
            ]),
      ),
    );
  }
}


class _Gatito extends StatelessWidget {
  const _Gatito(this.minino) : super();

  final Cat minino;

  @override
  Widget build(BuildContext context) {
    final photo = minino.image;

    return Container(
        child: Image(image: minino.image)
    );
  }
}
*/