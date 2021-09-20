import 'package:flutter/material.dart';
import 'package:materialtopic/bottom_navigation_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
      home: BottomNav(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  //late PersistentBottomSheetController _controller;

  void openDrawer() {
    scaffoldKey.currentState!.openDrawer(); //openEnd
  }

  // void toggleBottomSheet() {
  //   if (_controller == null) {
  //     _controller = scaffoldKey.currentState!.showBottomSheet(
  //       (context) => Container(
  //         color: Colors.deepOrange,
  //         height: 200,
  //         child: Center(
  //           child: Text('Bottom Sheet'),
  //         ),
  //       ),
  //     );
  //   } else {
  //     _controller.close();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('AppBar Title'),
        centerTitle: false,
        actions: [
          Builder(
            builder: (context) => IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(Icons.person),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.green,
                backgroundImage: NetworkImage('https://picsum.photos/1200/500'),
              ),
            ),
            ListTile(
                title: Text('Home'),
                leading: Icon(Icons.home),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  print('TAP');
                },
                onLongPress: () {
                  print('LONG PRESS');
                }),
            SizedBox(
              width: 100,
            )
          ],
        ),
      ),
      endDrawer: Drawer(
        child: Center(
          child: Text('End Drawer'),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              onPressed: openDrawer,
              child: Text('Open Drawer'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        // shape: CircularNotchedRectangle(),
        // elevation: 10,
        // notchMargin: 8,
        // clipBehavior: Clip.antiAlias,
        child: Container(
          child: BottomNavigationBar(
            elevation: 0,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: "Favourite",
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   onPressed: () {},
      // ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.add),
        onPressed: () {}, //toggleBottomSheet,
        label: Text('Open'),
      ),
      // bottomSheet: BottomSheet(
      //   builder: (context) => Container(
      //     height: 100,
      //     child: Center(
      //       child: Text('BottomSheet'),
      //     ),
      //   ),
      //   onClosing: () {},
      // ),
    );
  }
}
