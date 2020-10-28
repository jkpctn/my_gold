import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_gold/presentation/add_buy_order_screen.dart';
import 'package:my_gold/presentation/add_sell_order_screen.dart';
import 'package:my_gold/presentation/style.dart';
import 'package:my_gold/resource/data.dart';

const TextStyle header = TextStyle(fontSize: 45, fontWeight: FontWeight.w800);
const TextStyle detail = TextStyle(fontSize: 35, fontWeight: FontWeight.w800);

class StatScreen extends StatefulWidget {
  final StatArguments data;

  const StatScreen({Key key, @required this.data}) : super(key: key);

  @override
  _StatScreenState createState() => _StatScreenState();
}

class _StatScreenState extends State<StatScreen> {
  double totalBuyWeight;
  double totalSellWeight;
  double totalBuyPrice;
  double totalSellPrice;
  double meanBuyingGoldPrice;
  double meanSellingGoldPrice;
  double customheight = 40;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    countBuyWeight(widget.data.buy);
    countSellWeight(widget.data.sell);
  }

  void countBuyWeight(List<BuyOrder> target) {
    double weight = 0;
    double price = 0;
    double meanGoldPrice = 0;
    for (var i in target) {
      weight += i.weight;
      price += i.price;
      meanGoldPrice += i.goldPrice;
    }
    meanGoldPrice /= target.length;
    totalBuyWeight = weight;
    totalBuyPrice = price;
    meanBuyingGoldPrice = meanGoldPrice;
  }

  void countSellWeight(List<SellOrder> target) {
    double weight = 0;
    double price = 0;
    double meanGoldPrice = 0;
    for (var i in target) {
      weight += i.weight;
      price += i.price;
      meanGoldPrice += i.goldPrice;
    }
    meanGoldPrice /= target.length;
    totalSellWeight = weight;
    totalSellPrice = price;
    meanSellingGoldPrice = meanGoldPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'สถิติ',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
      )),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'น้ำหนัก',
                  style: header,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ซื้อเข้า',
                          style: detail,
                        ),
                        Text(
                          'ขายออก',
                          style: detail,
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$totalBuyWeight',
                          style: detail,
                        ),
                        Text(
                          '$totalSellWeight',
                          style: detail,
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'กรัม',
                          style: detail,
                        ),
                        Text(
                          'กรัม',
                          style: detail,
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
            customDivider(customheight),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'รวมจำนวนเงิน',
                  style: header,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ซื้อเข้า',
                          style: detail,
                        ),
                        Text(
                          'ขายออก',
                          style: detail,
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${totalBuyPrice.toStringAsFixed(0)}',
                          style: detail,
                        ),
                        Text(
                          '${totalSellPrice.toStringAsFixed(0)}',
                          style: detail,
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'บาท',
                          style: detail,
                        ),
                        Text(
                          'บาท',
                          style: detail,
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
            customDivider(customheight),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ราคาทองเฉลี่ย',
                  style: header,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ราคาซื้อเข้า',
                          style: detail,
                        ),
                        Text(
                          'ราคาขายออก',
                          style: detail,
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$meanBuyingGoldPrice',
                          style: detail,
                        ),
                        Text(
                          '$meanSellingGoldPrice',
                          style: detail,
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'บาท',
                          style: detail,
                        ),
                        Text(
                          'บาท',
                          style: detail,
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
            customDivider(customheight),
          ],
        ),
      ),
    );
  }
}
