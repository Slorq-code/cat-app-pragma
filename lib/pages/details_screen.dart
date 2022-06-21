import 'package:flutter/material.dart';

import '../models/cats_models.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key, required this.minino}) : super(key: key);

  final Cat minino;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("Your cat is ${minino.name}"),
          elevation: 0,
        ),
        body: Column(children: [
          SizedBox(
            width: size.width,
            height: size.height * 0.3,
            child: _TarjetaImagen(minino),
          ),
          SizedBox(
              width: double.infinity,
              height: size.height * 0.50,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _TarjetaDescription(minino),
                    const Divider(),
                    _TarjetaTemperament(minino),
                    const Divider(),
                    _TarjetaOrigen(minino),
                    const Divider(),
                    _TarjetaCountryCodes(minino),
                    const Divider(),
                    _TarjetaPuntuacionesDog(minino),
                    const Divider(),
                    _TarjetaPuntuacionesBaby(minino),
                    const Divider(),
                    _TarjetaPuntuacionesEnergy(minino),
                    const Divider(),
                    _TarjetaPuntuacionesGrooming(minino),
                    const Divider(),
                    _TarjetaPuntuacionesHealth(minino),
                    const Divider(),
                    _TarjetaPuntuacionesInteligent(minino),
                    const Divider(),
                  ],
                ),
              ))
        ]));
  }
}

class _TarjetaImagen extends StatelessWidget {
  final Cat minino;

  const _TarjetaImagen(this.minino);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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

class _TarjetaDescription extends StatelessWidget {
  final Cat minino;

  const _TarjetaDescription(this.minino);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        minino.description,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _TarjetaTemperament extends StatelessWidget {
  final Cat minino;

  const _TarjetaTemperament(this.minino);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        "How irritable is it?: ${minino.temperament}.",
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _TarjetaOrigen extends StatelessWidget {
  final Cat minino;

  const _TarjetaOrigen(this.minino);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        "where is this kitten from?: ${minino.origin}.",
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _TarjetaCountryCodes extends StatelessWidget {
  final Cat minino;

  const _TarjetaCountryCodes(this.minino);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        "And the country code for that country is: ${minino.countryCodes}.",
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _TarjetaPuntuacionesDog extends StatelessWidget {
  final Cat minino;

  const _TarjetaPuntuacionesDog(this.minino);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        "Dog friendliness rating: ${minino.dogFriendly}.",
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _TarjetaPuntuacionesBaby extends StatelessWidget {
  final Cat minino;

  const _TarjetaPuntuacionesBaby(this.minino);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        "Baby friendliness score: ${minino.childFriendly}.",
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _TarjetaPuntuacionesEnergy extends StatelessWidget {
  final Cat minino;

  const _TarjetaPuntuacionesEnergy(this.minino);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        "Vitality rating: ${minino.energyLevel}.",
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _TarjetaPuntuacionesGrooming extends StatelessWidget {
  final Cat minino;

  const _TarjetaPuntuacionesGrooming(this.minino);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        "Points for cleanlines: ${minino.grooming}.",
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _TarjetaPuntuacionesHealth extends StatelessWidget {
  final Cat minino;

  const _TarjetaPuntuacionesHealth(this.minino);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        "Prone to NOT getting sick: ${minino.healthIssues}.",
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _TarjetaPuntuacionesInteligent extends StatelessWidget {
  final Cat minino;

  const _TarjetaPuntuacionesInteligent(this.minino);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        "Intelligence score: ${minino.intelligence}.",
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      ),
    );
  }
}
