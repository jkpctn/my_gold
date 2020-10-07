import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../config/routes.dart';

class DisplayBuyOrderScreen extends StatelessWidget {
  int item = 0;
  List<Map> data = [
    {
      'goldPrice': 25000,
      'weight': 200,
      'fee': 700,
      'goldPercentage': 90,
      'price': 20000
    },
    {
      'goldPrice': 28000,
      'weight': 300,
      'fee': 500,
      'goldPercentage': 20,
      'price': 20000
    }
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(180.0),
          child: AppBar(
            flexibleSpace: Padding(
              padding:
                  const EdgeInsets.only(left: 20, top: 60, right: 20, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'ซื้อเข้า',
                    style: TextStyle(fontSize: 45, fontWeight: FontWeight.w800),
                  ),
                  Text(
                    '${data.length} รายการ',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        floatingActionButton: Container(
          height: 100,
          width: 100,
          child: FittedBox(
            child: FloatingActionButton(
              onPressed: () =>
                        {Navigator.of(context).pushNamed(AppRoutes.addBuyOrder)},
              child: Icon(Icons.add),
              backgroundColor: Colors.blue[300],
            ),
          ),
        ),
        body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Container(
                height: 150,
                child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: ListTile(
                      title: Text(
                        '${data[index]['weight']}   ${data[index]['price']}',
                        style: TextStyle(fontSize: 25),
                      ),
                    )));
          },
        ),
      ),
    );
  }
}
