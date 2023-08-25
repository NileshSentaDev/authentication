import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: PaginatedListExample(),
  ));
}

class PaginatedListExample extends StatefulWidget {
  @override
  _PaginatedListExampleState createState() => _PaginatedListExampleState();
}

class _PaginatedListExampleState extends State<PaginatedListExample> {
  List<int> _items = List.generate(100, (index) => index + 1);
  int _currentPage = 1;
  int _pageSize = 10;

  void _loadMoreItems() {
    int startIndex = (_currentPage - 1) * _pageSize;
    int endIndex = startIndex + _pageSize;
    for (int i = startIndex; i < endIndex; i++) {
      if (i < _items.length) {
        continue;
      }
      _items.add(i + 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paginated List Example'),
      ),
      body: ListView.builder(
        itemCount: _items.length + 1,
        itemBuilder: (context, index) {
          if (index < _items.length) {
            return ListTile(
              title: Text('Item ${_items[index]}'),
            );
          } else if (index == _items.length) {
            return Center(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _currentPage++;
                    _loadMoreItems();
                  });
                },
                child: Text('Load More'),
              ),
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
