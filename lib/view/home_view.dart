import 'package:crypto_app/bloc/crypto_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'details_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<CryptoBloc>().add(GetCryptoEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(
            "C R Y P T O",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
        body: BlocBuilder<CryptoBloc, CryptoState>(
          builder: (BuildContext context, state) {
            if (state is LoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ErrorState) {
              return Center(
                child: Text(
                  state.message.toString(),
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              );
            } else if (state is UpdateState) {
              return ListView.builder(
                  itemCount: state.data.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailsView(index: index,crypto: state.data,)));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                          ),
                          child: ListTile(
                            title: Text(state.data[index].symbol
                                .toString()
                                .toUpperCase()),
                            subtitle: Text(state.data[index].name
                                .toString()
                                .toUpperCase()),
                            leading: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade500,
                                      offset: Offset(4, 4),
                                      blurRadius: 2,
                                      spreadRadius: 1,
                                    ),
                                    BoxShadow(
                                      color: Colors.white,
                                      offset: Offset(-4, -4),
                                      blurRadius: 10,
                                      spreadRadius: 1,
                                    ),
                                  ]),
                              child: Image.network(
                                  state.data[index].image.toString()),
                            ),
                            trailing: Text(
                              "${state.data[index].currentPrice.toString()} USD",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepPurple,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            } else {
              return Container();
            }
          },
        ));
  }
}
