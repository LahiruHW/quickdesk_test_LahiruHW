import 'dart:collection';

class QueueState {

    int nowServing = 0;
    int lastNum = 0;
    
    var q1 = ListQueue<int>();     // get values from the database??
    var q1Online = true;
    var q1Count = 0;
    
    var q2 = ListQueue<int>();
    var q2Online = true;
    var q2Count = 0;

    var q3 = ListQueue<int>();
    var q3Online = true;
    var q3Count = 0;
    
    var q4 = ListQueue<int>();
    var q4Online = true;
    var q4Count = 0;


    QueueState({
      required this.nowServing,
      required this.lastNum,
      required this.q1, required this.q1Online, required this.q1Count,
      required this.q2, required this.q2Online, required this.q2Count,
      required this.q3, required this.q3Online, required this.q3Count,
      required this.q4, required this.q4Online, required this.q4Count,
    });

    static QueueState fromJson( Map<String, dynamic> json ) => QueueState(
        nowServing: json['nowServing'], 
        lastNum: json['lastNum'], 
        q1: json['q1'], 
        q1Online: json['q1Online'], 
        q1Count: json['q1Count'], 
        q2: json['q2'], 
        q2Online: json['q2Online'], 
        q2Count: json['q2Count'], 
        q3: json['q3'], 
        q3Online: json['q3Online'], 
        q3Count: json['q3Count'], 
        q4: json['q4'], 
        q4Online: json['q4Online'], 
        q4Count: json['q4Count']
    );



}


