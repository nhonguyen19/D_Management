import 'package:devide_manager/object/FacultyOject.dart';
import 'package:devide_manager/provider/api_Faculties.dart';
import 'package:devide_manager/ui/Add_Faculty.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

//import 'FacultyEditScreen.dart'; // Import the new screen for editing faculties

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
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error fetching faculties. Please try again later.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _searchBar(),
      body: _buildFacultyList(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 31, 60, 114),
        child: Icon(Icons.add),
        onPressed: () {
          _navigateToFacultyEditScreen();
        },
      ),
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
                    return faculty.name!.toLowerCase().contains(text) ||
                        faculty.image!.toLowerCase().contains(text);
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
        child: SpinKitChasingDots(
          color: Color.fromARGB(255, 31, 60, 114),
          size: 50,
        ),
      );
    }

    return ListView.builder(
      itemCount: _facultyDisplay.length,
      itemBuilder: (context, index) => _buildFacultyItem(index),
    );
  }

  Widget _buildFacultyItem(int index) {
  final FacultyObject faculty = _facultyDisplay[index];

  return Dismissible(
    key: Key(faculty.id.toString()),
    direction: DismissDirection.endToStart,
    background: Container(
      color: Colors.orange,
      alignment: Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.only(right: 16.0),
        child: Icon(Icons.edit, color: Colors.white),
      ),
    ),
    onDismissed: (direction) {
      _navigateToFacultyEditScreen(); // Navigate to edit screen when swiped from right to left
    },
    child: Card(
      child: ListTile(
        leading: CircleAvatar(
          child: Image.network(faculty.image.toString()),
        ),
        title: Text(faculty.name.toString()),
        subtitle: Text(faculty.image.toString()),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            _showDeleteConfirmationDialog(faculty); // Show delete confirmation dialog when delete button is pressed
          },
        ),
      ),
    ),
  );
}


  void _navigateToFacultyEditScreen() {
    Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => AddFacultyScreen(),
    ),
    );
  }

  void _showDeleteConfirmationDialog(FacultyObject faculty) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Xóa khoa'),
          content: Text('Bạn có chắc chắn muốn xóa khoa này?'),
          actions: <Widget>[
            TextButton(
              child: Text('Hủy'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Xóa'),
              onPressed: () {
                _deleteFaculty(faculty); // Call the delete faculty method
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _deleteFaculty(FacultyObject faculty) async {
    // Call the API or perform any necessary logic to delete the faculty
    // Update the _faculty and _facultyDisplay lists accordingly
    // For example:
    // await FacultyProvider.deleteFaculty(http.Client(), faculty);
    // setState(() {
    //   _faculty.remove(faculty);
    //   _facultyDisplay.remove(faculty);
    // });
  }
}
