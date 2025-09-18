class CurrencyUtils {
  static String formatPrice(double price) {
    return '₹${(price * 83.0).toStringAsFixed(0)}';
  }
  
  static String formatPriceWithUsd(double price) {
    return '₹${(price * 83.0).toStringAsFixed(0)} (\$${price.toStringAsFixed(2)})';
  }
}