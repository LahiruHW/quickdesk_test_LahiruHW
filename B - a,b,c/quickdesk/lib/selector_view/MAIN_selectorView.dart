// ignore: file_names
import 'package:flutter/material.dart';
import 'package:quickdesk/counter_view/MAIN_counterView.dart';
import 'package:quickdesk/management_view/MAIN_managementView.dart';



// ignore: must_be_immutable
class SelectorView extends StatefulWidget {

    const SelectorView({
        Key? key
    }) : super(key: key);

    @override
    // ignore: no_logic_in_create_state
    State<StatefulWidget> createState() => _SelectorViewState();

}



// ignore: must_be_immutable
class _SelectorViewState extends State<SelectorView> {

    _SelectorViewState();

    @override
    Widget build(BuildContext context) {

        return Scaffold(
            backgroundColor: Colors.grey.shade400,
            body: Column(
                
                crossAxisAlignment: CrossAxisAlignment.center,

                mainAxisAlignment: MainAxisAlignment.center,

                children: [

                    const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                            "This project was created using the Flutter Framework, with Dart & Firebase Realtime DB as the backend"
                        ),
                    ),

                    const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Center(
                            child: Text(
                                "PLEASE SELECT YOUR ROLE",
                                style: TextStyle(
                                    fontSize: 60,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 2,
                                ),
                            )
                        ),
                    ),

                    const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                            child: Text(
                                "I am a: ",
                                style: TextStyle(
                                    fontSize: 30
                                ),
                            )
                        ),
                    ),

                    Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Center(
                            child: SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                    onPressed: () {
                                        Navigator.push(
                                            context, 
                                            MaterialPageRoute(
                                                builder: (context) => const CounterView() // jump to the Customer's View
                                            )
                                        );
                                    },       
                                    child: const Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Text(
                                          "Customer",
                                          style: TextStyle(
                                              fontSize: 30
                                          ),
                                      ),
                                    )
                                ),
                            )
                        ),
                    ),

                    Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Center(
                            child: SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                    onPressed: () {
                                        Navigator.push(
                                            context, 
                                            MaterialPageRoute(
                                                builder: (context) => const ManagementView() // jump to the Counter Manager's Page
                                            )
                                        );
                                    },
                                    child: const Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Text(
                                          "Counter Manager",
                                          style: TextStyle(
                                              fontSize: 30
                                          ),
                                      ),
                                    )
                                ),
                            )
                        ),
                    )

                ]

            ),

        );


      
    }

}
