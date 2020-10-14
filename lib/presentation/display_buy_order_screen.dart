import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_gold/presentation/data.dart';
import '../config/routes.dart';

const TextStyle detailText = TextStyle(
  fontSize: 25,
  fontWeight: FontWeight.w800,
);

class DisplayBuyOrderScreen extends StatefulWidget {
  //final data;
  @override
  _DisplayBuyOrderScreenState createState() => _DisplayBuyOrderScreenState();
}

class _DisplayBuyOrderScreenState extends State<DisplayBuyOrderScreen> {
  int item = 0;

  double _padding = 20;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    _navigateAndDisplayEditData(BuildContext context) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    final result =
        await Navigator.of(context).pushNamed(AppRoutes.addBuyOrder);
    _scaffoldKey.currentState
    ..removeCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text("$result")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('ซื้อเข้า ${data.length} รายการ'),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        floatingActionButton: Container(
          height: 100,
          width: 100,
          child: FittedBox(
            child: FloatingActionButton(
              onPressed: () =>
                  {Navigator.of(context).pushNamed(AppRoutes.editBuyOrder)},
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
                return GestureDetector(
                  onTap:  () => {_navigateAndDisplayEditData(context)},
                  child: Container(
                      height: 150,
                      width: 100,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                  width: 140,
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
                      )),
                );
              },
            ),
          ),
        )));
  }
}
