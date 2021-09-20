import 'package:flutter/material.dart';

class TabItem {
  String title;
  Icon icon;
  TabItem({required this.title, required this.icon});
}

final List<TabItem> _tabBar = [
  TabItem(title: 'Photo', icon: Icon(Icons.home)),
  TabItem(title: 'Chat', icon: Icon(Icons.chat)),
  TabItem(title: 'Albums', icon: Icon(Icons.album)),
];

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabBar.length, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _currentTabIndex = _tabController.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigation bar'),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Container(
            color: Colors.green,
            child: Center(
              child: Text('1'),
            ),
          ),
          Container(
            color: Colors.yellow,
            child: Center(
              child: Text('2'),
            ),
          ),
          Container(
            color: Colors.purple,
            child: Center(
              child: Text('3'),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _tabController.index = index;
            _currentTabIndex = index;
          });
        },
        currentIndex: _currentTabIndex,
        items: [
          for (final item in _tabBar)
            BottomNavigationBarItem(label: item.title, icon: item.icon),
        ],
      ),
    );
  }
}
