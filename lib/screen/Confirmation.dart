import 'package:flutter/material.dart';
import 'package:transaction_money/screen/home_screen.dart';

class ConfirmScreen extends StatelessWidget {
  const ConfirmScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Spacer(flex: 2,),

          Center(
            child: Image(image: AssetImage('assets/images/confirm.png'),)
          ),
          Spacer(flex: 2,),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
            },
            child: Text(
              'Back to Home',
              style: TextStyle(color: Colors.black),
            ),
            style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff0c9869),
                minimumSize: Size(120, 60),
                elevation: 10),
          ),
          Spacer(flex: 2,),

        ],
      ),
    );
  }
}
