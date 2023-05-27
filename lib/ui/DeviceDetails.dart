import 'package:devide_manager/object/DeviceObject.dart';
import 'package:devide_manager/provider/api_Device.dart';
import 'package:devide_manager/object/TypeOfDeviceObject.dart';
import 'package:devide_manager/provider/api_Type_Of_Device.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Device_Details extends StatefulWidget {
  DeviceObject device;
  Device_Details({
    Key? key,
    required this.device,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() =>
      _DeviceDetail_State(deviceDetail: device);
}

class _DeviceDetail_State extends State<Device_Details> {
  DeviceObject deviceDetail;
  _DeviceDetail_State({
    Key? key,
    required this.deviceDetail,
  });

  late List<DeviceObject> lsDevice;
  void GetListTOD() async {
    FutureBuilder<List<DeviceObject>>(
        future: DeviceProvider.fetchDevice(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            lsDevice = snapshot.data!;
          }
          return Container(
            child: Text(''),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Chi tiết thiết bị'),
          backgroundColor: Color.fromARGB(255, 31, 60, 114),
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
            child: Container(
              child: Row(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Container(
                          child: Text('Mã thiết bị'),
                        ),
                        Container(
                          child: Text('Tên thiết bị'),
                        ),
                        Container(
                          child: Text('Mã nhà cung cấp'),
                        ),
                        Container(
                          child: Text('Mã Lô hàng'),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          child: Text(deviceDetail.id.toString()),
                        ),
                        Container(
                          child: Text(deviceDetail.Device_Name.toString()),
                        ),
                        Container(
                          child: Text(deviceDetail.Supplier_ID.toString()),
                        ),
                        Container(
                          child:
                              Text(deviceDetail.Batch_Of_Goods_ID.toString()),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}
