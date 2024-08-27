import 'package:flutter/material.dart';
import 'package:flutter_application_2/image_wid.dart';

class ScaffoldWid extends StatelessWidget {
  const ScaffoldWid({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ghumaisha'),
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.home,
            )),
        backgroundColor: Color.fromARGB(255, 185, 22, 155),
        foregroundColor: const Color.fromARGB(255, 5, 5, 5),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
          Icon(Icons.logout)
        ],
      ),
      body: ImageWid(),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.purple,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              backgroundColor: Colors.purple),
          BottomNavigationBarItem(
              icon: Icon(Icons.undo),
              label: "Undo",
              backgroundColor: Colors.purple)
        ],
      ),
    );
  }
}
