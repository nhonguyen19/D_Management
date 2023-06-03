import 'package:devide_manager/object/DeviceObject.dart';
import 'package:devide_manager/provider/api_Device.dart';
import 'package:devide_manager/object/TypeOfDeviceObject.dart';
import 'package:devide_manager/provider/api_Type_Of_Device.dart';
import 'package:devide_manager/widget/widget.dart';
import 'package:devide_manager/widget/GetTypeOfDevice.dart';
import 'package:flutter/material.dart';
import 'package:clippy_flutter/clippy_flutter.dart';
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
  late String statusTemp;
  late List<TypeOfDiviceObject> TODivice;
  _DeviceDetail_State({
    Key? key,
    required this.deviceDetail,
  });

  @override
  // GetListTOD(int id) async {
  //  FutureBuilder<List<TypeOfDiviceObject>>(
  //       future: TypeOfDeviceProvider.fetchATypeOfDivice(http.Client(),id),
  //       builder: (context, snapshot) {
  //         if (snapshot.hasData) {
  //           TODivice = snapshot.data!;
  //           return Container(
  //           child: Text(TODivice[0].Type_Of_Device_Name.toString()),
  //         );
  //         } else {
  //             return const Center(
  //               child: Text('Hệ thống đang có sự cố!!'),
  //             );
  //           }
  //       }
  //       );

  // }
  @override
  Widget build(BuildContext context) {
    if (deviceDetail.Status == 0) {
      statusTemp = 'Không hoạt động';
    } else if (deviceDetail.Status == 1) {
      statusTemp = 'Đang hoạt động';
    } else {
      statusTemp = 'Đang sửa chữa';
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          ItemAppBar(),
          Padding(
            padding: EdgeInsets.all(16),
            child: Image.network(
              deviceDetail.Image.toString(),
              height: 300,
            ),
          ),
          Arc(
            edge: Edge.TOP,
            arcType: ArcType.CONVEY,
            height: 30,
            child: Container(
              width: double.infinity,
              color: Color.fromARGB(255, 31, 60, 114),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: 50,
                          bottom: 20,
                        ),
                        child: Row(
                          children: [
                            Text(
                              deviceDetail.Device_Name.toString(),
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Text(
                            'Thông tin',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      ListTile(
                        leading: Icon(Icons.qr_code, color: Colors.white),
                        title: Text(
                          'Mã QR',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        subtitle: Text(
                          deviceDetail.QRCode.toString(),
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.attach_money, color: Colors.white),
                        title: Text(
                          'Giá',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        subtitle: Text(
                          '${deviceDetail.Price} VNĐ',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      ListTile(
                        leading:
                            Icon(Icons.calendar_today, color: Colors.white),
                        title: Text(
                          'Hạn bảo hành',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        subtitle: Text(
                          '${(deviceDetail.Warranty_Period.toString()).substring(0, deviceDetail.Warranty_Period.toString().length - 9)}',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.description, color: Colors.white),
                        title: Text(
                          'Mô tả',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        subtitle: Text(
                          deviceDetail.Description.toString(),
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.note, color: Colors.white),
                        title: Text(
                          'Ghi chú',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        subtitle: Text(
                          deviceDetail.Note.toString(),
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.info, color: Colors.white),
                        title: Text(
                          'Trạng thái',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        subtitle: Text(
                          statusTemp,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                       Row(
                        children: [
                          Text(
                            'Cấu hình',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                       GetConfigurationSpecification(id: deviceDetail.id!, displayString:'')
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
