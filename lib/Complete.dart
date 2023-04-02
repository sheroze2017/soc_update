// import 'package:flutter/material.dart';

// class Complete extends StatefulWidget {
//   const Complete({super.key});

//   @override
//   State<Complete> createState() => _CompleteState();
// }

// class _CompleteState extends State<Complete> {
// const List<Country> countryOptions = <Country>[
//   Country(name: 'Africa', size: 30370000),
//   Country(name: 'Asia', size: 44579000),
//   Country(name: 'Australia', size: 8600000),
//   Country(name: 'Bulgaria', size: 110879),
//   Country(name: 'Canada', size: 9984670),
//   Country(name: 'Denmark', size: 42916),
//   Country(name: 'Europe', size: 10180000),
//   Country(name: 'India', size: 3287263),
//   Country(name: 'North America', size: 24709000),
//   Country(name: 'South America', size: 17840000),
// ];
//       @override
//       Widget build(BuildContext context) {
//         return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title:Text('Flutter AutoComplete Demo'),
//         backgroundColor: Colors.cyan,
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(15.0),
//         child: Autocomplete<Country>(
//           optionsBuilder: (TextEditingValue textEditingValue) {
//             return countryOptions
//                 .where((Country county) => county.name.toLowerCase()
//                 .startsWith(textEditingValue.text.toLowerCase())
//             )
//                 .toList();
//           },
//           displayStringForOption: (Country option) => option.name,
//           fieldViewBuilder: (
//               BuildContext context,
//               TextEditingController fieldTextEditingController,
//               FocusNode fieldFocusNode,
//               VoidCallback onFieldSubmitted
//               ) {
//             return TextField(
//               controller: fieldTextEditingController,
//               focusNode: fieldFocusNode,
//               style: const TextStyle(fontWeight: FontWeight.bold),
//             );
//           },
//           onSelected: (Country selection) {
//             print('Selected: ${selection.name}');
//           },
//           optionsViewBuilder: (
//               BuildContext context,
//               AutocompleteOnSelected<Country> onSelected,
//               Iterable<Country> options
//               ) {
//             return Align(
//               alignment: Alignment.topLeft,
//               child: Material(
//                 child: Container(
//                   width: 300,
//                   color: Colors.cyan,
//                   child: ListView.builder(
//                     padding: EdgeInsets.all(10.0),
//                     itemCount: options.length,
//                     itemBuilder: (BuildContext context, int index) {
//                       final Country option = options.elementAt(index);

//                       return GestureDetector(
//                         onTap: () {
//                           onSelected(option);
//                         },
//                         child: ListTile(
//                           title: Text(option.name, style: const TextStyle(color: Colors.white)),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//       }}

//final
     // AutoCompleteTextField(
          //   clearOnSubmit: false,
          //   controller: _suggestTextfieldController, 
          //   suggestions: suggestList , 
          //   itemBuilder: (BuildContext context, item) { 
          //     return Container(
          //       padding: EdgeInsets.all(20),
          //       child: Row(
          //         children: [
          //           Text(item,
                    
          //           )
          //         ],
          //       ),
          //     );
          //    }, 
          //   itemFilter: (item, String query) { 
          //     return item.toLowerCase().startsWith(query.toLowerCase());
          //    }, 
          //   itemSorter: (a, b) { 
          //     return a.compareTo(b);
          //    }, itemSubmitted: (item) {  
          //     _suggestTextfieldController.text = item;
          //    }, 
          //   key: key,

          // ),