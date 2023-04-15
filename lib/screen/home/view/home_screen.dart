import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:random_user/screen/home/modal/home_modal.dart';
import 'package:random_user/screen/home/provider/home_provider.dart';
import 'package:random_user/utils/api/api_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider? hptrue, hpfalse;

  @override
  Widget build(BuildContext context) {
    hpfalse = Provider.of<HomeProvider>(context, listen: false);
    hptrue = Provider.of<HomeProvider>(context, listen: true);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Covid Cases",
            style: GoogleFonts.lora(letterSpacing: 2),
          ),
          centerTitle: true,
          backgroundColor: Color(0xff0F4C75),
          actions: [
            IconButton(
              onPressed: () {
                hpfalse!.changeindex();
              },
              icon: Icon(Icons.refresh),
            ),
          ],
        ),
        backgroundColor: Color(0xffBBE1FA),
        body: FutureBuilder(
          future: hpfalse!.apiCall(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else if (snapshot.hasData) {
              UserModal? u1 = snapshot.data;
              List<Result>? resultList = u1!.results;

              return Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Spacer(),
                    CircleAvatar(
                      backgroundImage:
                          NetworkImage("${resultList[0].picture.medium}"),
                      radius: 40,
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Container(
                        height: 400,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.lightBlue.shade50,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            width: 2,
                            color: Color(0xff0F4C75),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Spacer(),
                              Text(
                                "Name: ${resultList[0].name.title} ${resultList[0].name.first} ${resultList[0].name.last}",
                                style: GoogleFonts.lora(
                                  letterSpacing: 1,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Gender: ${resultList[0].gender}",
                                style: GoogleFonts.lora(letterSpacing: 1),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Phone No.: ${resultList[0].phone}",
                                style: GoogleFonts.lora(
                                  letterSpacing: 1,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Nationality: ${resultList[0].nat}",
                                style: GoogleFonts.lora(
                                  letterSpacing: 1,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Email: ${resultList[0].email}",
                                style: GoogleFonts.lora(
                                  letterSpacing: 1,
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                "==========Registration info=========",
                                style: GoogleFonts.lora(
                                  letterSpacing: 1,
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Text(
                                "Registrated On: ${resultList[0].registered.date}",
                                style: GoogleFonts.lora(
                                  letterSpacing: 1,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Registrated At Age: ${resultList[0].registered.age}",
                                style: GoogleFonts.lora(
                                  letterSpacing: 1,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        hpfalse!.changeindex();
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: Color(0xff0F4C75)),
                      child: Text(
                        "Refresh",
                        style: GoogleFonts.lora(letterSpacing: 1),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              );
            }
            return Center(
              child: Container(
                height: 100,
                width: 100,
                child: CircularProgressIndicator(),
              ),
            );
          },
        ),
      ),
    );
  }
}
