import 'client.dart';

class BankAccount{
  late int account_Id;
  late double balance;

  static int GENERTEID = 1000;
  late Client owner;

  BankAccount([this.balance = 0]){
    account_Id = GENERTEID;
    GENERTEID++;
  }

  bool withdraw(double amount){
    if(amount > balance){
       print('Invalid amount');
       return false;
    }
    if(amount < 0){
      print('Invalid amount');
      return false;
    }
    balance -= amount;
    return true;
  }

  bool deposit(double amount){
    if(amount > 0){
      print('Invalid amount');
      return false;
    }
    balance += amount;
    return true;
  }

  void view(){
    print('Account Id: $account_Id');
    print('Balance : $balance');
    owner.view();
  }

}