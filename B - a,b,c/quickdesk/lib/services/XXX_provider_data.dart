import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quickdesk/services/XXX_state.dart';

/// Provider that manages the state of the application
/// and notifies the entire system about the changes,
/// reflecting the changes in the Firebase database.
class StateProvider extends ChangeNotifier{

    static int nowServing = 0;
    static int lastNum = 0;
    static ListQueue q1 = ListQueue<int>();     // get values from the database??
    static bool q1Online = true;
    static ListQueue q2 = ListQueue<int>();
    static bool q2Online = true;
    static ListQueue q3 = ListQueue<int>();
    static bool q3Online = true;
    static ListQueue q4 = ListQueue<int>();
    static bool q4Online = true;


    final DocumentReference<Map<String, dynamic>> db = FirebaseFirestore.instance.collection('queueData').doc("JU1grgF6iG5qOqUnfe8i");

    final Stream< List<QueueState> > x  = FirebaseFirestore.instance.collection('queueData').snapshots()
    .map(
        (snapshot) => snapshot.docs.map(
            (doc) => QueueState.fromJson(doc.data())
        ).toList()
    );


    // late State x = QueueState(
    //     nowServing: nowServing, 
    //     lastNum: lastNum, q1: q1, q1Online: q1Online, q1Count: q1Count, 
    //     q2: q2, q2Online: q2Online, q2Count: q2Count, 
    //     q3: q3, q3Online: q3Online, q3Count: q3Count, 
    //     q4: q4, q4Online: q4Online, q4Count: q4Count
    // )

    Future updateQueue() async{

        // db.set("", "");

        // db.get()

    }


    static Future<Stream<List<QueueState>>> getData() async{
        final Stream< List<QueueState> > x  = FirebaseFirestore.instance.collection('queueData').snapshots()
        .map(
            (snapshot) => snapshot.docs.map(
                (doc) => QueueState.fromJson(doc.data())
            ).toList()
        );
        return x;
    }


    // generate lazy values???
    Function lazyNumGenerator(int n){

        return (n) => {
            // return {}
        };

    }


    void enqueue(int queueNum, int newQueueNum){
        switch (queueNum){
            case 0: {
                q1.addLast(newQueueNum);
            }
            break;
            case 1: {
                q2.addLast(newQueueNum);
            }
            break;
            case 2: {
                q3.addLast(newQueueNum);
            }
            break;
            case 3: {
                q4.addLast(newQueueNum);
            }
            break;
        }

        notifyListeners();
    }

    int dequeue(int queueNum){
        int ret;
        if (queueNum == 0){
            ret =  q1.removeFirst();
        }
        else if (queueNum == 1){
            ret =  q2.removeFirst();
        }
        else if (queueNum == 2){
            ret =  q3.removeFirst();
        }
        else {
            ret =  q4.removeFirst();
        }
        notifyListeners();
        return ret;
    }

    ListQueue getQueue(int queueNum){
        ListQueue ret;
        if (queueNum == 0){
            ret =  q1;
        }
        else if (queueNum == 1){
            ret =  q2;
        }
        else if (queueNum == 2){
            ret =  q3;
        }
        else {
            ret =  q4;
        }
        notifyListeners();
        return ret;
    }

    int size(int queueNum){
        int ret;
        if (queueNum == 0){
            ret =  q1.length;
        }
        else if (queueNum == 1){
            ret =  q2.length;
        }
        else if (queueNum == 2){
            ret =  q3.length;
        }
        else {
            ret =  q4.length;
        }
        notifyListeners();
        return ret;
    }



}