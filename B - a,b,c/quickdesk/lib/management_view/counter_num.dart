import 'package:flutter/material.dart';

class CounterNum extends StatelessWidget {

    final int counterNum;

    const CounterNum({
        Key? key,
        required this.counterNum
    }) : super(key: key);


    @override
    Widget build(BuildContext context) {

        return Expanded(
            child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                    child: Text(
                        "COUNTER $counterNum",
                        style: const TextStyle(
                            fontSize: 40,
                            letterSpacing: 10,
                            color: Colors.white,
                            fontWeight: FontWeight.w900
                        ),
                    )
                ),
            ),
        );


    }

}