// ignore_for_file: prefer_const_constructors
import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CounterTab extends StatefulWidget {

    Color backgroundColour;
    final bool counterOpen;
    final int counterNum;

    CounterTab({
        Key? key,
        required this.counterOpen,
        required this.backgroundColour, 
        required this.counterNum,
    }) : super(key: key);

    @override
    // ignore: no_logic_in_create_state
    State<CounterTab> createState() => _CounterTabState(
        key: key,
        backgroundColour: backgroundColour,
        counterNum: counterNum,
        counterOpen: counterOpen,
    );

}

class _CounterTabState extends State<CounterTab> {

    Color backgroundColour;
    bool counterOpen;
    final int counterNum;
    int queueNum = 0;

    late Color indicatorColor;
    late Color tabColor;
    late final DatabaseReference dbQueueRef;

    _CounterTabState({
        Key? key,
        required this.counterOpen,
        required this.backgroundColour, 
        required this.counterNum,  
    });

    late StreamSubscription _q$;
    late StreamSubscription _qOnline$;


    @override
    void initState() {
        super.initState();
        dbQueueRef = FirebaseDatabase.instance.ref("q$counterNum");
        _activateListeners();

    }


    void _activateListeners(){


        // listen to changes in the first number of the queue
        _q$ = dbQueueRef.child("0").onValue.listen((event) {
            if (event.snapshot.exists){
              setState(() {
                  queueNum = event.snapshot.value as int;
              });
            }
            else{
              setState(() => queueNum = 0);
            }
        });

        // listen to the online status of the counter
          _qOnline$ = dbQueueRef.child("online").onValue.listen((event) {
            setState(() {
                counterOpen = event.snapshot.value as bool;
            });  
         });

    }


    @override
    void deactivate() {
        _q$.cancel();
        _qOnline$.cancel();
        super.deactivate();
    }


    @override
    Widget build(BuildContext context) {

        indicatorColor = counterOpen ? Color.fromARGB(255, 0, 235, 20) : Color.fromARGB(255, 255, 17, 0);
        tabColor = counterOpen ? backgroundColour : Colors.grey.shade500;

        return Expanded(
            flex: 1,
            child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                    decoration: BoxDecoration(
                      color: tabColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                          BoxShadow(
                              color: Colors.black,
                              offset: Offset.fromDirection(0),
                              blurRadius: 10.0
                          ),
                      ]
                    ),
                    child: Center(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                                Expanded(
                                    child: Row(
                                        children: [

                                            Expanded(
                                                flex: 3,
                                                child: Container()
                                            ),

                                            Expanded(
                                                flex: 1,
                                                child: Container(
                                                    alignment: Alignment.centerRight,
                                                    margin: const EdgeInsets.all(20),
                                                    decoration: BoxDecoration(
                                                        color: indicatorColor,
                                                        shape: BoxShape.circle,
                                                        boxShadow: [

                                                            BoxShadow(
                                                                color: Colors.black,
                                                                offset: Offset.fromDirection(0),
                                                                blurRadius: 1.0
                                                            ),


                                                            BoxShadow(
                                                                color: indicatorColor,
                                                                offset: Offset.fromDirection(0),
                                                                blurRadius: 20.0
                                                            ),


                                                        ]
                                                    ),
                                                )
                                            )

                                        ],
                                    )
                                ),

                                Expanded(
                                    child: Text(
                                        "COUNTER $counterNum",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 25
                                        ),
                                    ),
                                ),      
                                Expanded(
                                    child: Text(
                                        "${counterOpen ? queueNum : "OFFLINE"}", 
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 45,
                                            fontWeight: FontWeight.bold
                                        ),
                                    ),
                                ),
                            ],
                        )
                    ),
                ),
            ),
        );        
      
    }

}