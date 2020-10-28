import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_gold/presentation/calculate_function.dart';
import 'package:my_gold/resource/data.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:my_gold/presentation/style.dart';

import '../gold_price_bloc.dart';
import 'gold_scraping.dart';

const header_textstyle = TextStyle(fontSize: 45, fontWeight: FontWeight.w800);
const button_textstyle = TextStyle(fontSize: 5, fontWeight: FontWeight.w800);
const TextStyle detailText =
    TextStyle(fontSize: 20, fontWeight: FontWeight.w800);

class AddSellOrderScreen extends StatefulWidget {
  @override
  _AddSellOrderScreenState createState() => _AddSellOrderScreenState();
}

class _AddSellOrderScreenState extends State<AddSellOrderScreen> {
  double goldPrice = 0;
  double weight = 0.0;
  double goldPercentage = 0;
  double price = 0;
  double customPrice = -1;
  double buyPrice = -2;
  double makingFee = -1;
  double customFee = 0;
  final goldPriceField = TextEditingController();
  final makingFeeField = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSellPrice().then((String result) => setState(() {
          buyPrice = double.parse(result.replaceAll(',', ''));
        }));
  }

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
    price = calculateSellingPrice(goldPrice, weight, goldPercentage, makingFee);
  }

  void changeWeight(double tappedWeight) {
    //debugPrint('w $weight tap $tappedWeight');
    weight = tappedWeight;
    setState(() {});
  }

  void changeFee(double tappedFee) {
    //debugPrint('w $weight tap $tappedWeight');
    makingFee = tappedFee;
    setState(() {});
  }

  void changePrice(double tappedPrice) {
    //debugPrint('customPrice $customPrice');
    goldPrice = tappedPrice;
    setState(() {});
  }

  void confirmCustomGoldPrice(String inputPrice) {
    goldPrice = double.parse(inputPrice);
    customPrice = goldPrice;
    Navigator.of(context).pop();
    debugPrint(inputPrice);
    setState(() {});
  }

  void changeCustomPrice(double tappedPrice) {
    debugPrint('customPrice $customPrice');
    customPrice = tappedPrice;
    goldPrice = tappedPrice;
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text(
                "กำหนดราคาขายออก",
                style: detailText,
              ),
              content: TextFormField(
                controller: goldPriceField,
                keyboardType: TextInputType.number,
                style: detailText,
                onFieldSubmitted: (inputPrice) {
                  confirmCustomGoldPrice(inputPrice);
                },
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text('ยืนยัน'),
                  onPressed: () {
                    confirmCustomGoldPrice(goldPriceField.text);
                  },
                ),
                FlatButton(
                  child: Text('ยกเลิก'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ));
    setState(() {});
  }

  void confirmCustomFee(String inputFee) {
    makingFee = double.parse(inputFee);
    customFee = makingFee;
    Navigator.of(context).pop();
    debugPrint(inputFee);
    setState(() {});
  }

  void changeCustomFee(double tappedFee) {
    debugPrint('customFee $tappedFee');
    customFee = tappedFee;
    makingFee = tappedFee;
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text(
                "กำหนดค่ากำเหน็ด",
                style: detailText,
              ),
              content: TextFormField(
                controller: makingFeeField,
                keyboardType: TextInputType.number,
                style: detailText,
                onFieldSubmitted: (inputPrice) {
                  confirmCustomFee(inputPrice);
                },
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text('ยืนยัน'),
                  onPressed: () {
                    confirmCustomFee(makingFeeField.text);
                  },
                ),
                FlatButton(
                  child: Text('ยกเลิก'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ));
    setState(() {});
  }

  void changeGoldPercentage(double tappedWeight) {
    //debugPrint('w $weight tap $tappedWeight');
    goldPercentage = tappedWeight;
    setState(() {});
  }

  bool isSelectedPrice(double buttonPrice) {
    if (buttonPrice == goldPrice) {
      //debugPrint('$buttonweight,$weight');
      return true;
    } else
      return false;
  }

  bool isSelectedFee(double buttonFee) {
    if (buttonFee == makingFee) {
      //debugPrint('$buttonweight,$weight');
      return true;
    } else
      return false;
  }

  bool isSelectedWeight(double buttonweight) {
    if (buttonweight == weight) {
      debugPrint('$buttonweight,$weight');
      return true;
    } else
      return false;
  }

  bool isSelectedGoldPercentage(double buttonPercentage) {
    if (buttonPercentage == goldPercentage) {
      return true;
    } else
      return false;
  }

  void _addSellOrder() {
    if (weight == 0 && goldPercentage == 0) {
      AlertDialog alert = AlertDialog(
        title: Text(
          'โปรดระบุ',
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.w800),
        ),
        content: Text('น้ำหนักและเปอร์เซ็นทอง',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800)),
      );
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    } else if (weight == 0) {
      AlertDialog alert = AlertDialog(
        title: Text(
          'โปรดระบุ',
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.w800),
        ),
        content: Text('น้ำหนัก',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800)),
      );
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
      setState(() {});
    } else if (goldPercentage == 0) {
      AlertDialog alert = AlertDialog(
        title: Text(
          'โปรดระบุ',
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.w800),
        ),
        content: Text('เปอร์เซ็นทอง',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800)),
      );
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    } else
      bloc.changeBuyPrice(goldPrice);
    Navigator.pop(context,
        SellOrder(goldPrice, weight, goldPercentage, price, makingFee));
    setState(() {});
  }

  void _showCustomWeight() {
    debugPrint('CustomWeight');
    showDialog<double>(
        context: context,
        builder: (BuildContext context) {
          return new NumberPickerDialog.decimal(
            minValue: 0,
            maxValue: 50,
            title: new Text("Pick new weight"),
            initialDoubleValue: weight,
          );
        }).then((value) => {
          if (value != null) {setState(() => weight = value)}
        });
  }

  void _showCustomGoldPercentage() {
    debugPrint('CustomWeight');
    showDialog<double>(
        context: context,
        builder: (BuildContext context) {
          return new NumberPickerDialog.decimal(
            minValue: 0,
            maxValue: 100,
            title: new Text("Pick new weight"),
            initialDoubleValue: goldPercentage,
          );
        }).then((value) => {
          if (value != null) {setState(() => goldPercentage = value)}
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          title: Text(
        'เพิ่มรายการขายออก',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
      )),
      body: StreamBuilder(
          initialData: bloc.goldPrice,
          stream: bloc.getStream,
          builder: (context, snapshot) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'ราคาขายออก',
                      style: header_textstyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        selectPrice('ราคาปัจจุบัน', buyPrice,
                            isSelectedPrice(buyPrice)),
                        // selectPrice('ราคาล่าสุด', snapshot.data.buying,
                        //     isSelectedPrice(snapshot.data.buying)),
                        Container(
                          height: 58,
                          //color: isSelectedWeight ? (Colors.blue) : null,
                          child: RaisedButton(
                            elevation: btnElevation,
                            shape: selectButtonShape,
                            // side: BorderSide(color: Colors.red)),
                            color: (snapshot.data.buying == goldPrice &&
                                    snapshot.data.buying != 0)
                                ? selectedBtn
                                : unSelectedBtn,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'ราคาล่าสุด',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w800,
                                      color:
                                          (snapshot.data.buying == goldPrice &&
                                                  snapshot.data.buying != 0)
                                              ? (Colors.white)
                                              : Colors.black),
                                ),
                                if (snapshot.data.buying == 0)
                                  Text(
                                    '-',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w800,
                                        color: (snapshot.data.buying ==
                                                    goldPrice &&
                                                snapshot.data.buying != 0)
                                            ? (Colors.white)
                                            : Colors.black),
                                  ),
                                if (snapshot.data.buying != 0)
                                  Text(
                                    '${snapshot.data.buying}',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w800,
                                        color:
                                            (snapshot.data.buying == goldPrice)
                                                ? (Colors.white)
                                                : Colors.black),
                                  ),
                              ],
                            ),
                            onPressed: () => {
                              changePrice(snapshot.data.buying)
                            }, //changeWeight(price),
                          ),
                        ),
                        Container(
                          height: 58,
                          //color: isSelectedWeight ? (Colors.blue) : null,
                          child: RaisedButton(
                            elevation: btnElevation,
                            shape: selectButtonShape,
                            // side: BorderSide(color: Colors.red)),
                            color: customPrice == goldPrice
                                ? selectedBtn
                                : unSelectedBtn,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'กำหนดเอง',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w800,
                                      color: customPrice == goldPrice
                                          ? (Colors.white)
                                          : Colors.black),
                                ),
                                if (customPrice != -1)
                                  Text(
                                    customPrice.toString(),
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w800,
                                        color: customPrice == goldPrice
                                            ? (Colors.white)
                                            : Colors.black),
                                  ),
                              ],
                            ),
                            onPressed: () => {
                              changeCustomPrice(customPrice)
                            }, //changeWeight(price),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'น้ำหนักทอง ',
                      style:
                          TextStyle(fontSize: 45, fontWeight: FontWeight.w800),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        selectButton('0.6 กรัม', 0.6, isSelectedWeight(0.6)),
                        selectButton('1.6 กรัม', 1.6, isSelectedWeight(1.6)),
                        selectButton('1.9 กรัม', 1.9, isSelectedWeight(1.9)),
                        selectButton('3.8 กรัม', 3.8, isSelectedWeight(3.8)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        selectButton('7.6 กรัม', 7.6, isSelectedWeight(7.6)),
                        selectButton('15.2 กรัม', 15.2, isSelectedWeight(15.2)),
                        selectButton('30.4 กรัม', 30.4, isSelectedWeight(30.4)),
                        RaisedButton(
                          elevation: btnElevation,
                          shape: selectButtonShape,
                          child: Text(
                            'กำหนดเอง',
                            style: isCustomWeight(weight)
                                ? (smaller_decorationText)
                                : smaller_detailTextBlack,
                          ),
                          color: isCustomWeight(weight)
                              ? selectedBtn
                              : unSelectedBtn,
                          onPressed: () => _showCustomWeight(),
                        )
                      ],
                    ),
                    Text(
                      'เปอร์เซ็นทอง',
                      style:
                          TextStyle(fontSize: 45, fontWeight: FontWeight.w800),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        selectGoldButton(
                            '70 %', 70, isSelectedGoldPercentage(70)),
                        selectGoldButton(
                            '80 %', 80, isSelectedGoldPercentage(80)),
                        selectGoldButton(
                            '96.5 %', 96.5, isSelectedGoldPercentage(96.5)),
                        RaisedButton(
                          elevation: btnElevation,
                          shape: selectButtonShape,
                          child: Text(
                            'กำหนดเอง',
                            style: isCustomGoldPercentage(goldPercentage)
                                ? (smaller_decorationText)
                                : smaller_detailTextBlack,
                          ),
                          color: isCustomGoldPercentage(goldPercentage)
                              ? selectedBtn
                              : unSelectedBtn,
                          onPressed: () => _showCustomGoldPercentage(),
                        )
                      ],
                    ),
                    Text(
                      'ค่ากำเหน็ด',
                      style:
                          TextStyle(fontSize: 45, fontWeight: FontWeight.w800),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        selectFeeButton('300 บาท', 300, isSelectedFee(300)),
                        selectFeeButton('500 บาท', 500, isSelectedFee(500)),
                        selectFeeButton('700 บาท', 700, isSelectedFee(700)),
                        RaisedButton(
                          elevation: btnElevation,
                          shape: selectButtonShape,
                          child: Text(
                            'กำหนดเอง',
                            style: customFee == makingFee
                                ? (smaller_decorationText)
                                : smaller_detailTextBlack,
                          ),
                          color: customFee == makingFee
                              ? selectedBtn
                              : unSelectedBtn,
                          onPressed: () => changeCustomFee(customFee),
                        )
                      ],
                    ),
                    // SizedBox(
                    //   height: 50,
                    // ),
                    Center(
                        child: orderCard(weight, goldPercentage, goldPrice,
                            price, makingFee)),
                    // SizedBox(
                    //   height: 50,
                    // ),
                    Center(
                      child: RaisedButton(
                          elevation: btnElevation,
                          shape: selectButtonShape,
                          color: unSelectedBtn,
                          child: Text(
                            'เพิ่ม',
                            style: detailTextBlack,
                          ),
                          onPressed: _addSellOrder),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }

  Container selectPrice(String title, double price, bool isSelected) {
    return Container(
      //color: isSelectedWeight ? (Colors.blue) : null,
      child: RaisedButton(
        elevation: btnElevation,
        shape: selectButtonShape,
        // side: BorderSide(color: Colors.red)),
        color: isSelected ? selectedBtn : unSelectedBtn,
        child: Column(
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: isSelected ? (Colors.white) : Colors.black),
            ),
            if (price > 0)
              Text(
                price.toString(),
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    color: isSelected ? (Colors.white) : Colors.black),
              ),
          ],
        ),
        onPressed: () => changePrice(price), //changeWeight(price),
      ),
    );
  }

  Container selectButton(
      String title, double weightGrams, bool isSelectedWeight) {
    return Container(
      //color: isSelectedWeight ? (Colors.blue) : null,
      child: RaisedButton(
        elevation: btnElevation,
        shape: selectButtonShape,
        // side: BorderSide(color: Colors.red)),
        color: isSelectedWeight ? selectedBtn : unSelectedBtn,
        child: Text(
          title,
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: isSelectedWeight ? (Colors.white) : Colors.black),
        ),
        onPressed: () => changeWeight(weightGrams),
      ),
    );
  }

  Container selectGoldButton(
      String title, double weightGrams, bool isSelectedWeight) {
    return Container(
      //color: isSelectedWeight ? (Colors.blue) : null,
      child: RaisedButton(
        elevation: btnElevation,
        shape: selectButtonShape,
        color: isSelectedWeight ? selectedBtn : unSelectedBtn,
        child: Text(
          title,
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: isSelectedWeight ? (Colors.white) : Colors.black),
        ),
        onPressed: () => changeGoldPercentage(weightGrams),
      ),
    );
  }

  Container selectFeeButton(
      String title, double weightGrams, bool isSelectedWeight) {
    return Container(
      //color: isSelectedWeight ? (Colors.blue) : null,
      child: RaisedButton(
        elevation: btnElevation,
        shape: selectButtonShape,
        color: isSelectedWeight ? selectedBtn : unSelectedBtn,
        child: Text(
          title,
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: isSelectedWeight ? (Colors.white) : Colors.black),
        ),
        onPressed: () => changeFee(weightGrams),
      ),
    );
  }
}

Container orderCard(double weightGrams, double goldPercentage, double goldPrice,
    double price, double makingFee) {
  double _padding = 20;
  const TextStyle detailText =
      TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: Colors.black);
  return Container(
      height: 150,
      width: 350,
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        'ราคาขายออก',
                        style: detailText,
                      ),
                      Text(
                        'น้ำหนัก',
                        style: detailText,
                      ),
                      Text(
                        'เปอร์เซ็นทอง',
                        style: detailText,
                      ),
                      Text(
                        'ค่ากำเหน็ด',
                        style: detailText,
                      )
                    ],
                  )),
              Padding(
                  padding: EdgeInsets.only(top: _padding, bottom: _padding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        '${goldPrice.toInt()} บาท',
                        style: detailText,
                      ),
                      Text(
                        '$weightGrams กรัม',
                        style: detailText,
                      ),
                      Text(
                        '$goldPercentage %',
                        style: detailText,
                      ),
                      Text(
                        '$makingFee',
                        style: detailText,
                      )
                    ],
                  )),
              Container(
                  height: 90,
                  width: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      // gradient: LinearGradient(
                      //     colors: [Colors.orange, Colors.red],
                      //     begin: Alignment.topLeft,
                      //     end: Alignment.bottomRight),
                      color: Colors.red,
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
                        style: smaller_decorationText,
                      ),
                      Text(
                        '${price.toStringAsFixed(2)}   บาท',
                        style: smaller_decorationText,
                      )
                    ],
                  ))
            ],
          )
        ],
      ));
  ;
}
