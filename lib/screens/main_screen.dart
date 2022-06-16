import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gold_price/cubit/status/cubit.dart';
import 'package:gold_price/cubit/status/status.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    int grams = 0;
    return BlocProvider(
      create: (context) => MainCubit()
        ..getGoldPrice()
        ..getSilverPrice(),
      child: BlocConsumer<MainCubit, Status>(
        listener: (context, state) {},
        builder: (context, state) => Scaffold(
          backgroundColor: Colors.grey,
          appBar: AppBar(
            title: const Center(child: Text("Gold Prices")),
            backgroundColor: Colors.black,
          ),
          body: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.black,
            ),
            padding: const EdgeInsets.all(20.0),
            margin: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    //Gold
                    Expanded(
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/gold.png',
                            height: MediaQuery.of(context).size.height / 5,
                            width: MediaQuery.of(context).size.width / 2.5,
                          ),
                          Text(
                            "Gold",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.orangeAccent,
                              fontSize: MediaQuery.of(context).size.width / 10,
                              shadows: const [
                                BoxShadow(
                                  color: Colors.orangeAccent,
                                  offset: Offset(0.5, 0.5),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '${MainCubit.get(context).goldI}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.orangeAccent,
                                fontSize:
                                    MediaQuery.of(context).size.width / 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //Silver
                    Expanded(
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/silver.png',
                            height: MediaQuery.of(context).size.height / 5,
                            width: MediaQuery.of(context).size.width / 2.5,
                          ),
                          Text(
                            "Silver",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                              fontSize: MediaQuery.of(context).size.width / 10,
                              shadows: const [
                                BoxShadow(
                                    color: Colors.white12,
                                    offset: Offset(1, 1),
                                    blurRadius: 5,
                                    blurStyle: BlurStyle.outer)
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "${MainCubit.get(context).silverI}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                                fontSize:
                                    MediaQuery.of(context).size.width / 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Grams you want : ',
                        style: TextStyle(color: Colors.white54, fontSize: 25),
                      ),
                      Text(
                        '$grams',
                        style: TextStyle(color: Colors.white54, fontSize: 20),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              print(grams);
                              if (grams < 1000) {
                                setState(() {
                                  grams++;
                                });
                              }
                            },
                            child: Icon(Icons.add),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white54,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              print(grams);
                              if (grams > 0) {
                                setState(() {
                                  grams--;
                                });
                              }
                              ;
                            },
                            child: Icon(Icons.remove_sharp),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white54,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 50,),
                Center(
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Money for grams in EGB = ',
                        style: TextStyle(
                          color: Colors.white54,
                          fontSize: 25,
                        ),
                      ),
                      Text(
                        (grams * (MainCubit.get(context).goldI)!).toString(),
                        style: TextStyle(
                          color: Colors.white54,
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ) ,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
