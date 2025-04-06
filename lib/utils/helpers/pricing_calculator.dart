class PricingCalculator {
  static double calculateTotalPrice(double price, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = price * taxRate;

    double shippingCost = getShippingCost(location);

    double totalPrice = price + taxAmount + shippingCost;

    return totalPrice;
  }

  static String calculateShippingCost(double price, String location) {
    double shippingCost = getShippingCost(location);
    return shippingCost.toStringAsFixed(2);
  }

  static String calculateTax(double price, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = price * taxRate;
    return taxAmount.toStringAsFixed(2);
  }

  static double getTaxRateForLocation(String location) {
    return 0.10;
  }

  static double getShippingCost(String location) {
    return 5.00;
  }
}
