import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = currenciesList[0];
  Map<int, String> exchangeRates;

  DropdownButton<String> getAndroidDropdown() {
    return DropdownButton<String>(
      items: currenciesList
          .map<DropdownMenuItem<String>>(
              (String value) => DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  ))
          .toList(),
      onChanged: (String chosenCurrency) async {
        selectedCurrency = chosenCurrency;
        await showExchangeRateForSelectedCurrency();
/*        setState(() {
          selectedCurrency = chosenCurrency;
          showExchangeRateForSelectedCurrency();
        });*/
      },
      value: selectedCurrency,
      isExpanded: true,
    );
  }

  CupertinoPicker getIosPicker() {
    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      children: currenciesList
          .map((currencyText) => Text(
                currencyText,
                style: TextStyle(color: Colors.white),
              ))
          .toList(),
      onSelectedItemChanged: (int selectedIndex) async {
        String currencyText = currenciesList.elementAt(selectedIndex);
        selectedCurrency = currencyText;
        await showExchangeRateForSelectedCurrency();
      },
    );
  }

  Widget getPicker() {
    if (Platform.isIOS) {
      return getIosPicker();
    } else if (Platform.isAndroid) {
      return getAndroidDropdown();
    } else {
      return getAndroidDropdown();
    }
  }

  Future<void> showExchangeRateForSelectedCurrency() async {
    Map<int, String> cryptoRates = await getExchangeRates();
    setState(() {
      exchangeRates = cryptoRates;
    });
  }

  Future<Map<int, String>> getExchangeRates() async {
    Map<int, String> cryptoRates = {};
    for (int i = 0; i < cryptoList.length; i++) {
      CoinData coinData = new CoinData(selectedCurrency, cryptoList[i]);
      var decodedCoinData = await coinData.getCoinData();
      if (decodedCoinData != null) {
        double temp = decodedCoinData['rate'];
        cryptoRates.update(i, (value) => temp.toStringAsFixed(0),
            ifAbsent: () => temp.toStringAsFixed(0));
      } else {
        cryptoRates.update(i, (value) => '?', ifAbsent: () => '?');
      }
    }
    return cryptoRates;
  }
  
  String getExchangeRateDescription(String crypto) {
    if (exchangeRates != null && exchangeRates[cryptoList.indexOf(crypto)] != null ) {
      return exchangeRates[cryptoList.indexOf(crypto)];
    } else {
      return '?';
    }
  }

  List<Widget> getCryptoCurrenciesInfo() {
    return cryptoList
        .map((String crypto) => Padding(
              padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
              child: Card(
                color: Colors.lightBlueAccent,
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                  child: Text(
                    '1 $crypto = ${getExchangeRateDescription(crypto)} $selectedCurrency',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ))
        .toList();
  }

  @override
  void initState() {
    super.initState();
    showExchangeRateForSelectedCurrency();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // ...getCryptoCurrenciesInfo(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: getCryptoCurrenciesInfo(),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Padding(
              padding: EdgeInsets.only(right: 20.0, left: 20.0),
              child: getPicker(),
            ),
          ),
        ],
      ),
    );
  }
}
