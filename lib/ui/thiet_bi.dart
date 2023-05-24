import 'package:devide_manager/object/DeviceObject.dart';
import 'package:devide_manager/provider/api_Device.dart';
import 'package:devide_manager/object/TypeOfDeviceObject.dart';
import 'package:devide_manager/provider/api_Type_Of_Device.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Thiet_Bi extends StatefulWidget{
  const Thiet_Bi({super.key});

  @override
  _DeviceState createState()=>_DeviceState();
}
class _DeviceState extends State<Thiet_Bi> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Danh sách thiết bị'),
      ),
      body: FutureBuilder<List<DeviceObject>>(
        future: DeviceProvider.fetchDevice(http.Client()),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            List<DeviceObject> lsDevice = snapshot.data!;
            return ListView.builder(
              itemCount: lsDevice.length,
              itemBuilder: ((context,index)=>Card(
                  child:  Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              ),
                            title: Text(lsDevice[index].name.toString()),
                            subtitle:Text(lsDevice[index].Status==1?"Hoạt động":"Không hoạt động" ),
                            trailing: const Text('x'),
                          ),
                        ],
                      ),
              )
              )
              );
              
         } else if (snapshot.hasError) {
              return const Center(
                child: Text('Hệ thống đang có sự cố!!'),
              );
            }
            return const CircularProgressIndicator();
          }
          ),
    );
  }
}


