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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 31, 60, 114),
        title: _isSearching
            ? TextField(
                style: TextStyle(color: Colors.white),
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
      ),
      body: FutureBuilder<List<DeviceObject>>(
          future: DeviceProvider.fetchDevice(http.Client()),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<DeviceObject> lsDevice = snapshot.data!;
              return ListView.builder(
                  itemCount: lsDevice.length,
                  itemBuilder: ((context, index) => Card(
                        child: Column(
                          children: [
                            ListTile(
                              leading: 
                              Image.network(
                               lsDevice[index].Image.toString(),
                                fit: BoxFit.fill,
                              ),
                              title:
                                  Text(lsDevice[index].Device_Name.toString()),
                              subtitle: Text(
                                lsDevice[index].Status == 1
                                    ? "Hoạt động"
                                    : "Không hoạt động",
                                style: TextStyle(
                                  color: lsDevice[index].Status == 1
                                      ? Colors.green
                                      : Colors.red,
                                ),
                              ),
                              trailing: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Device_Details(
                                              device: lsDevice[index])));
                                },
                                child: const Text(
                                  'Xem tất cả',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 31, 60, 114),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )));
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Hệ thống đang có sự cố!!'),
              );
            }
            return Center(
              child: SpinKitChasingDots(
                color: Color.fromARGB(255, 31, 60, 114),
                size: 50,
              ),
            );
          }),
    );
  }
}
