import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../config/routes.dart';

const TextStyle detailText =
    TextStyle(fontSize: 25, fontWeight: FontWeight.w800);

class DisplayBuyOrderScreen extends StatelessWidget {
  int item = 0;
  double _padding = 20;
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
    },
    {
      'goldPrice': 28000,
      'weight': 300,
      'fee': 500,
      'goldPercentage': 20,
      'price': 20000
    },
    {
      'goldPrice': 28000,
      'weight': 300,
      'fee': 500,
      'goldPercentage': 20,
      'price': 20000
    },
    {
      'goldPrice': 28000,
      'weight': 300,
      'fee': 500,
      'goldPercentage': 20,
      'price': 20000
    },
    {
      'goldPrice': 28000,
      'weight': 300,
      'fee': 500,
      'goldPercentage': 20,
      'price': 20000
    },
    {
      'goldPrice': 28000,
      'weight': 300,
      'fee': 500,
      'goldPercentage': 20,
      'price': 20000
    },
    {
      'goldPrice': 28000,
      'weight': 300,
      'fee': 500,
      'goldPercentage': 20,
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
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(160.0),
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
              backgroundColor: Colors.white,
            ),
          ),
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              //color: Colors.yellowAccent[100],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            child: ListView.separated(
              separatorBuilder: (context, index) => Divider(
                color: Colors.transparent,
                height: 20,
              ),
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Container(
                    height: 150,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        gradient: LinearGradient(
                            colors: [Colors.yellow, Colors.orange],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.orange,
                            blurRadius: 12,
                            offset: Offset(0, 6),
                          )
                        ]),
                    child: Row(
                      children: <Widget>[
                        Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.all(_padding),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Text(
                                      'ราคาซื้อเข้า',
                                      style: detailText,
                                    ),
                                    Text(
                                      'น้ำหนัก',
                                      style: detailText,
                                    ),
                                    Text(
                                      'เปอร์เซ็นทอง',
                                      style: detailText,
                                    )
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    top: _padding, bottom: _padding),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Text(
                                      ':',
                                      style: detailText,
                                    ),
                                    Text(
                                      ':',
                                      style: detailText,
                                    ),
                                    Text(
                                      ':',
                                      style: detailText,
                                    )
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.all(_padding),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Text(
                                      '28000 บาท',
                                      style: detailText,
                                    ),
                                    Text(
                                      '0.6 กรัม',
                                      style: detailText,
                                    ),
                                    Text(
                                      '70 %',
                                      style: detailText,
                                    )
                                  ],
                                )),
                            Container(
                                height: 90,
                                width: 150,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24),
                                    gradient: LinearGradient(
                                        colors: [Colors.orange, Colors.red],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.red,
                                        blurRadius: 12,
                                        offset: Offset(0, 6),
                                      )
                                    ]),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'ราคาทองรูปพรรณ',
                                      style: detailText,
                                    ),
                                    Text(
                                      '11700   บาท',
                                      style: detailText,
                                    )
                                  ],
                                ))
                          ],
                        )
                      ],
                    ));
              },
            ),
          ),
        )));
  }
}
