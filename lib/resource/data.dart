class BuyOrder {
  double goldPrice;
  double weight;
  double goldPercentage;
  double price;
  BuyOrder(this.goldPrice, this.weight, this.goldPercentage, this.price);
}

class StatArguments {
  List<BuyOrder> buy;
  List<SellOrder> sell;
  StatArguments(this.buy, this.sell);
}

class SellOrder {
  double goldPrice;
  double weight;
  double goldPercentage;
  double price;
  double makingFee;
  SellOrder(this.goldPrice, this.weight, this.goldPercentage, this.price,
      this.makingFee);
}

List<BuyOrder> buyOrders = [
  BuyOrder(28000, 10, 70, 0),
  BuyOrder(26000, 20, 10, 0),
  BuyOrder(25000, 310, 96.5, 0),
];
