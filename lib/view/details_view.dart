import 'package:flutter/material.dart';
import '../model/crypto_model.dart';
import '../widget/container_widget.dart';
import 'package:intl/intl.dart'; // for date format

class DetailsView extends StatelessWidget {
  DetailsView({Key? key, required this.index, required this.crypto})
      : super(key: key);
  int index;
  List<CryptoModel> crypto;

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(crypto[index].lastUpdated);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        foregroundColor: Colors.deepPurple,
        title: Text(
          crypto[index].symbol.toUpperCase().toString(),
          style: TextStyle(
            color: Colors.deepPurple,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                height: height * 0.2,
                width: width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Image.network(crypto[index].image.toString()),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              containerWidget(context, "COIN :",
                  crypto[index].symbol.toUpperCase().toString()),
              SizedBox(
                height: 10,
              ),
              containerWidget(context, "NAME :",
                  crypto[index].name.toUpperCase().toString()),
              SizedBox(
                height: 10,
              ),
              containerWidget(context, "PRICE :",
                  "${crypto[index].currentPrice.toString()} USD"),
              SizedBox(
                height: 10,
              ),
              containerWidget(
                  context, "VALUE :", crypto[index].totalVolume.toString()),
              SizedBox(
                height: 10,
              ),
              containerWidget(
                  context, "High 24H :", crypto[index].high24H.toString()),
              SizedBox(
                height: 10,
              ),
              containerWidget(
                  context, "Low 24H :", crypto[index].low24H.toString()),
              SizedBox(
                height: 10,
              ),
              containerWidget(context, "Last Updated :", formatted.toString()),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
