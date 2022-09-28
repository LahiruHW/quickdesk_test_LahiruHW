import 'package:flutter/material.dart';
import 'package:quickdesk/management_view/management_counter_tab.dart';


// ignore: must_be_immutable
class ManagementView extends StatefulWidget {
    
    const ManagementView({
        Key? key
    }) : super(key: key);

    @override
    State<ManagementView> createState() => _ManagementViewState();
}

class _ManagementViewState extends State<ManagementView> {
    @override
    Widget build(BuildContext context) {

        return Scaffold(

            backgroundColor: Colors.grey.shade400,
            
            body: Column(
                children: [

                    Expanded(
                        flex: 1,
                        child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                                alignment: Alignment.centerLeft,
                                // color: Colors.yellow,
                                child: const Text(
                                    "COUNTER MANAGEMENT",
                                    style: TextStyle(
                                        fontSize: 50,
                                        fontWeight: FontWeight.w900
                                    ),
                                )
                            ),
                        ),
                    ),

                    Expanded(
                        flex: 3,
                        child: Row(
                            
                            children: const [

                                CounterManagementTab(
                                    counterNum: 1,
                                    backgroundColor: Colors.orange,
                                ),
                                
                                CounterManagementTab(
                                    counterNum: 2,
                                    backgroundColor: Colors.pink,
                                ),    

                                CounterManagementTab(
                                    counterNum: 3,
                                    backgroundColor: Colors.indigo,
                                ),
                              
                                CounterManagementTab(
                                    counterNum: 4,
                                    backgroundColor: Colors.purple,
                                ),

                            ]

                        ),

                    )

                ]

            ) 
            
        );

    }
}

