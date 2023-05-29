import 'package:devide_manager/object/FacultyOject.dart';
import 'package:devide_manager/provider/api_Faculties.dart';
import 'package:devide_manager/ui/Devices.dart';
import 'package:devide_manager/ui/Login.dart';
import 'package:devide_manager/ui/Faculties.dart';
import 'package:devide_manager/widget/widget.dart';
import 'package:devide_manager/object/TypeOfDeviceObject.dart';
import 'package:devide_manager/provider/api_Type_Of_Device.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var text = const Text(
      'Danh sách đơn vị',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
    return Scaffold(
      backgroundColor: const Color(0xffF4F7FC),
      drawer: Drawer(
        backgroundColor: const Color(0xffF4F7FC),
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/khoacntt.png"),
              ),
              accountName: Text(
                "neecoder x",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              accountEmail: Text("test@test.com",
                  style: TextStyle(color: Colors.white, fontSize: 15)),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/background.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ListTile(
                leading: const Icon(Icons.login_rounded),
                title: const Text('Đăng nhập'),
                onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    )),
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 31, 60, 114),
        title: const Text(
          'Quản lý thiết bị nhà trường',
          style: TextStyle(
            fontSize:18,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
          textAlign: TextAlign.left,
        ),
        actions: const <Widget>[
          Icon(
            Icons.search,
            color: Colors.white,
                      ),
          SizedBox(width: 10),
          Icon(
            Icons.notifications,
            color: Colors.white,
          ),
          SizedBox(width: 7),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/background.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  LayoutBuilder(
                    builder: (context, constraints) {
                      return FractionallySizedBox(
                        widthFactor:
                            0.8, // Tùy chỉnh độ rộng của FractionallySizedBox theo nhu cầu
                        child: Text(
                          'Chào mừng đến với Thiết bị CĐKT Cao Thắng',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 5.0,
                            height: 1.5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Danh sách thiết bị',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Thiet_Bi(),
                        ),
                      );
                    },
                    child: const Text(
                      'Xem tất cả',
                      style: TextStyle(
                        color: Color.fromARGB(255, 31, 60, 114),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            SingleChildScrollView(
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: 200,
                      child: FutureBuilder<List<TypeOfDiviceObject>>(
                        future: TypeOfDeviceProvider.fetchTypeOfDivice(http.Client()),
                        builder: ((context, snapshot) {
                          if (snapshot.hasData) {
                            List<TypeOfDiviceObject> lsTypeOfDevice = snapshot.data!;
                            return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: lsTypeOfDevice.length,
                                itemBuilder: (((context, index) =>
                                    buildDeviceItem(
                                      context,
                                      lsTypeOfDevice[index].Image.toString(),
                                      lsTypeOfDevice[index].Type_Of_Device_Name.toString(),
                                      '80',
                                      Color.fromARGB(255, 19, 200, 19),
                                    ))));
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
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Danh sách đơn vị',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Don_Vi()));
                      },
                      child: const Text(
                        'Xem tất cả',
                        style: TextStyle(
                          color: Color.fromARGB(255, 31, 60, 114),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: 190,
                      child: FutureBuilder<List<FacultyObject>>(
                        future: FacultyProvider.fetchFaculty(http.Client()),
                        builder: ((context, snapshot) {
                          if (snapshot.hasData) {
                            List<FacultyObject> lsDonVi = snapshot.data!;
                            return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: lsDonVi.length,
                                itemBuilder: (((context, index) =>
                                    buildDepartmentItem(
                                      context,
                                      lsDonVi[index].image.toString(),
                                      lsDonVi[index].name.toString(),
                                      '80',
                                      '90',
                                      Colors.green,
                                    ))));
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
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
