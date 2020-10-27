abstract class GoldPriceEvent {}

class ChangeLastestGoldPriceEvent extends GoldPriceEvent {
  final double goldPrice;

  ChangeLastestGoldPriceEvent(this.goldPrice);
}
