import 'package:devide_manager/ui/thiet_bi.dart';
import 'package:devide_manager/ui/dang_nhap.dart';
import 'package:devide_manager/ui/don_vi.dart';
import 'package:devide_manager/widget/widget.dart';
import 'package:devide_manager/object/TypeOfDeviceObject.dart';
import 'package:devide_manager/provider/api_Type_Of_Device.dart';
import 'package:flutter/material.dart';
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
          style: TextStyle(color: Colors.white),
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
                  fit: BoxFit.contain,
                ),
              ),
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Positioned(
                    top: 50,
                    left: 100,
                    child: Text(
                      'Chào mừng đến với',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 80,
                    left: 30,
                    child: Text(
                      'Thiết bị CĐKT Cao Thắng',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
                        color: Colors.blue,
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
                    child: SizedBox(
                      height: 200,
                      child: FutureBuilder<List<TypeOfDiviceObject>>(
                        future: TypeOfDeviceProvider.fetchTypeOfDivice(
                            http.Client()),
                        builder: ((context, snapshot) {
                          if (snapshot.hasData) {
                            List<TypeOfDiviceObject> lsTypeOfDevice =
                                snapshot.data!;
                            return ListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: lsTypeOfDevice.length,
                                itemBuilder: (((context, index) =>
                                    buildDepartmentItem(
                                      context,
                                      'assets/Images_TOD/${lsTypeOfDevice[index].Image}',
                                      lsTypeOfDevice[index]
                                          .Type_Of_Device_Name
                                          .toString(),
                                      '80',
                                      '60',
                                      Colors.blue,
                                    ))));
                          } else if (snapshot.hasError) {
                            return const Center(
                              child: Text('Hệ thống đang có sự cố!!'),
                            );
                          }
                          return const CircularProgressIndicator();
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
                          color: Colors.blue,
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
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  buildDepartmentItem(
                    context,
                    'assets/Logo_Khoa/khoacntt.png',
                    'Khoa Công nghệ thông tin',
                    '80',
                    '60',
                    Colors.blue,
                  ),
                  buildDepartmentItem(
                    context,
                    'assets/Logo_Khoa/khoaCK.jpg',
                    'Khoa Cơ khí',
                    '80',
                    '60',
                    Colors.blue,
                  ),
                  buildDepartmentItem(
                    context,
                    'assets/Logo_Khoa/khoaCKDL.png',
                    'Khoa Cơ khí động lực',
                    '80',
                    '60',
                    Colors.blue,
                  ),
                  buildDepartmentItem(
                    context,
                    'assets/Logo_Khoa/khoaDT.png',
                    'Khoa Điện - Điện tử',
                    '80',
                    '60',
                    Colors.blue,
                  ),
                  buildDepartmentItem(
                    context,
                    'assets/Logo_Khoa/khoaNhietLanh.jpg',
                    'Khoa Nhiệt lạnh',
                    '80',
                    '60',
                    Colors.blue,
                  ),
                  buildDepartmentItem(
                    context,
                    'assets/Logo_Khoa/bomonKinhte.jpg',
                    'Khoa Kinh tế',
                    '80',
                    '60',
                    Colors.blue,
                  ),
                  //update code tại chỗ này
                  buildDepartmentItem(
                    context,
                    'assets/Logo_Khoa/bomonKinhte.jpg',
                    'Khoa Kinh tế',
                    '80',
                    '60',
                    Colors.blue,
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
