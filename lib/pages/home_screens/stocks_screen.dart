import 'package:bnacash/Controller/userController.dart';
import 'package:bnacash/pages/login/models/dob.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StocksScreen extends StatefulWidget {
  const StocksScreen({Key? key}) : super(key: key);

  @override
  State<StocksScreen> createState() => _StocksScreenState();
}

class _StocksScreenState extends State<StocksScreen> {
    double _amount = 0.0;
  String _fromCurrency = 'USD';
  String _toCurrency = 'EUR';
  double _result = 0.0;

  final List<String> _currencies = [
    'USD',
    'EUR',
    '\u{1F1EC}\u{1F1E7}',
    'AUD',
    'CAD',
    'JPY',
  ];

  final Map<String, double> _rates = {
    'USD': 1.0,
    'EUR': 0.85,
    'GBP': 0.72,
    'AUD': 1.30,
    'CAD': 1.26,
    'JPY': 109.76,
  };

  void _convert() {
    double amountInDollars = _amount / _rates[_fromCurrency]!;
    _result = amountInDollars * _rates[_toCurrency]!;
    setState(() {});
  }
       final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
  UserController userController = Get.put(UserController());
    return  
    GetBuilder<UserController>(
      
      init: UserController(),
      builder:(_){
        return
Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Amount',
                  prefixIcon: Icon(Icons.attach_money),
                ),
                onChanged: (value) {
                  _amount = double.parse(value);
                },
                validator: (value) {
                       if (value!.isEmpty) {
              return 'Please enter a value';
            }
        
            if (double.tryParse(value) == null) {
              return 'Please enter a valid number';
            }
        
            return null;
          
                      
                      },
        
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'From',
                        prefixIcon: Icon(Icons.arrow_drop_down),
                      ),
                      value: _fromCurrency,
                      items: _currencies.map((currency) {
                        return DropdownMenuItem<String>(
                          value: currency,
                          child: Text(currency),
                        );
                      }).toList(),
                      onChanged: (value) {
                        _fromCurrency = value!;
                      },
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'To',
                        prefixIcon: Icon(Icons.arrow_drop_down),
                      ),
                      value: _toCurrency,
                      items: _currencies.map((currency) {
                        return DropdownMenuItem<String>(
                          value: currency,
                          child: Text(currency),
                        );
                      }).toList(),
                      onChanged: (value) {
                        _toCurrency = value!;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed:()async{
                                        if (_formKey.currentState!.validate()) {
                       await  _.convertCurrencies(baseCurrency:_fromCurrency, toCurrency: _toCurrency, amount: _amount);
               
                    print("object");
                    
                  }
        
                } ,
                child: Text('Convert'),
              ),
              SizedBox(height: 16.0),
              Text(
                '$_amount $_fromCurrency =  ${_.convert} $_toCurrency',
                style: TextStyle(fontSize: 20.0),
              ),
            ],
          ),
        ),
      );
      } );

    
  }
}

