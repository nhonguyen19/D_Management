class Ngrok {
  String ngrok =
      'https://744d-2402-800-6314-943b-d8f9-4ade-e26e-e276.ngrok-free.app';
  late String api_Faculties;
  late String api_Brands;
  late String api_Devices;
  late String api_Rooms;
  late String api_Suppliers;
  late String api_Type_Of_Devices;

  Ngrok() {
    api_Faculties = ngrok + '/api/faculties';
    api_Brands = ngrok + '/api/brands';
    api_Devices = ngrok + '/api/devices';
    api_Rooms = ngrok + '/api/rooms';
    api_Suppliers = ngrok + '/api/suppliers';
    api_Type_Of_Devices = ngrok + '/api/type-of-devices';
  }
}
