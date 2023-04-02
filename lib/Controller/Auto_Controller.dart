// import 'package:get/get.dart';
//
// import 'package:get/get.dart';
//
// class HomeController extends GetxController {
//   final List<Map<String, dynamic>> allPlayers = [
//     {"name": "bus"},
//     {"name": "car "},
//     {"name": "train" },
//     {"name": "keyboard"},
//     {"name": "monitor"},
//     {"name": "flutter"},
//     {"name": "dart"},
//     {"name": "mouse"},
//     {"name": "ball"},
//     {"name": "phone"},
//   ];
//   Rx<List<Map<String, dynamic>>> foundPlayers =
//       Rx<List<Map<String, dynamic>>>([]);
//
//   @override
//   void onInit() {
//     super.onInit();
//     foundPlayers.value = allPlayers;
//   }
//
//   @override
//   void onReady() {
//     super.onReady();
//   }
//
//   @override
//   void onClose() {}
//   void filterPlayer(String playerName) {
//     List<Map<String, dynamic>> results = [];
//     if (playerName.isEmpty) {
//       results = allPlayers;
//     } else {
//       results = allPlayers
//           .where((element) => element["name"]
//               .toString()
//               .toLowerCase()
//               .contains(playerName.toLowerCase()))
//           .toList();
//     }
//     foundPlayers.value = results;
//   }
// }
