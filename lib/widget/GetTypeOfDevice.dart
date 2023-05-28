import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:devide_manager/object/TypeOfDeviceObject.dart';
import 'package:devide_manager/provider/api_Type_Of_Device.dart';
import 'package:devide_manager/object/SupplierObject.dart';
import 'package:devide_manager/provider/api_Supplier.dart';
import 'package:devide_manager/object/RoomObject.dart';
import 'package:devide_manager/provider/api_Room.dart';
import 'package:devide_manager/object/FacultyOject.dart';
import 'package:devide_manager/provider/api_Faculties.dart';
import 'package:devide_manager/object/BrandObject.dart';
import 'package:devide_manager/provider/api_Brand.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

//Tìm Loại sản phẩm
TypeOfDiviceObject? findTypeOfDeviceById(List<TypeOfDiviceObject> listTOD,int id) {
  for (var TOD in listTOD) {
    if (TOD.Type_Of_Device_ID == id) {
      return TOD;
    }
  } 
  return null;
}
class GetTypeOfDevice extends StatelessWidget {
  int id;
  List<TypeOfDiviceObject>? TODevice;
  GetTypeOfDevice({Key?key,required this.id});
  @override
  Widget build(BuildContext context){
    return Container(
   child:FutureBuilder<List<TypeOfDiviceObject>>(
     future: TypeOfDeviceProvider.fetchTypeOfDivice(http.Client()),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
           TODevice = snapshot.data!;
           TypeOfDiviceObject? findTOD = findTypeOfDeviceById(TODevice!,id);
            return Text('- Loại thiết bị: ${findTOD!.Type_Of_Device_Name.toString()}',
            style: TextStyle(fontSize: 18),
            );
        } else {
             const Text('Hệ thống đang có sự cố!!');
          } 
           return const SpinKitChasingDots(
                color: Color.fromARGB(255, 31, 60, 114),
                size: 20,
              ); 
        }
        ), 
        
        ); 
        
                
  }
  }

  //Tìm kiếm nhà sản xuất theo id
  SupplierObject? findSupplierById(List<SupplierObject> listSuppliers,int id) {
  for (var supp in listSuppliers) {
    if (supp.id == id) {
      return supp;
    }
  } 
  return null;
}
class GetSupplier extends StatelessWidget {
  int id;
  List<SupplierObject>? suppliers;
  GetSupplier({Key?key,required this.id});
  @override
  Widget build(BuildContext context){
    return Container(
   child:FutureBuilder<List<SupplierObject>>(
     future: SupplierProvider.fetchSupplier(http.Client()),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
           suppliers = snapshot.data!;
           SupplierObject? findSupp = findSupplierById(suppliers!,id);
            return Text('- Nhà cung cấp: ${findSupp!.name.toString()}',style: TextStyle(fontSize: 18),);
        } else {
             const Text('Hệ thống đang có sự cố!!');
          } 
           return const SpinKitChasingDots(
                color: Color.fromARGB(255, 31, 60, 114),
                size: 20,
              ); 
        }
        ), 
        
        ); 
        
                
  }
  }
  
  //Tìm kiếm phòng
  RoomObject? findRoomById(List<RoomObject> listRooms,int id) {
  for (var room in listRooms) {
    if (room.id == id) {
      return room;
    }
  } 
  return null;
}
class GetRoom extends StatelessWidget {
  int id;
  List<RoomObject>? rooms;
  GetRoom({Key?key,required this.id});
  @override
  Widget build(BuildContext context){
    return Container(
   child:FutureBuilder<List<RoomObject>>(
     future: RoomProvider.fetchRoom(http.Client()),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
           rooms = snapshot.data!;
           RoomObject? findSupp = findRoomById(rooms!,id);
            return Text('- Phòng: ${findSupp!.name.toString()}',style: TextStyle(fontSize: 18),);
        } else {
             const Text('Hệ thống đang có sự cố!!');
          } 
           return const SpinKitChasingDots(
                color: Color.fromARGB(255, 31, 60, 114),
                size: 20,
              ); 
        }
        ), 
        
        ); 
        
                
  }
  }
  
   //Tìm kiếm phòng
  FacultyObject? findGetFacultyById(List<FacultyObject> listFaculties,int id) {
  for (var faculty in listFaculties) {
    if (faculty.id == id) {
      return faculty;
    }
  } 
  return null;
}

  //Tìm kiếm khoa
class GetFaculty extends StatelessWidget {
  int id;
  List<FacultyObject>? faculties;
  GetFaculty({Key?key,required this.id});
  @override
  Widget build(BuildContext context){
    return Container(
   child:FutureBuilder<List<FacultyObject>>(
     future: FacultyProvider.fetchFaculty(http.Client()),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
           faculties = snapshot.data!;
           FacultyObject? findfaculty = findGetFacultyById(faculties!,id);
            return Text('- Khoa: ${findfaculty!.name.toString()}',style: TextStyle(fontSize: 18),);
        } else {
             const Text('Hệ thống đang có sự cố!!');
          } 
           return const SpinKitChasingDots(
                color: Color.fromARGB(255, 31, 60, 114),
                size: 20,
              ); 
        }
        ), 
        
        ); 
        
                
  }
  }
 
  BrandObject? findGetBrandById(List<BrandObject> listBrands,int id) {
  for (var brand in listBrands) {
    if (brand.id == id) {
      return brand;
    }
  } 
  return null;
}

  //Tìm kiếm khoa
class GetBrand extends StatelessWidget {
  int id;
  List<BrandObject>? brands;
  GetBrand({Key?key,required this.id});
  @override
  Widget build(BuildContext context){
    return Container(
   child:FutureBuilder<List<BrandObject>>(
     future: BrandProvide.fetchBrand(http.Client()),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
           brands = snapshot.data!;
           BrandObject? findbrand = findGetBrandById(brands!,id);
            return Text('- Thương hiệu: ${findbrand!.name.toString()}',style: TextStyle(fontSize: 18),);
        } else {
             const Text('Hệ thống đang có sự cố!!');
          } 
           return const SpinKitChasingDots(
                color: Color.fromARGB(255, 31, 60, 114),
                size: 20,
              ); 
        }
        ), 
        
        ); 
        
                
  }
  }