abstract class PaymentStrategy {
  void pay(int amount);
}

class CashPayment implements PaymentStrategy {
  @override
  void pay(int amount) {
    print('Pay by cash: \$${amount}');
  }
}

class CreditCardPayment implements PaymentStrategy {
  @override
  void pay(int amount) {
    print('Pay by card: \$${amount}');
  }
}

class ShoppingCart {
  PaymentStrategy? paymentStrategy;

  void setPaymentStrategy(PaymentStrategy strategy) {
    paymentStrategy = strategy;
  }

  void checkout(int amount) {
    paymentStrategy?.pay(amount);
  }
}

void main() {
  var cart = ShoppingCart();

  cart.setPaymentStrategy(CashPayment());
  cart.checkout(100);

  cart.setPaymentStrategy(CreditCardPayment());
  cart.checkout(200);
}
