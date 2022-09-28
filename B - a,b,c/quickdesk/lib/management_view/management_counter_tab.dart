import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:quickdesk/management_view/counter_num.dart';

// ignore: must_be_immutable
class CounterManagementTab extends StatefulWidget {


    final int counterNum;
    final Color backgroundColor;

    const CounterManagementTab({
        Key? key,
        required this.counterNum,
        required this.backgroundColor, 
    }) : super(key: key);


    @override
    // ignore: no_logic_in_create_state
    State<CounterManagementTab> createState() => _CounterManagementTabState(
        key: key,
        counterNum: counterNum,
        backgroundColor: backgroundColor,
    );


}

class _CounterManagementTabState extends State<CounterManagementTab> {

    final int counterNum;
    late Color openColor;
    final Color backgroundColor;
    late final DatabaseReference dbQueueRef;
    late final DatabaseReference nowServingRef;
    late final DatabaseReference lastNumRef;
    late StreamSubscription _qOnline$;
    bool counterOpen = true;

    _CounterManagementTabState({
        Key? key,
        required this.counterNum,
        required this.backgroundColor, 
    });


    @override
    void initState() {
        super.initState();
        dbQueueRef = FirebaseDatabase.instance.ref("q$counterNum");
        // start the page with the online status of the counter given on the server
        _qOnline$ = dbQueueRef.child("online").onValue.listen((event) { 
            setState(() {
                counterOpen = event.snapshot.value as bool;
            });
        });
    }

    @override
    void deactivate() {
        _qOnline$.cancel();
        super.deactivate();
    }


    void goOffline() async {
        counterOpen = !counterOpen;
        await dbQueueRef.child("online").set(counterOpen);
        // print("MGMT LOG ------- Counter $counterNum ${counterOpen ? "opened" : "closed"}");
        setState(() {});
    }

    void completeCurrent() async {
                         
        // take the current value at "0" in the current queue 
        


        print("COMPLETED CURRENT FROM QUEUE $counterNum");

    }


    void callNext() async {

        // ignore: avoid_print
        print("NEXT CALL FOR COUNTER $counterNum");

    }


    @override
    Widget build(BuildContext context) {

        return Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: backgroundColor,
                  ),
                  child: Center(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          
                          children: [

                              CounterNum(
                                  counterNum: counterNum
                              ),
                              
                              Expanded(
                                  child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: 
                                      ElevatedButton(

                                          onPressed: goOffline, 

                                          child: Text(
                                              (counterOpen) ? "GO OFFLINE" : "GO ONLINE", 
                                              style: const TextStyle(
                                                  fontSize: 30,
                                                  letterSpacing: 2,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w900
                                              ),
                                          ),
                                      ),
                                  ),
                              ),







                              Expanded(
                                  child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: ElevatedButton(
                                          
                                          onPressed: counterOpen ? completeCurrent : null, 

                                          child: const Text(
                                              "COMP CURR",
                                              style: TextStyle(
                                                  fontSize: 30,
                                                  letterSpacing: 2,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w900
                                              ),
                                          ),
                                      ),
                                  ),
                              ),



                              Expanded(
                                  child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: ElevatedButton(
                                          onPressed: counterOpen ? callNext : null,
                                          child: const Text(
                                              "CALL NEXT",
                                              style: TextStyle(
                                                  fontSize: 30,
                                                  letterSpacing: 2,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w900
                                              ),
                                          ),
                                      ),
                                  ),
                              ),                                                                                                        

                          ]
                      )
                  ),
              ),
            )
        );        
      
    }

}