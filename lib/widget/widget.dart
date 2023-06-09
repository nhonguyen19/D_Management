import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:devide_manager/object/DeviceObject.dart';
import 'package:devide_manager/object/TypeOfDeviceObject.dart';
import 'package:devide_manager/provider/api_Type_Of_Device.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:devide_manager/widget/GetTypeOfDevice.dart';
import 'package:http/http.dart' as http;

//thiết bị
Widget buildDeviceItem(BuildContext context, String image, String name,
    String quantity, Color color) {
  return Container(
    margin: const EdgeInsets.only(left: 24),
    width: 140,
    height: 190,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 8,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(image),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          name,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          'Số lượng: $quantity',
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Text(
            'Đang sử dụng',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    ),
  );
}

Widget buildDepartmentItem(BuildContext context, String image, String name,
    String total, String available, Color color) {
  return Container(
    margin: const EdgeInsets.only(left: 24),
    width: 350,
    height: 200,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 8,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Row(
      children: [
        Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(image),
              fit: BoxFit.cover,
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.layers,
                      size: 16,
                      color: Colors.grey[500],
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Tổng số: $total',
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(
                      Icons.check_circle_outline,
                      size: 16,
                      color: Colors.grey[500],
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Có sẵn: $available',
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                LinearProgressIndicator(
                  value: int.parse(available) / int.parse(total),
                  valueColor: AlwaysStoppedAnimation<Color>(color),
                  backgroundColor: Colors.grey[200],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(color),
                        overlayColor: MaterialStateProperty.all<Color>(
                            color.withOpacity(0.1)),
                      ),
                      child: const Text('Chi tiết'),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.add_circle_outline),
                      color: color,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

class ItemAppBar extends StatelessWidget {
  DeviceObject deviceDetails;
  ItemAppBar({Key? key, required this.deviceDetails});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 31, 60, 114),
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              size: 30,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "Chi tiết thiết bị",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          Spacer(),
          Container(
              child: IconButton(
                  icon: GetImageTypeOfDevice(
                      id: deviceDetails.Type_Of_Device_ID!),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: Color.fromARGB(255, 31, 60, 114),
                            content: SingleChildScrollView(
                              child: ListBody(
                                children: [
                                  Column(
                                    children: [
                                      //Hiển thị Loại thiết bị
                                      Padding(
                                        padding:
EdgeInsets.symmetric(vertical:10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              child: Text(
                                                'Loại thiết bị:',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              ),
                                            ),
                                            Container(
                                              child: GetTypeOfDevice(
                                                id: deviceDetails
                                                    .Type_Of_Device_ID!,
                                                displayString: '',
                                                displayColor: Colors.white70,
                                              ),
                                            )
                                          ],
                                        ),
                                  ),    
                                      //Hiển thị Thương hiệu
                                       Padding(
                                        padding:
EdgeInsets.symmetric(vertical:10),child:
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                         Container(
                                          child:  Text(
                                            'Thương hiệu:',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                         ),
                                         Container(
                                          child:  GetBrand(
                                            id: deviceDetails.Brand_ID!,
                                            displayString: '',
                                            displayColor: Colors.white70,
                                          ),
                                         )
                                        ],
                                      ),
                                       ),
                                      //Nhà cung cấp
                                       Padding(
                                        padding:
EdgeInsets.symmetric(vertical:10),child:
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                         Container(child:  Text(
                                            'Nhà cung cấp:',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),),
                                         Container(
                                          child:  GetSupplier(
                                            id: deviceDetails.Supplier_ID!,
                                            displayColor: Colors.white70,
                                          ),
                                         )
                                        ],
                                      ),
                                       ),
                                        Padding(
                                        padding:
EdgeInsets.symmetric(vertical:10),child:
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                         Container(
                                          child:  Text(
                                            'Mã lô hàng:',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                         ),
                                       Container(
                                        child: Text(deviceDetails.Batch_Of_Goods_ID.toString(),style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white70
                                        ),),
                                       )
                                        ],
                                      ),
                                        ),
                                      GetConfigurationSpecification(
                                          id: deviceDetails.id!,
                                          displayString: ''),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        });
                  }))
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
