// import 'dart:html' as html;
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase/firebase.dart' as fb;

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: const FirebaseOptions(
//       apiKey: "<API_KEY>",
//       authDomain: "<AUTH_DOMAIN>",
//       projectId: "<PROJECT_ID>",
//       storageBucket: "<STORAGE_BUCKET>",
//       appId: "<APP_ID>", messagingSenderId: '',
//     ),
//   );
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Firebase File Upload',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   html.File? _file;
//   String _uploadMessage = '';

//   Future<void> _uploadFile() async {
//     final html.FileUploadInputElement input = html.FileUploadInputElement();
//     input.click();

//     input.onChange.listen((event) {
//       final files = input.files;
//       if (files != null && files.isNotEmpty) {
//         setState(() {
//           _file = files[0];
//         });

//         final reader = html.FileReader();
//         reader.onLoadEnd.listen((e) {
//           _uploadToFirebase(reader.result as String);
//         });
//         reader.readAsDataUrl(_file!);
//       }
//     });
//   }

//   Future<void> _uploadToFirebase(String dataUrl) async {
//     final byteData = await html.window. (dataUrl);
//     final fullPath = 'images/${_file!.name}';

//     final uploadTask = fb
//         .storage()
//         .refFromURL('gs://<STORAGE_BUCKET>')
//         .child(fullPath)
//         .put(byteData);
//     final snapshot = await uploadTask.future;

//     final downloadUrl = await snapshot.ref.getDownloadURL();

//     setState(() {
//       _uploadMessage =
//           'Arquivo enviado com sucesso! URL de download: $downloadUrl';
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Firebase File Upload'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(
//               onPressed: _uploadFile,
//               child: Text('Selecionar arquivo'),
//             ),
//             SizedBox(height: 20.0),
//             Text(_uploadMessage),
//           ],
//         ),
//       ),
//     );
//   }
// }
