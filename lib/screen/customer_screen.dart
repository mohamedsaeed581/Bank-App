import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transaction_money/cubit/cubit.dart';
import 'package:transaction_money/cubit/states.dart';
import 'package:transaction_money/screen/transfer_screen.dart';

class CustomerScreen extends StatelessWidget {
  final String  name;
  final String phone ;
  final int balance;
  final String email;
  final int id;
  const CustomerScreen({Key? key, required this.name, required this.phone, required this.balance, required this.email, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xff0c9869),
        ),
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(35),bottomRight: Radius.circular(35),
                ),
                color: Color(0xff0c9869),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacer(flex: 1,),
                  Text('Hi, $name',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text('Your invest account value is',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Spacer(flex: 1,),
                  Divider(
                    endIndent: 40,
                    indent: 40,
                    color: Colors.black,
                    thickness: 1,
                  ),
                  Spacer(flex: 1,),
                  Text('$balance\$',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                  Spacer(flex: 1,),
                ],
              ),
            ),
            Spacer(flex: 1,),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Center(child:
                Text('Email:  ${email}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                )),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[300],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Center(child: Text('Phone:  ${phone}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                )),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[300],
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(15.0),
            //   child: Container(
            //     width: MediaQuery.of(context).size.width,
            //     height: MediaQuery.of(context).size.height * 0.1,
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(20),
            //       color: Colors.grey[300],
            //     ),
            //   ),
            // ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => TransferScreen(amount: balance,id: id,name: name,)));
              },
              child: Text('Transfer Money',
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff0c9869),
                  minimumSize: Size(120, 60),
                  elevation: 10),
            ),
            Spacer(flex: 10,),
          ],
        ));

  }
}
