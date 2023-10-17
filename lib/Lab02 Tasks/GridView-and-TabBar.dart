import 'package:flutter/material.dart';

// tasks done by 20sw116
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Color> colors = [
      Colors.red,
      Colors.green,
      Colors.blueAccent,
      Colors.yellow,
      Colors.orange,
      Colors.red,
      Colors.green,
      Colors.blueAccent,
      Colors.yellow,
      Colors.orange
    ];

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("GridView, ListView and TabBar Demo"),
          backgroundColor: Colors.green[700],
          bottom: const TabBar(tabs: [
            Tab(
              child: Text("ListView"),
            ),
            Tab(
              child: Text("GridView"),
            ),
          ]),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
        ),
        body: TabBarView(
          children: [
            ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) => ListTile(
                      leading: const Icon(Icons.task_alt_outlined),
                      title: Text("Task No  ${index + 1} done!"),
                    )),
            GridView.builder(
                itemCount: colors.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, index) => Container(
                      color: colors[index],
                    )),
          ],
        ),
      ),
    );
  }
}
