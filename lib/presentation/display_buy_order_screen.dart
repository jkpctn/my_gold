import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DisplayBuyOrderScreen extends StatelessWidget {
  int item = 0;

  Map buyItem1 = {
    'goldPrice': 25000,
    'weight': 200,
    'fee': 700,
    'goldPercentage': 90,
    'price': 20000
  };
  Map buyItem2 = {
    'goldPrice': 28000,
    'weight': 300,
    'fee': 500,
    'goldPercentage': 20,
    'price': 20000
  };
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
              padding: const EdgeInsets.only(
                  left: 20, top: 60, right: 20, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'ซื้อเข้า',
                    style: TextStyle(fontSize: 45, fontWeight: FontWeight.w800),
                  ),
                  Text(
                    '$item รายการ',
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
              onPressed: () {},
              child: Icon(Icons.add),
              backgroundColor: Colors.white,
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
                      // onTap: () {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => DetailScreen(
                      //         todo: data,
                      //         currentIDX: index,
                      //         nextPersonIDX:
                      //             _findNextPersonIDX(index),
                      //       ),
                      //     ),
                      //   );
                      // }
                    )));
          },
        ),
      ),
    );
  }
}
