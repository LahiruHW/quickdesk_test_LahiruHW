import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AlertBox extends StatelessWidget {

    late final int ticketNo;

    AlertBox({
        Key? key,
        required this.ticketNo,
    }) : super(key: key);

    @override
    Widget build(BuildContext context) {

        return AlertDialog(
            title: const Text("NEW TICKET ISSUED"),
            titleTextStyle: TextStyle(
                fontSize: 40,
                letterSpacing: 2
            ),
            contentPadding: EdgeInsets.all(30),
            content: Text("Your ticket number is: $ticketNo"),
            actions: [
                TextButton(
                    onPressed: () => Navigator.of(context).pop(), 
                    child: const Text("Okay")
                ),
            ],

            elevation: 50.0,
        );

    }
}