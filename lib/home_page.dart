import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'coin_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CoinData coinData = CoinData();
  String selectedCurrency = 'USD';

  String coinLtc = '?';
  String coinBtc = '?';
  String coinEth = '?';

  @override
  void initState() {
    super.initState();
    updateValue();
  }

  Future updateValue() async {
    var btcRateData = await coinData.getExchangeRate(selectedCurrency, 'BTC');
    var ethRateData = await coinData.getExchangeRate(selectedCurrency, 'ETH');
    var ltcRateData = await coinData.getExchangeRate(selectedCurrency, 'LTC');

    if (btcRateData != null && ltcRateData != null && ethRateData != null) {
      setState(
            () {
          double btcRate = btcRateData['rate'];
          coinBtc = btcRate.toInt().toString();
          double ltcRate = ltcRateData['rate'];
          coinLtc = ltcRate.toInt().toString();
          double ethRate = ethRateData['rate'];
          coinEth = ethRate.toInt().toString();
        },
      );
      return;
    }
  }

  DropdownButton<String> getDropDownButton() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(child: Text(currency), value: currency);
      dropDownItems.add(newItem);
    }
    return DropdownButton<String>(
        value: selectedCurrency,
        items: dropDownItems,
        onChanged: (value) {
          setState(() {
            selectedCurrency = value!;
            updateValue();
            print(selectedCurrency);
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 80.0, 18.0, 0),
            child: Column(
              children: [
                Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                    EdgeInsets.symmetric(vertical: 15.0, horizontal: 85.0),
                    child: Column(
                      children: [
                        Text(
                          '1 BTC = $coinBtc $selectedCurrency',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                    EdgeInsets.symmetric(vertical: 15.0, horizontal: 85.0),
                    child: Column(
                      children: [
                        Text(
                          '1 ETH = $coinEth $selectedCurrency',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                    EdgeInsets.symmetric(vertical: 15.0, horizontal: 90.0),
                    child: Column(
                      children: [
                        Text(
                          '1 LTC = $coinLtc $selectedCurrency',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 100.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 20.0),
            color: Colors.lightBlueAccent,
            child: getDropDownButton(),
          ),
        ],
      ),
    );
  }
}
