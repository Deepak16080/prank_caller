// // import 'dart:convert';

// // import 'package:flutter/material.dart';
// // import 'package:prank_caller/main.dart';
// // import 'package:prank_caller/utils/enums.dart';

// // import '../utils/common.dart';

// // class CallerVoice extends StatefulWidget {
// //   const CallerVoice({super.key});

// //   @override
// //   State<CallerVoice> createState() => _CallerVoiceState();
// // }

// // class _CallerVoiceState extends State<CallerVoice> {
// //   AppAudio? selectedringtone;
// //   @override
// //   void dispose() {
// //     super.dispose();
// //     player.stop();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         centerTitle: true,
// //         title: const Text('Caller Voice'),
// //         backgroundColor: Colors.transparent,
// //         leading: IconButton(
// //           icon: const Icon(Icons.arrow_back),
// //           onPressed: () {
// //             Navigator.pop(context);
// //           },
// //         ),
// //         actions: [
// //           TextButton(
// //               onPressed: () {
// //                 if (selectedringtone == null) {
// //                   toast(context, "Please select a caller voice");
// //                   return;
// //                 }
// //                 Navigator.pop(context, selectedringtone);
// //               },
// //               child: const Text(
// //                 'Select',
// //                 style: TextStyle(color: Colors.white),
// //               ))
// //         ],
// //       ),
// //       body: FutureBuilder<String>(
// //         future: DefaultAssetBundle.of(context).loadString("AssetManifest.json"),
// //         builder: (context, item) {
// //           if (item.hasData) {
// //             Map? jsonMap = jsonDecode(item.data!);
// //             List songs = jsonMap?.keys.toList() ?? [];

// //             return ListView.builder(
// //               itemCount: songs.length,
// //               itemBuilder: (context, index) {
// //                 String path = songs[index].toString();
// //                 bool isMp3 = path.contains(".mp3");

// //                 String title = path.replaceAll("assets/callervoice/", "").replaceAll(".mp3", "");

// //                 bool isSelected = selectedringtone?.path == path;

// //                 if (!isMp3) return const SizedBox.shrink();

// //                 return InkWell(
// //                   onTap: () {
// //                     selectedringtone = AppAudio(path: path, name: title);
// //                     if (isSelected && player.playing) {
// //                       player.pause();
// //                     } else {
// //                       selectedringtone!.play();
// //                     }
// //                     setState(() {});
// //                   },
// //                   child: Card(
// //                     shadowColor: Colors.green,
// //                     shape: RoundedRectangleBorder(
// //                       side: isSelected
// //                           ? const BorderSide(color: Colors.green, width: 2)
// //                           : const BorderSide(color: Colors.transparent, width: 2),
// //                       borderRadius: BorderRadius.circular(10),
// //                     ),
// //                     margin: const EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
// //                     child: ListTile(
// //                         textColor: Colors.blue,
// //                         title: Text(title),
// //                         leading: player.playing && isSelected
// //                             ? const Icon(Icons.pause, color: Colors.blue)
// //                             : const Icon(Icons.play_arrow, color: Colors.blue)),
// //                   ),
// //                 );
// //               },
// //             );
// //           } else {
// //             return const Center(
// //               child: Text('empty directory'),
// //             );
// //           }
// //         },
// //       ),
// //     );
// //   }
// // }

// import 'dart:isolate';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class BackgroundTaskScreen extends StatefulWidget {
//   const BackgroundTaskScreen({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _BackgroundTaskScreenState createState() => _BackgroundTaskScreenState();
// }

// class _BackgroundTaskScreenState extends State<BackgroundTaskScreen> {
//   late String _taskStatus;

//   @override
//   void initState() {
//     super.initState();
//     _taskStatus = 'Running in background...';
//     _startBackgroundTask();
//   }

//   void _startBackgroundTask() async {
//     // Spawn a new isolate
//     await Isolate.spawn(_backgroundTask, "Background task");

//     // Receive updates from the background task
//     ReceivePort receivePort = ReceivePort();
//     receivePort.listen((dynamic data) {
//       setState(() {
//         _taskStatus = data;
//       });
//     });

//     // Send the receive port to the background task
//     MethodChannel('background_service').invokeMethod(
//       'startService',
//       {'port': receivePort.sendPort},
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Background Task Example'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('Task Status: $_taskStatus'),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // Background task function
// void _backgroundTask(String message) {

//   final ReceivePort receivePort = ReceivePort();

//   // Listen for messages from the main isolate
//   receivePort.listen((dynamic data) {
   
//     print(data);
    
//     Isolate.current.controlPort.send('Running in background...');
//   });

//   // Send the receive port back to the main isolate
//   Isolate.current.controlPort.send(receivePort.sendPort);
// }
