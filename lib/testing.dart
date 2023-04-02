// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class MyDropdownButton extends StatefulWidget {
//   @override
//   _MyDropdownButtonState createState() => _MyDropdownButtonState();
// }
//
// class _MyDropdownButtonState extends State<MyDropdownButton> {
//   List<String> items = [    'Ethereum Mainnet',    'BNB Smart Chain',    'SBG Specail Network Powered by Flashbots',    'Avalanche',    'Polygon'  ];
//   String? selectedValue;
//   double selectedBalance = 0.0;
//
//   _MyDropdownButtonState() {
//     selectedValue = 'Ethereum Mainnet'; // set the first item as selected by default
//     selectedBalance = 100.0; // set the balance of the first item as selected balance
//   }
//
//   void onItemSelected(String? newValue) {
//     setState(() {
//       selectedValue = newValue;
//
//       if (newValue == 'Ethereum Mainnet') {
//         selectedBalance = 100.0;
//       } else if (newValue == 'BNB Smart Chain') {
//         selectedBalance = 200.0;
//       } else if (newValue == 'SBG Specail Network Powered by Flashbots') {
//         selectedBalance = 300.0;
//       } else if (newValue == 'Avalanche') {
//         selectedBalance = 400.0;
//       } else if (newValue == 'Polygon') {
//         selectedBalance = 500.0;
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My Dropdown Button'),
//       ),
//       body: Column(children: [
//         Container(
//           width: 150, // set the width of the container to limit the dropdown width
//           height: 40,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(8),
//             color: Colors.blue[300],
//           ),
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           margin: const EdgeInsets.symmetric(vertical: 16),
//           child: DropdownButton<String>(
//             elevation: 2,
//             value: selectedValue,
//             isExpanded: true, // set isExpanded to true to fill the container width
//             items: items.map((String item) {
//               return DropdownMenuItem<String>(
//                 value: item,
//                 child: Text(
//                   item,
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                   overflow: TextOverflow.ellipsis, // handle text overflow with ellipsis
//                 ),
//               );
//             }).toList(),
//             onChanged: onItemSelected,
//           ),
//         ),
//         SizedBox(height: 20),
//         Text(
//           'Selected Balance: \$${selectedBalance.toStringAsFixed(2)}',
//           style: TextStyle(fontSize: 20),
//         ),
//       ]),
//     );
//   }
// }
