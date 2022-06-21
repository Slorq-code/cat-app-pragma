import 'package:flutter/material.dart';

import 'package:cat_aplication/pages/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (contet) => const HomeScreen()));
      },
      child: Scaffold(
        body: Center(
          child: _GatitoCard(),
        ),
      ),
    );
  }
}

class _GatitoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      width: 450,
      child: Column(
        children: <Widget>[
        // const Divider(height: 5),
          _TarjetaTitulo(),
          _SubTarjetaTitulo(),
          _TarjetaImagen(),
          const SizedBox(height: 10),
         // const Divider(height: 5),
        ],
      ),
    );
  }
}

class _TarjetaImagen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 10000), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (contet) => const HomeScreen()));
    });

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: const ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(120),
          bottomRight: Radius.circular(120),
          bottomLeft: Radius.circular(120),
          topRight: Radius.circular(120),
        ),
        child: Image(
          image: AssetImage('assets/img/splash2.gif'),
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
        "Welcome to minino app",
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _SubTarjetaTitulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: const Text(
        "loading mimino information...",
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
      ),
    );
  }
}
