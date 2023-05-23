
import 'package:devide_manager/object/DonViOject.dart';
import 'package:devide_manager/provider/api_don_vi.dart';
import 'package:image_network/image_network.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Don_Vi extends StatefulWidget {
  @override
  _Don_ViState createState() => _Don_ViState();
}
//Hehe
class _Don_ViState extends State<Don_Vi> {
// List<DonViObject> dataList=[];
// Future<void> loadDonVi() async{
//   void data= await DonViProvider.getDonVi();
//   setState(() {

//   });
//   dataList=data;
// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Danh sách đơn vị'),
      ),
      body: FutureBuilder<List<DonViObject>>(
      
          future: DonViProvider.fetchDonVi(http.Client()),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<DonViObject> lsDonVi = snapshot.data!;
              return ListView.builder(
                itemCount: lsDonVi.length,
                itemBuilder: ((context, index) => Card(
                      child: Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              child: Image.asset('assets/'+lsDonVi[index].image.toString()),
                              ),
                            
                            title: Text(lsDonVi[index].name.toString()),
                            subtitle: Text(lsDonVi[index].image.toString()),
                            trailing: Text('x'),
                          ),
                        ],
                      ),
                    )),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Hệ thống đang có sự cố!!'),
              );
            }
            return CircularProgressIndicator();
          }),
    );
  }
}

  
    