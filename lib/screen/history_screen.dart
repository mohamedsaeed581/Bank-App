import 'package:flutter/material.dart';
import 'package:transaction_money/screen/customer_screen.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff0c9869),
          title: Text('History'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context,index) => Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.1,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[300],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Mohamed Saeed',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('150000\$'),
                    )
                  ],
                ),
              ),
              separatorBuilder: (context,index) => Divider(
                  thickness: 0.5,
                  indent: 20,
                  height: MediaQuery.of(context).size.height * 0.05,
                  endIndent: 20,color: Colors.grey[300]),
              itemCount: 10),
        )
    );
  }
}
