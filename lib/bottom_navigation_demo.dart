import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(const BottomNavigationDemo());

class BottomNavigationDemo extends StatelessWidget {
  const BottomNavigationDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue,),
      initialRoute: 'bottom_navigation_demo',
      home: const TabNavigator(),
    );
  }
}

class TabNavigator extends StatefulWidget {
  const TabNavigator({Key? key}) : super(key: key);

  @override
  State<TabNavigator> createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator>
    with SingleTickerProviderStateMixin {
  final _defaultColor = Colors.grey;
  final _activeColor = Colors.blue;
  int _currentIndex = 0;
  final _controller = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BottomNavigationDemo'),),
      body: PageView(
        controller: _controller,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          Center(child: Text('首页'),),
          Center(child: Text('搜索')),
          Center(child: Text('旅拍')),
          Center(child: Text('我的')),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue,),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                if (kDebugMode) {
                  print('click Item 2');
                }
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          _controller.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: _defaultColor,),
            activeIcon: Icon(Icons.home, color: _activeColor,),
            label: '首页',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: _defaultColor,),
            activeIcon: Icon(Icons.search, color: _activeColor,),
            label: '搜索',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt, color: _defaultColor,),
            activeIcon: Icon(Icons.camera_alt, color: _activeColor,),
            label: '旅拍',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle, color: _defaultColor,),
            activeIcon: Icon(Icons.account_circle, color: _activeColor,),
            label: '我的',
          ),
        ],
      ),
    );
  }
}
