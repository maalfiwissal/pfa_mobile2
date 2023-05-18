import 'package:flutter/material.dart';

class VillePage extends StatefulWidget {
  const VillePage({Key? key}) : super(key: key);

  @override
  State<VillePage> createState() => _VillePageState();
}

class _VillePageState extends State<VillePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Villes'),
      ),
      body: Center(child: Text("Villes Page")),
    );
  }
}
