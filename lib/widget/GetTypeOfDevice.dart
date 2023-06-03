import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:devide_manager/object/TeacherInformationObject.dart';
import 'package:devide_manager/provider/api_Teacher_Information.dart';
import 'package:devide_manager/object/ConfigurationDetailsObject.dart';
import 'package:devide_manager/provider/api_Configuration_Details.dart';
import 'package:devide_manager/object/ConfigurationSpecificationObject.dart';
import 'package:devide_manager/provider/api_Confuguration_Specification.dart';
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
import 'package:devide_manager/ui/Home.dart';
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
  String displayString;
  List<TypeOfDiviceObject>? TODevice;
  GetTypeOfDevice({Key?key,required this.id,required this.displayString});
  @override
  Widget build(BuildContext context){
    return Container(
   child:FutureBuilder<List<TypeOfDiviceObject>>(
     future: TypeOfDeviceProvider.fetchTypeOfDivice(http.Client()),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
           TODevice = snapshot.data!;
           TypeOfDiviceObject? findTOD = findTypeOfDeviceById(TODevice!,id);
            return Text('${displayString}${findTOD!.Type_Of_Device_Name.toString()}',
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
    if (faculty.facultyID == id) {
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
            return Text('- Khoa: ${findfaculty!.facultyName.toString()}',style: TextStyle(fontSize: 18),);
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

  //Tìm kiếm Thương hiệu
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
    ConfigurationDetailsObject? findGetConfigurationDetailsId(List<ConfigurationDetailsObject> listConfigurationDetails,int id) {
  for (var configurationDetail in listConfigurationDetails) {
    if (configurationDetail.id == id) {
      return configurationDetail;
    }
  } 
  return null;
}

  //Tìm kiếm Thương hiệu
class GetConfigurationDetails extends StatelessWidget {
  int id;
  String displayString;
  Color displaycolor;
  List<ConfigurationDetailsObject>? listConfigurationDetail;
  GetConfigurationDetails({Key?key,required this.id,required this.displayString,required this.displaycolor});
  @override
  Widget build(BuildContext context){
    return Container(
   child:FutureBuilder<List<ConfigurationDetailsObject>>(
     future: ConfigurationDetailsProvide.fetchConfigurationDetails(http.Client()),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
           listConfigurationDetail = snapshot.data!;
           ConfigurationDetailsObject? findConfigurationDetails = findGetConfigurationDetailsId(listConfigurationDetail!,id);
            return Text('${displayString}${findConfigurationDetails!.name.toString()}',
                    style: TextStyle(
                      fontSize: 16,
                      color: displaycolor
                    ),);
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

List<ConfigurationSpecificationObject?> findGetConfigurationSpecificationId(List<ConfigurationSpecificationObject> listConfigurationSpecifications,int id) {
  List<ConfigurationSpecificationObject> ConfigurationSpec=[];
  for (var configurationSpecification in listConfigurationSpecifications) {
    if (configurationSpecification.device_ID == id) {
       ConfigurationSpec.add(configurationSpecification);
    }
  } 
  return ConfigurationSpec;
}

  //Tìm kiếm Thương hiệu
class GetConfigurationSpecification extends StatelessWidget {
  int id;
  String displayString;
  List<ConfigurationSpecificationObject>? listConfigurationSpecificationObjects;
  GetConfigurationSpecification ({Key?key,required this.id,required this.displayString});
  @override
  Widget build(BuildContext context){
    return Container(
      child: FutureBuilder<List<ConfigurationSpecificationObject>>(
        future: ConfigurationSpecificationProvide.fetchConfigurationSpecification(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            listConfigurationSpecificationObjects = snapshot.data!;
            List<ConfigurationSpecificationObject?> findConfigurationSpecification = findGetConfigurationSpecificationId(listConfigurationSpecificationObjects!,id);
            return Column(
              children: [
                for(int i = 0; i < findConfigurationSpecification.length; i++)
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: GetConfigurationDetails(id: findConfigurationSpecification[i]!.configuration_Detail_ID!,displayString: '',displaycolor: Colors.white70,),
                      ),
                      Container(
                    child: Text(findConfigurationSpecification[i]!.specification.toString(),
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70
                    ),),
                  ),
                    ],
                  )
                )
              ],
            );
          } else if (snapshot.hasError) {
            return Text('Hệ thống đang có sự cố!!');
          } else {
            return const SpinKitChasingDots(
              color: Color.fromARGB(255, 31, 60, 114),
              size: 20,
            );
          }
        },
      ),
    );
  }
}







