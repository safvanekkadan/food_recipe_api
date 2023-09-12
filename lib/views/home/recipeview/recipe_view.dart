// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// import '../homescreen.dart';

// class RecipeView extends StatefulWidget {
//   final BlogUrl;
//   const RecipeView({super.key,this.BlogUrl});
  
  

//   @override
//   State<RecipeView> createState() => _RecipeViewState();
// }
 
// class _RecipeViewState extends State<RecipeView> {
//   final Completer<WebViewController>_completer =Completer<WebViewController>();
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           leading: IconButton(
//               onPressed: () {
//                 Navigator.of(context).pop(MaterialPageRoute(
//                   builder: (context) => HomeScreen(),
//                 ));
//               },
//               icon: const Icon(
//                 Icons.arrow_back,
//                 color: Colors.black,
//               )),
//           backgroundColor: Colors.white,
//           title: const Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 'Food',
//                 style: TextStyle(color: Colors.black),
//               ),
//               Text(
//                 'Recipe',
//                 style: TextStyle(color: Colors.blue),
//               )
//             ],
//           ),
//           actions: const [
//             Opacity(
//               opacity: 0,
//               child: SizedBox(
//                 child: Icon(Icons.abc),
//               ),
//             )
//           ],
//           elevation: 0,
//         ),
//         body: SizedBox(
//             child: WebView(
//           initialUrl: widget.BlogUrl,
//           onWebViewCreated: ((WebViewController webViewController) {
//             _completer.complete(webViewController);
//           }),
//         )),

//       ));
//   }
// }
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RecipeView extends StatelessWidget {
  final  Url;
  const RecipeView({super.key,this.Url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: WebView(
         initialUrl: Url,
      )),
    );
  }
}