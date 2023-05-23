import 'package:devide_manager/ui/thiet_bi.dart';
import 'package:devide_manager/ui/dang_nhap.dart';
import 'package:devide_manager/ui/don_vi.dart';
import 'package:devide_manager/widget/widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var text = Text(
      'Danh sách đơn vị',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
    return Scaffold(
      backgroundColor: Color(0xffF4F7FC),
      drawer: Drawer(
        backgroundColor: Color(0xffF4F7FC),
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
                        builder: (context) => LoginPage(),
                      ),
                    )),
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 31, 60, 114),
        title: Text(
          'Quản lý thiết bị nhà trường',
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.left,
        ),
        actions: <Widget>[
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
              decoration: BoxDecoration(
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
            SizedBox(height: 24),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Danh sách thiết bị',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Thiet_Bi(),
                        ),
                      );
                    },
                    child: Text(
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
            SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                   buildDeviceItem(
                    context,
                    'assets/maytinh.png',
                    'Máy tính',
                    '100',
                    Colors.green,
                  ),
                  buildDeviceItem(
                    context,
                    'assets/laptop.jpg',
                    'Laptop',
                    '100',
                    Colors.green,
                  ),
                  buildDeviceItem(
                    context,
                    'assets/maychieus.jpg',
                    'Máy chiếu',
                    '30',
                    Colors.green,
                  ),
                  buildDeviceItem(
                    context,
                    'assets/bangthongminh.jpg',
                    'Bảng thông minh',
                    '20',
                    Colors.green,
                  ),
                  buildDeviceItem(
                    context,
                    'assets/tablet.jpg',
                    'Máy tính bảng',
                    '50',
                    Colors.green,
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Flexible(  
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
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
                                builder: (context) => Don_Vi()));
                      },
                      child: Text(
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
            SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  buildDepartmentItem(
                    context,
                    'assets/khoacntt.png',
                    'Khoa Công nghệ thông tin',
                    '80',
                    '60',
                    Colors.blue,
                  ),
                    buildDepartmentItem(
                    context,
                    'assets/khoaCK.jpg',
                    'Khoa Cơ khí',
                    '80',
                    '60',
                    Colors.blue,
                  ),
                     buildDepartmentItem(
                    context,
                    'assets/khoaCKDL.png',
                    'Khoa Cơ khí động lực',
                    '80',
                    '60',
                    Colors.blue,
                  ),
                     buildDepartmentItem(
                    context,
                    'assets/khoaDT.png',
                    'Khoa Điện - Điện tử',
                    '80',
                    '60',
                    Colors.blue,
                  ),
                       buildDepartmentItem(
                    context,
                    'assets/khoaNhietLanh.jpg',
                    'Khoa Nhiệt lạnh',
                    '80',
                    '60',
                    Colors.blue,
                  ),
                  buildDepartmentItem(
                    context,
                    'assets/bomonKinhte.jpg',
                    'Khoa Kinh tế',
                    '80',
                    '60',
                    Colors.blue,
                  ),
                  //update code tại chỗ này
                    buildDepartmentItem(
                    context,
                    'assets/bomonKinhte.jpg',
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

