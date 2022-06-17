import 'package:flutter/material.dart';
import 'package:cat_aplication/services/cat_service.dart';
import 'package:cat_aplication/widgets/cat_preview.dart';
import 'package:cat_aplication/search/search_service.dart';
import 'package:provider/provider.dart';

const image2 = Image(
  image: AssetImage('assets/img/no-image.png'),
);

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final cats = Provider.of<CatsService>(context).cats;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Mininos'),
          elevation: 0,
          actions: [
              IconButton(
            icon: const Icon( Icons.search_outlined ),
            onPressed: () => showSearch(context: context, delegate: CatSearchDelegate() ),
            //onPressed: () {},
          )
          ],
        ),
        body: CatPreview(cats)
    );
  }
}







/*
Column(
        children: <Widget>[
          const CustomAppBar(texto: 'Cute cats'),
          const SizedBox(height: 20),
          Expanded(
              child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: const <Widget>[
                Hero(tag: '1er cat', child: CatPreview(mininos:[],)),
              ],
            ),
          )),
        ],
      ),
*/