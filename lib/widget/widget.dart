 import 'package:flutter/material.dart';
//thiết bị
 Widget buildDeviceItem(BuildContext context, String image, String name,
      String quantity, Color color) {
    return Container(
      margin: const EdgeInsets.only(left: 24),
      width: 140,
      height: 190,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            name,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            'Số lượng: $quantity',
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Text(
              'Đang sử dụng',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    
    );
  }

//đơn vị 
  // // Widget buildDepartmentItem(BuildContext context, String image, String name,
  // //     String totalDevices, String activeDevices, Color color) {
  // //   return Container(
  // //     margin: EdgeInsets.all(14),
  // //     width: 260,
  // //     height: 200,
  // //     decoration: BoxDecoration(
  // //       color: Colors.white,
  // //       borderRadius: BorderRadius.circular(16),
  // //       boxShadow: [
  // //         BoxShadow(
  // //           color: Colors.black.withOpacity(0.1),
  // //           blurRadius: 8,
  // //           offset: Offset(0, 4),
  // //         ),
  // //       ],
  // //     ),
  // //     child: Row(
  // //       children: [
  // //         Container(
  // //           width: 80,
  // //           height: 200,
  // //           decoration: BoxDecoration(
  // //             image: DecorationImage(
  // //               image: AssetImage(image),
  // //               fit: BoxFit.fill,
  // //             ),
  // //             borderRadius: BorderRadius.horizontal(
  // //               left: Radius.circular(16),
  // //             ),
  // //           ),
  // //         ),
  // //         Expanded(
  // //           child: Padding(
  // //             padding: EdgeInsets.all(16),
  // //             child: Column(
  // //               crossAxisAlignment: CrossAxisAlignment.start,
  // //               children: [
  // //                 Text(
  // //                   name,
  // //                   style: TextStyle(
  // //                     fontSize: 18,
  // //                     fontWeight: FontWeight.bold,
  // //                   ),
  // //                 ),
  // //                 SizedBox(height: 8),
  // //                 Row(
  // //                   children: [
  // //                     Icon(
  // //                       Icons.devices,
  // //                       size: 16,
  // //                       color: Colors.grey,
  // //                     ),
  // //                     SizedBox(width: 4),
  // //                     Text(
  // //                       'Tổng số: $totalDevices',
  // //                       style: TextStyle(color: Colors.grey),
  // //                     ),
  // //                   ],
  // //                 ),
  // //                 SizedBox(height: 4),
  // //                 Row(
  // //                   children: [
  // //                     Icon(
  // //                       Icons.check_circle_outline,
  // //                       size: 16,
  // //                       color: Colors.grey,
  // //                     ),
  // //                     SizedBox(width: 4),
  // //                     Text(
  // //                       'Đang hoạt động: $activeDevices',
  // //                       style: TextStyle(color: Colors.grey),
  // //                     ),
  // //                   ],
  // //                 ),
  // //                 SizedBox(height: 16),
  // //                 Container(
  // //                   padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  // //                   decoration: BoxDecoration(
  // //                     color: color,
  // //                     borderRadius: BorderRadius.circular(16),
  // //                   ),
  // //                   child: Text(
  // //                     'Xem chi tiết',
  // //                     style: TextStyle(color: Colors.white),
  // //                   ),
  // //                 ),
  // //               ],
  // //             ),
  // //           ),
  // //         ),
  // //       ],
  // //     ),
  // //   );
  // }
  Widget buildDepartmentItem(
      BuildContext context, String image, String name, String total, String available, Color color) {
    return Container(
      margin: const EdgeInsets.only(left: 24),
      width: 350,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.layers,
                        size: 16,
                        color: Colors.grey[500],
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Tổng số: $total',
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        Icons.check_circle_outline,
                        size: 16,
                        color: Colors.grey[500],
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Có sẵn: $available',
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  LinearProgressIndicator(
                    value: int.parse(available) / int.parse(total),
                    valueColor: AlwaysStoppedAnimation<Color>(color),
                    backgroundColor: Colors.grey[200],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(color),
                          overlayColor: MaterialStateProperty.all<Color>(color.withOpacity(0.1)),
                        ),
                        child: const Text('Chi tiết'),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.add_circle_outline),
                        color: color,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
