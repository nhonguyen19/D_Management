class Ngrok {
  String ngrok ='https://2edf-115-79-225-122.ngrok-free.app';
  late String api_Faculties;
  late String api_Brands;
  late String api_Devices;
  late String api_Rooms;
  late String api_Suppliers;
  late String api_Type_Of_Devices;
  late String api_Teacher_Information;
  late String api_Configuration_Details;
  late String api_Configuration_Specification;
  late String api_Configuration;

  Ngrok() {
    api_Faculties = ngrok + '/api/faculties';
    api_Brands = ngrok + '/api/brands';
    api_Devices = ngrok + '/api/devices';
    api_Rooms = ngrok + '/api/rooms';
    api_Suppliers = ngrok + '/api/suppliers'; 
    api_Type_Of_Devices = ngrok + '/api/type-of-devices';
    api_Teacher_Information = ngrok + '/api/teacher-informations';
    api_Configuration_Details=ngrok+'/api/configuration-details';
    api_Configuration=ngrok+'/api/configurations';
    api_Configuration_Specification= ngrok+'/api/configuration-specifications';
  }
}
