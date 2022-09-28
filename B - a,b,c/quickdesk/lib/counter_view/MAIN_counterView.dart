// ignore: file_names
import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
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

    int qCounter = 1;   // take (qCounter % 5) only if (qCounter % 5 != 0) ---> if (qCounter % 5 != 0) then qCounter += 1
    int qNumCounter = 1;    // (qCounter * 100) + (qNumCounter)

    
    late final DatabaseReference qCounterRef;
    late final DatabaseReference qNumCounterRef;
    late final DatabaseReference lastNumRef;
    late final DatabaseReference queueMainRef;
    late final DatabaseReference nowServingRef;
    late StreamSubscription _qCounter$;
    late StreamSubscription _qNumCounterRef$;

    
    int getNewQueueNum(){
        int num;
        // print("$qCounter , $qNumCounter");
        if (qCounter % 5 != 0){
            num = ((qCounter % 5) * 100) + (qNumCounter % 100);
        }else{
            num = (((qCounter+1) % 5) * 100) + (qNumCounter % 100);
        }
        qCounter += 1;
        if (qCounter % 5 == 0){
          qCounter += 1;
          qNumCounter += 1;
        }
        qCounterRef.set(qCounter);          // updates the values needed for generating ticket nums in the DB.
        qNumCounterRef.set(qNumCounter);
        return num;

    }


    void openDialog(int num) async {
        showDialog(
            context: context, 
            builder: (context) {
              return AlertBox(ticketNo: num);
            },
            barrierDismissible: true
        );
    }


    @override
    void initState() {
        qCounterRef = FirebaseDatabase.instance.ref("qCount");
        qNumCounterRef = FirebaseDatabase.instance.ref("qNumCount");
        nowServingRef = FirebaseDatabase.instance.ref("nowServing");
        lastNumRef = FirebaseDatabase.instance.ref("lastNum");
        queueMainRef = FirebaseDatabase.instance.ref("queueMain");
        _activateListeners();
        super.initState();
    }


    // only used in the initState() method
    void _activateListeners(){

        _qCounter$ = qCounterRef.onValue.listen((event) { 
            setState(() {
                qCounter = event.snapshot.value as int;
            });
        });

        _qNumCounterRef$ = qNumCounterRef.onValue.listen((event) { 
            setState(() {
                qNumCounter = event.snapshot.value as int;
            });
        });

        // listen to the main queue to update the "nowServing" data
        queueMainRef.onValue.listen((event) {
            // get the current value of the queueMain[0], and put it in "nowServing"
            queueMainRef.child("0").get().then((value) {
                nowServingRef.set(value.value as int);
            });
        });

    }

    

    void addNewNumToQueue(int qNum, int newNum){
        
        // take the db ref for the particular queue (use qNum)
        DatabaseReference qRef = FirebaseDatabase.instance.ref("q$qNum"); //.push().set(1000);

        qRef.child("q${qNum}Count").get().then((item) {
            var pushVal = <String, dynamic>{    // create new object that is to be pushed
                "${item.value}" : newNum
            };
            qRef.update(pushVal);               // add the value to the queue
            qRef.child("q${qNum}Count").set( (item.value as int) + 1);  // update the number of tickets in the queue
            lastNumRef.set(newNum);     // make this the new "last Number" in the queue 
        });

        queueMainRef.child("length").get().then((item) {
            var pushVal = <String, dynamic>{    // create new object that is to be pushed
                "${item.value}" : newNum
            };
            queueMainRef.update(pushVal);
            queueMainRef.child("length").set( (item.value as int) + 1 );
        });

    }

    @override
    void deactivate() {
        _qCounter$.cancel();
        _qNumCounterRef$.cancel();
        super.deactivate();    
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
                        onPressed: () {
                            int num = getNewQueueNum();
                            openDialog(num);
                            int tempQNum = (num / 100).truncate(); // get the queue number of the ticket                            
                            addNewNumToQueue(tempQNum, num);    // push the new number to the appropriate queue
                        },
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
