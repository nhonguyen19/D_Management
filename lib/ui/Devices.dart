import 'package:devide_manager/object/DeviceObject.dart';
import 'package:devide_manager/provider/api_Device.dart';
import 'package:devide_manager/object/TypeOfDeviceObject.dart';
import 'package:devide_manager/provider/api_Type_Of_Device.dart';
import 'package:devide_manager/ui/DeviceDetails.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

class Thiet_Bi extends StatefulWidget {
  const Thiet_Bi({super.key});

  @override
  _DeviceState createState() => _DeviceState();
}

class _DeviceState extends State<Thiet_Bi> {
  bool _isSearching = false;
  List<DeviceObject> _device = [];
  List<DeviceObject> _deviceDisplay = [];
  @override
  void initState() {
    super.initState();
    fetchDevices();
  }

  Future<void> fetchDevices() async {
    try {
      List<DeviceObject> device =
          await DeviceProvider.fetchDevice(http.Client());
      setState(() {
        _device = device;
        _deviceDisplay = device;
      });
    } catch (error) {
      print('Error fetching device: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error fetching device. Please try again later.'),
        ),
      );
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _searchBar(),
      body: _buildDeviceList(),
    );
  }

  AppBar _searchBar() {
    return AppBar(
      backgroundColor: Color.fromARGB(255, 31, 60, 114),
      title: _isSearching
          ? TextField(
              style: TextStyle(color: Colors.white),
              autofocus: true, // Tự động focus vào TextField khi hiển thị
              decoration: InputDecoration(
                hintText: 'Tìm kiếm',
                hintStyle: TextStyle(color: Colors.white70),
                border: InputBorder.none,
              ),
              onChanged: (text) {
                text = text.toLowerCase();
                setState(() {
                  _deviceDisplay = _device.where((device) {
                    return device.Device_Name!.toLowerCase().contains(text) ||
                        device.Image!.toLowerCase().contains(text) ||
                        device.Price!.toLowerCase().contains(text) ||
                        device.Warranty_Period!.toLowerCase().contains(text) ||
                        device.Note!.toLowerCase().contains(text) ||
                        device.Description!.toLowerCase().contains(text);
                  }).toList();
                });
              },
            )
          : const Text('Danh sách thiết bị'),
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

  Widget _buildDeviceList() {
    if (_deviceDisplay.isEmpty) {
      return Center(
        child: SpinKitChasingDots(
          color: Color.fromARGB(255, 31, 60, 114),
          size: 50,
        ),
      );
    }
    return ListView.builder(
        itemCount: _deviceDisplay.length,
        itemBuilder: (context, index) => _buildDeviceItem(index));
  }

  Widget _buildDeviceItem(int index) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: Container(
              width: 80, 
              height: 80,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8), // Bo góc của khung ảnh
                child: Image.network(
                  _deviceDisplay[index].Image.toString(),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            title: Text(_deviceDisplay[index].Device_Name.toString()),
            subtitle: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        Device_Details(device: _deviceDisplay[index]),
                  ),
                );
              },
              child: const Text(
                'Xem chi tiết',
                style: TextStyle(
                  color: Color.fromARGB(255, 31, 60, 114),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            trailing: Image.asset(
              _deviceDisplay[index].Status == 1
                  ? 'assets/Gif_Status/automation.gif'
                  : 'assets/Gif_Status/repair.gif',
              width: 30,
              height: 30,
            ),
          ),
        ],
      ),
    );
  }
}

//tìm kiếm theo loại thiết bị

// class _DeviceState extends State<Thiet_Bi> {
//   bool _isSearching = false;
//   List<DeviceObject> _device = [];
//   List<DeviceObject> _deviceDisplay = [];
//   List<TypeOfDiviceObject> _typeOfDevices = []; // Thêm danh sách loại thiết bị

//   @override
//   void initState() {
//     super.initState();
//     fetchFaculties();
//     fetchTypeOfDevices(); // Gọi hàm lấy danh sách loại thiết bị
//   }

//   Future<void> fetchFaculties() async {
//     try {
//       List<DeviceObject> device =
//           await DeviceProvider.fetchDevice(http.Client());
//       setState(() {
//         _device = device;
//         _deviceDisplay = device;
//       });
//     } catch (error) {
//       print('Error fetching device: $error');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Error fetching device. Please try again later.'),
//         ),
//       );
//     }
//   }

//   Future<void> fetchTypeOfDevices() async {
//     try {
//       List<TypeOfDiviceObject> typeOfDevices =
//           await TypeOfDeviceProvider.fetchTypeOfDivice(http.Client());
//       setState(() {
//         _typeOfDevices = typeOfDevices;
//       });
//     } catch (error) {
//       print('Error fetching type of devices: $error');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content:
//               Text('Error fetching type of devices. Please try again later.'),
//         ),
//       );
//     }
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: _searchBar(),
//       body: _buildDeviceList(),
//     );
//   }

//   AppBar _searchBar() {
//     return AppBar(
//       backgroundColor: Color.fromARGB(255, 31, 60, 114),
//       title: _isSearching
//           ? TextField(
//               style: TextStyle(color: Colors.white),
//               autofocus: true,
//               decoration: InputDecoration(
//                 hintText: 'Tìm kiếm',
//                 hintStyle: TextStyle(color: Colors.white70),
//                 border: InputBorder.none,
//               ),
//               onChanged: (text) {
//                 text = text.toLowerCase();
//                 setState(() {
//                   _deviceDisplay = _device.where((device) {
//                     return device.Device_Name!.toLowerCase().contains(text) ||
//                         device.Image!.toLowerCase().contains(text) ||
//                         device.Price!.toLowerCase().contains(text) ||
//                         device.Warranty_Period!.toLowerCase().contains(text) ||
//                         device.Note!.toLowerCase().contains(text) ||
//                         device.Description!.toLowerCase().contains(text);
//                   }).toList();
//                 });
//               },
//             )
//           : const Text('Danh sách thiết bị'),
//       actions: [
//         IconButton(
//           icon: Icon(Icons.search),
//           onPressed: () {
//             setState(() {
//               _isSearching = !_isSearching;
//             });
//           },
//         ),
//       ],
//     );
//   }

//   Widget _buildDeviceList() {
//     if (_deviceDisplay.isEmpty) {
//       return Center(
//         child: SpinKitChasingDots(
//           color: Color.fromARGB(255, 31, 60, 114),
//           size: 50,
//         ),
//       );
//     }
//     return ListView.builder(
//         itemCount: _deviceDisplay.length,
//         itemBuilder: (context, index) => _buildDeviceItem(index));
//   }

//   Widget _buildDeviceItem(int index) {
//     // Tìm kiếm loại thiết bị tương ứng với ID trong bảng thiết bị
//    TypeOfDiviceObject? typeOfDevice;
// if (index < _deviceDisplay.length) {
//   typeOfDevice = _typeOfDevices.firstWhere(
//     (typeOfDevice) => typeOfDevice.Type_Of_Device_ID == _deviceDisplay[index].Type_Of_Device_ID,
//     orElse: () => TypeOfDiviceObject(),
//   );
// } else {
//   typeOfDevice = null;
// }

//     return Card(
//       child: Column(
//         children: [
//           ListTile(
//             leading: Image.network(
//               _deviceDisplay[index].Image.toString(),
//               fit: BoxFit.fill,
//             ),
//             title: Text(_deviceDisplay[index].Device_Name.toString()),
//             subtitle: GestureDetector(
//               onTap: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) =>
//                             Device_Details(device: _deviceDisplay[index])));
//               },
//               child: const Text(
//                 'Xem tất cả',
//                 style: TextStyle(
//                   color: Color.fromARGB(255, 31, 60, 114),
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             trailing: Image.asset(
//               _deviceDisplay[index].Status == 1
//                   ? 'assets/Gif_Status/automation.gif'
//                   : 'assets/Gif_Status/repair.gif',
//               width: 30,
//               height: 30,
//             ),
//           ),
//           // Hiển thị thông tin loại thiết bị
//           typeOfDevice != null
//               ? Text(typeOfDevice.Type_Of_Device_Name.toString())
//               : Container(),
//         ],
//       ),
//     );
//   }
// }
