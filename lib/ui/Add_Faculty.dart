import 'dart:io';
import 'package:devide_manager/provider/api_Faculties.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';

class AddFacultyScreen extends StatefulWidget {
  const AddFacultyScreen({Key? key}) : super(key: key);

  @override
  _AddFacultyScreenState createState() => _AddFacultyScreenState();
}

class _AddFacultyScreenState extends State<AddFacultyScreen> {
  TextEditingController _nameController = TextEditingController();
  File? _image;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255,31, 60, 114),
        title: Text('Thêm khoa'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Tên khoa',
              ),
            ),
            SizedBox(height: 16.0),
            _buildImagePreview(),
            SizedBox(height: 16.0),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    // Xác định màu cho từng trạng thái của button
                    if (states.contains(MaterialState.disabled)) {
                      // Trạng thái disabled (không thể nhấn)
                      return Colors.grey;
                    }
                    // Trạng thái enabled (có thể nhấn)
                    return Color.fromARGB(255, 31, 60, 114);
                  },
                ),
              ),
              onPressed: _isLoading ? null : _addFaculty,
              child: _isLoading
                  ? Center(
                      child: SpinKitChasingDots(
                        color: Color.fromARGB(255, 31, 60, 114),
                        size: 50,
                      ),
                    )
                  : Text('Thêm khoa'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImagePreview() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hình ảnh',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.0),
        GestureDetector(
          onTap: _pickImage,
          child: _image != null
              ? Image.file(
                  _image!,
                  height: 150,
                  width: 150,
                  fit: BoxFit.cover,
                )
              : Container(
                  height: 150,
                  width: 150,
                  color: Colors.grey,
                  child: Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                  ),
                ),
        ),
      ],
    );
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  Future<void> _addFaculty() async {
    setState(() {
      _isLoading = true;
    });

    final String name = _nameController.text;

    final String imagePath = _image != null ? _image!.path : '';

    try {
      final bool isSuccess = await FacultyProvider.addFaculty(name, imagePath);

      if (isSuccess) {
        // Thêm khoa thành công
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Thêm khoa thành công'),
          ),
        );
        Navigator.pop(context,
            true); // Quay trở lại màn hình trước và truyền giá trị true để thông báo thành công
      } else {
        // Thêm khoa thất bại
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Thêm khoa thất bại'),
          ),
        );
      }
    } catch (error) {
      // Xử lý lỗi khi thêm khoa
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Lỗi khi thêm khoa. Vui lòng thử lại sau.'),
        ),
      );
    }

    setState(() {
      _isLoading = false;
    });
  }
}
