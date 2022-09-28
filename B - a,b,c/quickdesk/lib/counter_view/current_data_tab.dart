import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';


// ignore: must_be_immutable
class CurrentDataTab extends StatefulWidget {
    
    dynamic onPressed;

    CurrentDataTab({
        Key? key,
        this.onPressed,
    }) : super(key: key);


    @override
    // ignore: no_logic_in_create_state
    State<CurrentDataTab> createState() => _CurrentDataTabState(
        key: key,
        onPressed: onPressed
    );
}

class _CurrentDataTabState extends State<CurrentDataTab> {

    dynamic onPressed;
    late int nowServingVal = 0;
    late int lastNumberVal = 0;

    late final DatabaseReference nowServingdb;
    late final DatabaseReference lastNumberdb;
    late StreamSubscription _nowServing$;
    late StreamSubscription _lastNum$;

    _CurrentDataTabState({
        Key? key,
        this.onPressed,
    });

    @override
    void initState() {
        nowServingdb = FirebaseDatabase.instance.ref("nowServing");
        lastNumberdb = FirebaseDatabase.instance.ref("lastNum");
        _activateListeners();
        super.initState();
    }

    void _activateListeners(){
        
        // listen for the number that is being served
        _nowServing$ = nowServingdb.onValue.listen((event) {
            setState(() {
                nowServingVal = event.snapshot.value as int;
            });
        });

        // listen for the last number that was served
        _lastNum$ = lastNumberdb.onValue.listen((event) {
            setState(() {
                lastNumberVal = event.snapshot.value as int;
            });
        });

    }

    @override
    void deactivate() {
        _nowServing$.cancel();
        _lastNum$.cancel();
        super.deactivate();
    }

    @override
    Widget build(BuildContext context) {
      

        return Expanded(
            flex: 2,
            child: Container(
                // color: Colors.green,
                alignment: Alignment.center,
                child: Row(
                    children: [
                    
                        Expanded(
                            flex: 1,
                            child: Container()
                        ),

                        Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Colors.amber.shade900,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                          BoxShadow(
                                              color: Colors.black,
                                              offset: Offset.fromDirection(0),
                                              blurRadius: 5.0
                                          ),
                                      ]
                                  ),

                                  child: Center(
                                      child: Column(
                                          children:  [
                                              
                                              Expanded(
                                                  flex: 1,
                                                  child: Center(
                                                      child: Text(
                                                          "Now Serving: $nowServingVal",
                                                          style: const TextStyle(
                                                              fontSize: 30,
                                                              fontWeight: FontWeight.w900,
                                                          ),
                                                      )
                                                  )
                                              ),

                                              Expanded(
                                                  flex: 2,
                                                  child: Center(
                                                      child: Text(
                                                          "Last Number: $lastNumberVal",
                                                          style: const TextStyle(
                                                              fontSize: 30,
                                                              fontWeight: FontWeight.w900,
                                                          ),
                                                      )
                                                  )
                                              ),
                                              
                                              Expanded(
                                                  flex: 1,
                                                  child: Center(
                                                      child: ElevatedButton(
                                                          style: ButtonStyle(
                                                            padding: MaterialStateProperty.all<EdgeInsets>(
                                                                const EdgeInsets.all(25)
                                                            )
                                                          ),
                                                          onPressed: onPressed ,
                                                          child: const Text(
                                                              "TAKE A NUMBER",
                                                              style: TextStyle(
                                                                  fontSize: 20,
                                                                  fontWeight: FontWeight.w700,
                                                              ),
                                                          ),
                                                      )
                                                  )
                                              )
                                          ]
                                      ),
                                  ),

                              ),
                            ),
                        ),

                        Expanded(
                            flex: 1,
                            child: Container()
                        )

                    ]
                ),

            ),
        );



      
    }
}
