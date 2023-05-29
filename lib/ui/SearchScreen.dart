import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool _isSearching = false;
  List<String> searchResults = [];

  Future<void> search(String query) async {
    // Thực hiện tìm kiếm từ API và cập nhật searchResults
  }

  void toggleSearch() {
    setState(() {
      _isSearching = !_isSearching;
      if (!_isSearching) {
        searchResults = [];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 31, 60, 114),
        title: _isSearching
            ? TextField(
                style: TextStyle(color: Colors.white),
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    search(value);
                  } else {
                    setState(() {
                      searchResults = [];
                    });
                  }
                },
                decoration: InputDecoration(
                  hintText: 'Tìm kiếm...',
                  hintStyle: TextStyle(color: Colors.white70),
                ),
              )
            : const Text('Danh sách đơn vị'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: toggleSearch,
          ),
        ],
      ),
      body: _isSearching
          ? ListView.builder(
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                final result = searchResults[index];
                return ListTile(
                  title: Text(result),
                  onTap: () {
                    // Xử lý khi người dùng chọn kết quả tìm kiếm
                  },
                );
              },
            )
          : const Text('Nhấn biểu tượng tìm kiếm để bắt đầu tìm kiếm'),
    );
  }
}
