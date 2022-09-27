import 'dart:io';

import 'package:firebase_database/firebase_database.dart';


class FirebaseServices{


    static int nowServing = 0;
    static int lastNum = 0;
    static List<int> q1 = [];
    static bool q1Online = true;
    static List<int> q2 = [];
    static bool q2Online = true;
    static List<int> q3 = [];
    static bool q3Online = true;
    static List<int> q4 = [];
    static bool q4Online = true;


    static FirebaseDatabase db = FirebaseDatabase.instance;
    // static DatabaseReference dbOnlineRef = FirebaseDatabase.instance.ref("q${counterNum}Online");
    // static DatabaseReference dbQueueRef = FirebaseDatabase.instance.ref("q$counterNum");
    static DatabaseReference nowserving = FirebaseDatabase.instance.ref("nowServing");
    static DatabaseReference lastNumber = FirebaseDatabase.instance.ref("lastNum");


    static DatabaseReference getQueueRef(int counterNum){
        return db.ref("q$counterNum");
    }

    static DatabaseReference getOnlineRef(int counterNum){
        return db.ref("q${counterNum}Online");
    }

    static void getQueue(int counterNum){
        
        // print("q$counterNum");

        FirebaseServices.getQueueRef(counterNum).get().then((value) { 
            
            var x = value.children.map((e) => e.value as int).toList();
            
            if (counterNum == 1){ FirebaseServices.q1 = x; }
            else if (counterNum == 2){ FirebaseServices.q2 = x; }
            else if (counterNum == 3){ FirebaseServices.q3 = x; }
            else { FirebaseServices.q4 = x; }
            // print(x);
            return x;
            // value.children.forEach((e) => print(e.value as int))

        });    

    }

    static void prtLst(){
        print(FirebaseServices.q1);
        print(FirebaseServices.q2);
        print(FirebaseServices.q3);
        print(FirebaseServices.q4);
    }


}
