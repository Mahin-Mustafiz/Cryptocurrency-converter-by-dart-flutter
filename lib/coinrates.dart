import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() => runApp(CoinPrice());

class CoinPrice extends StatelessWidget
{
  @override
  Widget build(BuildContext path)
  {
    return MaterialApp
      (
        theme: ThemeData(platform: TargetPlatform.iOS),
        debugShowCheckedModeBanner: false,
        home: Manipulate()
    );
  }
}
class Manipulate extends StatelessWidget
{
  final List coinName = ['Bitcoin','Ethereum','BNB','Cardano','Dogecoin','Polygon','Litecoin','Tron','Dai','Cosmos'];
  final List coinBase = ['BTC','ETH','BNB','ADA','DOGE','MATIC','LTC','TRX','DAI','ATOM'];
  final List amountBDT = ['3280184.019 BDT','225108.2268 BDT','32621.74 BDT','40.87 BDT','8.76 BDT','115.88 BDT','9525.6532 BDT','6.96 BDT','105.44 BDT','1149.29 BDT'];

  @override
  Widget build(BuildContext path)
  {
    return Scaffold
      (
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
            backgroundColor: Colors.grey[300],
            title: Text(
              'CRYPTOCURRENCY CONVERTER',
              style: TextStyle(
                  color: Colors.grey[900],
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 2.0
              ),
            ),
            actions:[
              PopupMenuButton
                (
                  icon: const Icon(Icons.list, color: Colors.black, size:28),
                  itemBuilder:(path)
                  {
                    return
                      [
                        const PopupMenuItem<int>(value:1, child: Text('Bangladesh', style: TextStyle(letterSpacing: 2))),
                        const PopupMenuItem<int>(value:2, child: Text('USA', style: TextStyle(letterSpacing: 1.5)))
                      ];
                  },
                  onSelected: (value)
                  {
                    if(value==1)
                    {

                    }else{
                      Navigator.push(path, MaterialPageRoute(builder: (path)=>CoinPrice2()));
                    }
                  }
              ),
            ]
        ),
        body: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: coinName.length,
            itemBuilder: (path, index)
            {
              return DataAffect2(coinName[index], coinBase[index], amountBDT[index], index);
            }
        )
    );
  }
}
class CoinPrice2 extends StatelessWidget
{
  @override
  Widget build(BuildContext path)
  {
    return MaterialApp
      (
        theme: ThemeData(platform: TargetPlatform.iOS),
        debugShowCheckedModeBanner: false,
        home: Manipulate2()
    );
  }
}
//ignore: must_be_immutable
class Manipulate2 extends StatelessWidget
{
  final List coinName = ['Bitcoin','Ethereum','BNB','Cardano','Dogecoin','Polygon','Litecoin','Tron','Dai','Cosmos'];
  final List coinBase = ['BTC','ETH','BNB','ADA','DOGE','MATIC','LTC','TRX','DAI','ATOM'];
  //final List amountBDT = ['2955318.702 BDT','196613.8238 BDT','32621.74 BDT','40.87 BDT','8.76 BDT','115.88 BDT','9525.6532 BDT','6.96 BDT','105.44 BDT','1149.29 BDT'];
  final List amountUSD = ['30093.6484 USD','30093.6484 USD','313.022 USD','0.387 USD','0.0834 USD','1.092 USD','90.5174 USD','0.0665 USD','1.0 USD','11.02 USD'];

  @override
  Widget build(BuildContext path)
  {
    return Scaffold
      (
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
            backgroundColor: Colors.grey[300],
            title: Text(
              'CRYPTOCURRENCY CONVERTER',
              style: TextStyle(
                  color: Colors.grey[900],
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 2.0
              ),
            ),
            actions:[
              PopupMenuButton
                (
                  icon: const Icon(Icons.list, color: Colors.black, size:28),
                  itemBuilder:(path)
                  {
                    return
                      [
                        const PopupMenuItem<int>(value:1, child: Text('Bangladesh', style: TextStyle(letterSpacing: 2))),
                        const PopupMenuItem<int>(value:2, child: Text('USA', style: TextStyle(letterSpacing: 1.5)))
                      ];
                  },
                  onSelected: (value)
                  {
                    if(value==1)
                    {
                      Navigator.push(path, MaterialPageRoute(builder: (path)=>CoinPrice()));
                    }else{

                    }
                  }
              ),
            ]
        ),
        body: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: coinName.length,
            itemBuilder: (path, index)
            {
              return DataAffect2(coinName[index], coinBase[index], amountUSD[index], index);
            }
        )
    );
  }
}
//ignore: must_be_immutable
class DataAffect2 extends StatefulWidget
{
  String coinData, coinForm, price;
  int keyflg;
  DataAffect2(this.coinData, this.coinForm, this.price, this.keyflg);
  @override
  //ignore: no_logic_in_create_state
  State<DataAffect2> createState() => PriceRate(coinData, coinForm, price, keyflg);
}
//ignore: must_be_immutable
class PriceRate extends State<DataAffect2>
{
  String coinData, coinForm, price1;
  int idx;
  PriceRate(this.coinData, this.coinForm, this.price1, this.idx);
  final List<String> altRate = ['-0.28%','-0.33%','-0.10%','-0.11%','-0.45%','+1.44%'];
  final List<String> imgURL = ['https://png.pngtree.com/png-clipart/20220222/ourmid/pngtree-bitcoin-cryptocurrency-png-3d-png-image_4417395.png',
    'https://png.pngtree.com/png-vector/20220131/ourmid/pngtree-ethereum-crypto-golden-silver-symbol-png-image_4373402.png',
    'https://cryptologos.cc/logos/bnb-bnb-logo.png?v=024',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTb14_Ix10ND-gRhOBTdPVPrdwdZ-sjyyOMaw&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIOhIE1tzflkgY3rN2HAYkdtdbp-cI8gKu5g&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSXKl5agsh6ZlsiZ1FjXkSfqc8JsEzASzHEmg&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjgBiEq7JjisRy2M5L2yGXb1VzsXFI1ss-IQ&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRR3uIy8zgah1m1v4PjRnZsB3W46_gwXxsqsw&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJrTKeM-H2mzSu5BAWqLgQpQ4erH3kyducQJqDy1eEvcMIFCdl27iLvXPcRJmeHO1FjRE&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjk-vziFN9Z1lB2LDtgp5Hm4qTjbXNQdlV7g&usqp=CAU'
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(4, 4),
              blurRadius: 10,
              spreadRadius: 1,
            ),
            BoxShadow(
              color: Colors.white,
              offset: Offset(-4, -4),
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(4, 4),
                      blurRadius: 10,
                      spreadRadius: 1,
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-4, -4),
                      blurRadius: 10,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                // Image.network("https://png.pngtree.com/element_our/png/20181227/bitcoin-vector-icon-png_286775.jpg")
                //Icon(Icons.favorite, color: Colors.pink, size:40)
                height: 60,
                width: 60,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.network(imgURL[idx], width: 100.00, height: 100.0, fit: BoxFit.fill),
                ),
              ),
            ),
            Expanded(
              //child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      coinData,
                      style: TextStyle(
                        color: Colors.grey[900],
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    coinForm,
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              //),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    price1,
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '1 Coin',
                    /*
                    change.toDouble() < 0
                        ? change.toDouble().toString()
                        : '+' + change.toDouble().toString(), */
                    style: TextStyle(
                      color: Colors.green[250],
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    altRate[math.Random().nextInt(altRate.length)],
                    /*
                    changePercentage.toDouble() < 0
                        ? changePercentage.toDouble().toString() + '%'
                        : '+' + changePercentage.toDouble().toString() + '%', */
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}