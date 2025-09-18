class PriceFormatter {
  static String formatINR(double usdPrice) {
    final inrPrice = (usdPrice * 83.0).round();
    return '₹$inrPrice';
  }
  
  static String formatWithUSD(double usdPrice) {
    final inr = formatINR(usdPrice);
    final usd = '\$${usdPrice.toStringAsFixed(2)}';
    return '$inr ($usd)';
  }
}