import 'package:devide_manager/object/FacultyOject.dart';
import 'package:devide_manager/provider/api_Faculties.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

class Don_Vi extends StatefulWidget {
  const Don_Vi({super.key});

  @override
  _Don_ViState createState() => _Don_ViState();
}

//Hehe
class _Don_ViState extends State<Don_Vi> {
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
            : const Text('Danh sách đơn vị'),
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
      body: FutureBuilder<List<FacultyObject>>(
          future: FacultyProvider.fetchFaculty(http.Client()),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<FacultyObject> lsDonVi = snapshot.data!;
              return ListView.builder(
                itemCount: lsDonVi.length,
                itemBuilder: ((context, index) => Card(
                      child: Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              child: Image.network(
                                  lsDonVi[index].image.toString()),
                            ),
                            title: Text(lsDonVi[index].name.toString()),
                            subtitle: Text(lsDonVi[index].image.toString()),
                            trailing: const Text('x'),
                          ),
                        ],
                      ),
                    )),
              );
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
