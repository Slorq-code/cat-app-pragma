import 'package:flutter/material.dart';

import 'package:cat_aplication/pages/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
      body: _GatitoCard(),
      ),
    );
  }
}

class _GatitoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Divider(height: 50),
        _TarjetaTitulo(),
        _TarjetaImagen(),
        const SizedBox(height: 10),
        const Divider(height: 50),
      ],
    );
  }
}

class _TarjetaImagen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (contet) => const HomeScreen()));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
          child: Container(
              child: const Image(
            image: AssetImage('assets/img/splash.gif'),
          )),
        ),
      ),
    );
  }
}

class _TarjetaTitulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: const Text(
        "Touch me",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      ),
    );
  }
}
