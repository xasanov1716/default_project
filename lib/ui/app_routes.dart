// import 'package:flutter/material.dart';
//
// class RouteNames {
//   static const String contacts = "/";
//   static const String addContact = "/add_contact";
//   static const String contactDetails = "/contact_details";
//   static const String contactUpdate = "/contact_update";
// }
//
// class AppRoutes {
//   static Route generateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case RouteNames.contacts:
//         return MaterialPageRoute(builder: (context) => MyContactsScreen());
//       case RouteNames.addContact:
//         return MaterialPageRoute(builder: (context) {
//           return AddContactScreen(
//             listener: settings.arguments as VoidCallback,
//           );
//         });
//       case RouteNames.contactUpdate:
//         return MaterialPageRoute(builder: (context) => UpdateContactScreen());
//       case RouteNames.contactDetails:
//         return MaterialPageRoute(builder: (context) {
//           Map<String, dynamic> map = settings.arguments as Map<String, dynamic>;
//           return ContactDetailScreen(
//             deleteListener: map["deleteListener"],
//             contactModelSql: map["contactModelSql"],
//           );
//         });
//       default:
//         return MaterialPageRoute(
//           builder: (context) => const Scaffold(
//             body: Center(
//               child: Text("Route mavjud emas"),
//             ),
//           ),
//         );
//     }
//   }
// }