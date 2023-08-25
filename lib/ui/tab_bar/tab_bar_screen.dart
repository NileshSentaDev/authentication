import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TabPaginationDemo(),
    );
  }
}

class TabPaginationDemo extends StatefulWidget {
  @override
  _TabPaginationDemoState createState() => _TabPaginationDemoState();
}

class _TabPaginationDemoState extends State<TabPaginationDemo> {
  final int initialTabCount = 5;
  final int itemsPerPage = 5;
  int totalTabs = 20;
  int visibleTabs = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tab Pagination Demo'),
        bottom: TabBar(
          tabs: List.generate(
            visibleTabs,
                (index) => Tab(text: 'Tab ${index + 1}'),
          ),
        ),
      ),
      body: DefaultTabController(
        length: totalTabs,
        child: Column(
          children: [
            Expanded(
              child: TabBarView(
                children: List.generate(
                  totalTabs,
                      (index) => Container(
                    color: Colors.blue,
                    child: Center(
                      child: Text('Content of Tab ${index + 1}'),
                    ),
                  ),
                ),
              ),
            ),
            if (visibleTabs < totalTabs)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      final nextVisibleTabs = visibleTabs + itemsPerPage;
                      visibleTabs = nextVisibleTabs <= totalTabs
                          ? nextVisibleTabs
                          : totalTabs;
                    });
                  },
                  child: Text('Load More'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
