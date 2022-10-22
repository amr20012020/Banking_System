import 'dart:io';

import 'bank-account.dart';
import 'client.dart';
import 'saving.dart';


class BankSystem{
  List<BankAccount> accounts = [];
  List<Client> users = [];
  BankSystem(){
    AddTestData();
  }

  void CreateAccount(){
    print('Please Enter Client Name');
    String name  = stdin.readLineSync()!;
    print('Please Enter Client Address');
    String address  = stdin.readLineSync()!;
    print('Please Enter Client Phone');
    String phone  = stdin.readLineSync()!;
    Client client = Client(name: name, address: address, phone: phone);
    print('Choose Client Account \n 1 - Basic Account \n 2- Saving Account');
    int chooseAccont = int.parse(stdin.readLineSync()!);
    print('Please Enter Client Balance');
    double balance= double.parse(stdin.readLineSync()!);
    BankAccount? account;
    if(chooseAccont == 1){
      account = BankAccount(balance);
    }else if(chooseAccont == 2){
      if(balance < 1000){
        print('Sorry!!! balance should be at least >= 1000 to create saving account');
        return ;
      }
      account = SavingBankAccount(balance);
    }else{
      return;
    }
    account?.owner = client;
    client.account = account!;
    accounts.add(account);
    users.add(client);
    print('Successfully Created,');
  }
 void AddTestData(){
    for(int i = 0 ; i<=20;i++){
      accounts.add(BankAccount(i*1000));
      users.add(Client(name: 'user : $i', address: 'address: $i', phone: 'phone: $i'));
      accounts[i].owner = users[i];
      users[i].account = accounts[i];
    }
  }

 void showAllAccounts(){
    for(int i =0;i<accounts.length;i++){
      accounts[i].view();
      print('=-------------------------------');
    }
  }

  int getAccountIndexByID(int accountID){
    for(int i = 0; i<accounts.length;i++){
      if(accounts[i].account_Id == accountID){
        return i;
      }
    }
    return -1;
  }

 BankAccount? getAccountByID(int accountID){
    for(int i = 0; i<accounts.length;i++){
      if(accounts[i].account_Id == accountID){
        return accounts[i];
      }
    }
    return null;
  }

  void showAccountsDetails(){
    print('Please Enter Account Id');
    int accountId = int.parse(stdin.readLineSync()!);
    BankAccount? account = getAccountByID(accountId);
    if(account == null){
      print('Invalid Account Id');
      return ;
    }
    account.view();
    print('========================');
  }


  void DeleteAccount(){
    print('Please Enter Account Id');
    int accountId = int.parse(stdin.readLineSync()!);
    BankAccount? account = getAccountByID(accountId);
    if(account == null){
      print('Invalid Account Id');
      return ;
    }
    accounts.remove(account);
    users.remove(account.owner);
    print('Successfully Deleted');
    print('-------------------------');
  }

  void deposit(){
    print('Please Enter Account Id');
    int accountId = int.parse(stdin.readLineSync()!);
    BankAccount? account = getAccountByID(accountId);
    if(account == null){
      print('Invalid Account Id');
      return ;
    }
    print('Please Enter Your Amount');
    double amount = double.parse(stdin.readLineSync()!);
    account.deposit(amount);
    print('Successfully Added');
    print('--------------------');
  }

  void withdraw(){
    print('Please Enter Account Id');
    int accountId = int.parse(stdin.readLineSync()!);
    BankAccount? account = getAccountByID(accountId);
    if(account == null){
      print('Invalid Account Id');
      return ;
    }
    print('Please Enter Your Amount');
    double amount = double.parse(stdin.readLineSync()!);
    account.withdraw(amount);
    print('Successfully ');
    print('--------------------');
  }

  showMenu(){
    while(true){
      print('1- Create Account');
      print('2- Show All Account');
      print('3- Show Account Details');
      print('4- Delete Account');
      print('5- Withdraw');
      print('6- Deposit');
      print('7- Exit');
      print('What option do you need?');
      int op = int.parse(stdin.readLineSync()!);
      if(op == 1){
        CreateAccount();
      }else if(op == 2){
        showAllAccounts();
      }else if(op == 3){
        showAccountsDetails();
      }else if(op == 4){
        DeleteAccount();
      }else if(op == 5){
        withdraw();
      }else if(op == 6){
        deposit();
      }else if(op == 7){
        return ;
      }else {
        print('Invalid option');
         return ;
      }
    }

  }

}


main(){
  BankSystem bankSystem = BankSystem();
  bankSystem.showMenu();
}