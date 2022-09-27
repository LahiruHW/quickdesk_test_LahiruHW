// ignore: file_names
import 'package:flutter/material.dart';
import 'package:quickdesk/counter_view/alertdialog.dart';
import 'counter_tab.dart';
import 'current_data_tab.dart';

class CounterView extends StatefulWidget {  
    
    const CounterView({
        Key? key,
    }) : super(key: key);


    @override
    State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {


    Future openDialog() {
        return showDialog(
            context: context, 
            builder: (context) {
              return AlertBox(ticketNo: 123,);
            },
            barrierDismissible: true
        );
    }


    @override
    void initState() {
        super.initState();
    }

    @override
    Widget build(BuildContext context) {
      

        return Scaffold(
              
            backgroundColor: Colors.grey.shade300,
      
            body: Column(
      
                children: [
      
                    Expanded(
                        flex: 1,
                        child: Container(
                            padding: const EdgeInsets.all(20),
                            // color: Colors.amber,
                            child: Row(
                                children: const [
                                    Flexible(
                                        child: Text(
                                            "Please wait for your counter numbers to be called out, thank you",
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 50,
                                                letterSpacing: 1,
                                                fontWeight: FontWeight.w900
                                            ),
                                        ),
                                    )
                                ]
                            ),    
                        ),
                    ),
      
      
                    CurrentDataTab(
                        onPressed: () => openDialog(),//print("TOOK A NEW NUMBER"),        // GENERATE ALERT DIALOGUE HERE
                    ),
      
      
                    Expanded(
                        flex: 2,
                        child: Row(
                            children: [
      
                                CounterTab(
                                    counterOpen: false, 
                                    backgroundColour: Colors.amber.shade800, 
                                    counterNum: 1, 
                                    // queueNum: 100
                                ),
      
                                CounterTab(
                                    counterOpen: true, 
                                    backgroundColour: Colors.pink, 
                                    counterNum: 2, 
                                    // queueNum: 101
                                ),
      
                                CounterTab(
                                    counterOpen: false , 
                                    backgroundColour: Colors.indigo, 
                                    counterNum: 3, 
                                    // queueNum: 102
                                ),
      
                                CounterTab(
                                    counterOpen: true, 
                                    backgroundColour: Colors.purple, 
                                    counterNum: 4, 
                                    // queueNum: 103
                                ),





                            ],
                        ),
                    )
      
                ],
      
            ),
      
        );



    }
}
