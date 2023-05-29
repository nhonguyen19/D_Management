import 'package:devide_manager/object/FacultyOject.dart';
import 'package:devide_manager/provider/api_Faculties.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

class Don_Vi extends StatefulWidget {
  const Don_Vi({Key? key});

  @override
  _Don_ViState createState() => _Don_ViState();
}

class _Don_ViState extends State<Don_Vi> {
  bool _isSearching = false;
  List<FacultyObject> _faculty = [];
  List<FacultyObject> _facultyDisplay = [];

  @override
  void initState() {
    super.initState();
    fetchFaculties();
  }

  Future<void> fetchFaculties() async {
    try {
      List<FacultyObject> faculties =
          await FacultyProvider.fetchFaculty(http.Client());
      setState(() {
        _faculty = faculties;
        _facultyDisplay = faculties;
      });
    } catch (error) {
      print('Error fetching faculties: $error');
      // Xử lý lỗi tại đây (ví dụ: hiển thị thông báo lỗi)
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _searchBar(),
      body: _buildFacultyList(),
    );
  }

  AppBar _searchBar() {
    return AppBar(
      backgroundColor: Color.fromARGB(255, 31, 60, 114),
      title: _isSearching
          ? TextField(
              style: TextStyle(color: Colors.white),
              autofocus: true,
              decoration: InputDecoration(
                hintText: 'Tìm kiếm',
                hintStyle: TextStyle(color: Colors.white70),
                border: InputBorder.none,
              ),
              onChanged: (text) {
                text = text.toLowerCase();
                setState(() {
                  _facultyDisplay = _faculty.where((faculty) {
                    return faculty.name!.toLowerCase().contains(text);
                  }).toList();
                });
              },
            )
          : Text('Danh sách đơn vị'),
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            setState(() {
              _isSearching = !_isSearching;
            });
          },
        ),
      ],
    );
  }

  Widget _buildFacultyList() {
    if (_facultyDisplay.isEmpty) {
      return Center(
        child: Text('Không tìm thấy đơn vị nào.'),
      );
    }

    return ListView.builder(
      itemCount: _facultyDisplay.length,
      itemBuilder: (context, index) => _buildFacultyItem(index),
    );
  }

  Widget _buildFacultyItem(int index) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          child: Image.network(_facultyDisplay[index].image.toString()),
        ),
        title: Text(_facultyDisplay[index].name.toString()),
        subtitle: Text(_facultyDisplay[index].image.toString()),
        trailing: const Text('x'),
      ),
    );
  }
}
