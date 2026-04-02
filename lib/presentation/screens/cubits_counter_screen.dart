import 'package:flutter/material.dart';

class CubitsCounterScreen extends StatelessWidget {
  const CubitsCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cubit screen"),
        actions: [
          IconButton(
            onPressed: (){}, 
            icon: Icon(Icons.refresh_rounded)
          )
        ],
      ),
      body: Center(
        child: const Text("Counter Value"),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "1",
            child: const Text("+3"),
            onPressed: (){}
          ),
          const SizedBox(height: 15,),
          FloatingActionButton(
            heroTag: "1",
            child: const Text("+2"),
            onPressed: (){}
          ),
          const SizedBox(height: 15,),
          FloatingActionButton(
            heroTag: "1",
            child: const Text("+1"),
            onPressed: (){}
          )
        ],
      ),
    );
  }
}