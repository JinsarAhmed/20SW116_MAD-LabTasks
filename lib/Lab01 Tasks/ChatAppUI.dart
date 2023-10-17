// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

// tasks done by 20sw116
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF075E54),
        title: Text('WhatsApp'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.camera_alt)),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: [
            Tab(
              icon: Icon(Icons.groups),
            ),
            Tab(text: '     Chats   '),
            Tab(text: '     Status   '),
            Tab(text: '     Calls'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(child: Text('Groups')),
          ListView(
            children: [
              ListTile(
                onTap: () {},
                leading: Icon(
                  Icons.archive,
                  color: Color(0xFF075E54),
                ),
                title: Text(
                  "Archived",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: Text(
                  "14",
                  style: TextStyle(color: Colors.green),
                ),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.black,
                ),
                title: Text("Ahmed"),
                subtitle:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Icon(
                    Icons.done_all,
                    color: Colors.blue,
                    size: 18,
                  ),
                  Text("  i will be waiting"),
                ]),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/rafay.jpg"),
                ),
                title: Text("Rafay"),
                subtitle: Text(
                  "Waiting",
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ),
              ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.groups),
                ),
                title: Text("MATHSFLIX"),
                subtitle: Text(
                  "~ Abdul Munam: Bro Nts!",
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/class.jpg"),
                ),
                title: Text("Class Discussion"),
                subtitle: Text("~ Junaid: Attendance horahi hai"),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.black,
                ),
                title: Text("Ahmed"),
                subtitle:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Icon(
                    Icons.done_all,
                    color: Colors.blue,
                    size: 18,
                  ),
                  Text("  i will be waiting"),
                ]),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/rafay.jpg"),
                ),
                title: Text("Rafay"),
                subtitle: Text(
                  "Waiting",
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ),
              ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.groups),
                ),
                title: Text("MATHSFLIX"),
                subtitle: Text(
                  "~ Abdul Munam: Bro Nts!",
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/class.jpg"),
                ),
                title: Text("Class Discussion"),
                subtitle: Text("~ Junaid: Attendance horahi hai"),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.black,
                ),
                title: Text("Ahmed"),
                subtitle:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Icon(
                    Icons.done_all,
                    color: Colors.blue,
                    size: 18,
                  ),
                  Text("  i will be waiting"),
                ]),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/rafay.jpg"),
                ),
                title: Text("Rafay"),
                subtitle: Text(
                  "Waiting",
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ),
              ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.groups),
                ),
                title: Text("MATHSFLIX"),
                subtitle: Text(
                  "~ Abdul Munam: Bro Nts!",
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/class.jpg"),
                ),
                title: Text("Class Discussion"),
                subtitle: Text("~ Junaid: Attendance horahi hai"),
              ),
            ],
          ),
          Center(child: Text('Status')),
          Center(child: Text('Calls')),
        ],
      ),
    );
  }
}
