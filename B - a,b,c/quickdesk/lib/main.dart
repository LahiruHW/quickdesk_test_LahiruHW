import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:quickdesk/selector_view/MAIN_selectorView.dart';
import 'package:quickdesk/services/XXX_provider_data.dart';


Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp( 
      options: const FirebaseOptions(
          apiKey: "AIzaSyAnjq7XsqRl4UyizuNbGNSbuEZEj7saTEM",
          databaseURL: "https://ticket-queue-system-default-rtdb.asia-southeast1.firebasedatabase.app", 
          appId: "1:337654912662:web:af53221a92ce5d046894b7", 
          messagingSenderId: "337654912662", 
          projectId: "ticket-queue-system"
      )
    ); 
    runApp( MyApp() );
}


// basically, all THIS main.dart file should have, is a page with two buttons, 
// that either leads you to another type of 



class MyApp extends StatelessWidget {
    

    MyApp({
        Key? key,
    }) : super(key: key);

    
    // final Future<FirebaseApp> _initialization = Firebase.initializeApp( 
    //   options: const FirebaseOptions(
    //       apiKey: "AIzaSyAnjq7XsqRl4UyizuNbGNSbuEZEj7saTEM", 
    //       appId: "1:337654912662:web:af53221a92ce5d046894b7", 
    //       messagingSenderId: "337654912662", 
    //       projectId: "ticket-queue-system"
    //   )
    // ); 


    // This widget is the root of your application.
    @override
    Widget build(BuildContext context) {

        return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: SelectorView()
            
            
            // FutureBuilder(
            //   future: _initialization,
            //   builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) { 
            //       if (snapshot.hasError){
            //           // ignore: avoid_print
            //           print("Error");
            //       }
            //       if (snapshot.connectionState == ConnectionState.done){
                      // return SelectorView()
            //       }
            //       return const Center(
            //           child: CircularProgressIndicator()
            //       );
            //   },
            // ),

        );
    }
}

