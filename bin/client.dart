import 'bank-account.dart';

class Client{
  String name;
  String phone;
  String address;
  late BankAccount account;
  Client({required this.name,required this.address,required this.phone});

  void view(){
    print('name : $name');
    print('phone : $phone');
    print('address : $address');
  }
}