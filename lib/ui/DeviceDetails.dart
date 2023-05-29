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
  Widget build(BuildContext context) {
    if (deviceDetail.Status == 0) {
      statusTemp = 'Không hoạt động';
    } else if (deviceDetail.Status == 1) {
      statusTemp = 'Đang hoạt động';
    } else {
      statusTemp = 'Đang sửa chữa';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Chi tiết thiết bị'),
               backgroundColor: Color.fromARGB(255, 31, 60, 114),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Stack(
            children: [
              Container(
                height: 300,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 31, 60, 11), // Màu nền cho phần hình ảnh
                ),
              ),
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity(),
                child: Container(
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(deviceDetail.Image.toString()),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  deviceDetail.Device_Name.toString(),
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Thông tin',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                ListTile(
                  leading: Icon(Icons.qr_code),
                  title: Text('Mã QR'),
                  subtitle: Text(deviceDetail.QRCode.toString()),
                ),
                ListTile(
                  leading: Icon(Icons.attach_money),
                  title: Text('Giá'),
                  subtitle: Text('${deviceDetail.Price} VNĐ'),
                ),
                ListTile(
                  leading: Icon(Icons.calendar_today),
                  title: Text('Hạn bảo hành'),
                  subtitle: Text(
                    '${(deviceDetail.Warranty_Period.toString()).substring(0, deviceDetail.Warranty_Period.toString().length - 9)}',
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.description),
                  title: Text('Mô tả'),
                  subtitle: Text(deviceDetail.Description.toString()),
                ),
                ListTile(
                  leading: Icon(Icons.note),
                  title: Text('Ghi chú'),
                  subtitle: Text(deviceDetail.Note.toString()),
                ),
                ListTile(
                  leading: Icon(Icons.info),
                  title: Text('Trạng thái'),
                  subtitle: Text(statusTemp),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
