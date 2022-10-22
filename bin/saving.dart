import 'bank-account.dart';

class SavingBankAccount extends BankAccount {
  double minBalance;
  SavingBankAccount([double balance = 1000, this.minBalance = 1000]) : super(balance);

  @override
  bool withdraw(double amount) {
    if((balance - amount) < minBalance){
      print('Invalid amount');
      return false;
    }
   return super.withdraw(amount);
  }
  
  @override
  bool deposit(double amount) {
    if(amount < 100){
      print('Amount should be at least >= 100');
      return false;
    }
    return super.deposit(amount);
  }
  
  
  @override
  void view() {
    print('Saving Account');
    super.view();
  }
}
