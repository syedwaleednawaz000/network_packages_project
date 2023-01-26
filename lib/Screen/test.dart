import 'package:flutter/material.dart';

class Testing extends StatefulWidget {
  const Testing({Key? key}) : super(key: key);

  @override
  State<Testing> createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  List<String> nameList = ["march", "tamater"];
  List growableList = [];

  void increment({required int index}) {
    growableList[index]++;
    setState(() {});
  }

  void decrement({required int index}) {
    growableList[index]--;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    for (int i = 0; i <= nameList.length; i++) {
      growableList = List<int>.generate(i, (int index) {
        index * 0;

        // growable:true;
        return 1;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            child: Column(
              children: [
                ListView.builder(
                    itemCount: nameList.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        height: 50,
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  decrement(index: index);
                                },
                                icon: Icon(Icons.remove)),
                            Text("total price ${nameList[index]}"),
                            IconButton(
                                onPressed: () {
                                  increment(index: index);
                                },
                                icon: Icon(Icons.add)),
                            Text(growableList[index].toString())
                          ],
                        ),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
