import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class Publish extends StatefulWidget {
  const Publish({Key? key}) : super(key: key);

  @override
  State<Publish> createState() => _PublishState();
}

class _PublishState extends State<Publish> {
  List banks = ['Total Balance', '', 'Bank 1'];
  List spending = ['', 'Spend wiely', ''];
  List<int> money = [0, 0, 0];
  @override
  Widget build(BuildContext context) {
    int balance = 0;
    money[0] = 0;
    for (int i = 0; i < money.length; i += 2) {
      balance += money[i];
    }
    money[0] = balance;
    int remain = 0;
    money[1] = 0;
    for (int i = 1; i < money.length; i += 2) {
      remain += money[i];
    }
    money[1] = remain;
    var size = MediaQuery.of(context).size.width;
    return SafeArea(
      top: true,
      child: Scaffold(
          backgroundColor: const Color(0xFF212227),
          appBar: AppBar(
            toolbarHeight: 80,
            backgroundColor: const Color(0xFF212227),
            title: Container(
              width: size,
              height: 55,
              margin: const EdgeInsets.only(top: 5),
              decoration: BoxDecoration(
                  color: const Color(0xFF2D2E33),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 3)
                  ],
                  borderRadius: BorderRadius.circular(8)),
              child: ListTile(
                  title: Text("Money Management",
                      style: GoogleFonts.nunito(
                          textStyle: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.white.withOpacity(0.9)))),
                  trailing: (money[1] - money[0] == 0)
                      ? Icon(Icons.task_alt,
                          color: Colors.white.withOpacity(0.9))
                      : Text('${money[1] - money[0]}',
                          style: GoogleFonts.nunito(
                              textStyle: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white.withOpacity(0.9))))),
            ),
          ),
          body: GridView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: (banks.length > spending.length)
                  ? banks.length
                  : spending.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 1.2,
                mainAxisSpacing: 20,
                //crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                        onTap: () {
                          (index == 0 || index == 1)
                              ? null
                              : showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                        title: Text(banks[index]),
                                        content: TextFormField(
                                            decoration: const InputDecoration(
                                              labelText: "Remaining Balance",
                                              border: OutlineInputBorder(),
                                            ),
                                            keyboardType: TextInputType.number,
                                            inputFormatters: [
                                              FilteringTextInputFormatter
                                                  .digitsOnly
                                            ],
                                            onChanged: (value) {
                                              money[index] = int.parse(value);
                                            }),
                                        actions: [
                                          ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                                setState(() {
                                                  money[index] = money[index];
                                                });
                                              },
                                              child: const Text("Done"))
                                        ]);
                                  });
                        },
                        child: Container(
                          width: 150,
                          decoration: BoxDecoration(
                              color: const Color(0xFF2D2E33),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    spreadRadius: 1,
                                    blurRadius: 3)
                              ],
                              borderRadius: BorderRadius.circular(18)),
                          child: Column(children: [
                            Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15, left: 17, right: 15),
                                  child: Text(
                                    banks[index],
                                    style: GoogleFonts.bebasNeue(
                                        color: Colors.white.withOpacity(0.65),
                                        fontSize: 38),
                                  ),
                                )),
                            if (index == 0 ||
                                index == 1 ||
                                index == 4 ||
                                index == 6 ||
                                index == 8)
                              const SizedBox(
                                height: 37,
                              )
                            else
                              const SizedBox(
                                height: 83,
                              ),
                            Align(
                                alignment: Alignment.bottomRight,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 15, right: 15),
                                  child: Text(
                                    '${money[index]}',
                                    style: GoogleFonts.oswald(
                                        color: Colors.white.withOpacity(0.65),
                                        fontSize: 35),
                                  ),
                                ))
                          ]),
                        ))
                  ],
                );
              })),
    );
  }
}
