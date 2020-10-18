double calculateBuyingPrice(
    double goldPrice, double weight, double goldPercentage) {
  double price;
  if (goldPercentage == 96.5) {
    price = weight / 15.2 * 0.656 * goldPrice;
  } else {
    price = weight / 15.2 * 0.656 * goldPrice * (goldPercentage * 0.01);
  }
  return price;
}

double calculateSellingPrice(
    double goldPrice, double weight, double goldPercentage, double makingFee) {
  double price;
  if (goldPercentage == 96.5) {
    price = (weight / 15.2 * 0.656 * goldPrice) + makingFee;
  } else {
    price = ((weight / 15.2 * 0.656 * goldPrice) + makingFee) *
        (goldPercentage * 0.01);
  }
  return price;
}

bool isCustomWeight(double weight) {
  if (![0, 0.6, 1.6, 1.9, 3.8, 7.6, 15.2, 30.4].contains(weight))
    return true;
  else
    return false;
}

bool isCustomGoldPercentage(double percentage) {
  if (![0, 70, 80, 96.5].contains(percentage))
    return true;
  else
    return false;
}
