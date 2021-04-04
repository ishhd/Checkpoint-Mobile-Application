import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tester/Screens/Administrator/DoctorsCourse.dart';
import 'package:tester/Screens/Administrator/homepage_administrator.dart';
import 'package:tester/Screens/bloc.navigation_bloc/navigation_bloc.dart';

class SchedulesAdmin extends StatefulWidget with NavigationStates {
  State<StatefulWidget> createState() {
    return SchedulesAdminState();
  }
}

class SchedulesAdminState extends State<SchedulesAdmin> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xFFD9D9D9),
          title: Text(
            "Schedules",
            style: TextStyle(
              fontSize: 30,
              color: Color(0xFF525151),
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              runApp(homePageAdministrator());
            },
            color: Color(0xFF525151),
            iconSize: 20,
            padding: EdgeInsets.only(left: 20),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  getTimeWidget("        ", 1, Colors.white),
                  getTimeWidget("8-9 am  ", 1, Color(0xffbfbfbf)),
                  getTimeWidget("9-10 am ", 1, Color(0xffbfbfbf)),
                  getTimeWidget("10-11 am", 1, Color(0xffbfbfbf)),
                  getTimeWidget("11-12 am", 1, Color(0xffbfbfbf)),
                  getTimeWidget("12-1 pm ", 1, Color(0xffbfbfbf)),
                  getTimeWidget("1-2 pm  ", 1, Color(0xffbfbfbf)),
                  getTimeWidget("2-3 pm  ", 1, Color(0xffbfbfbf)),
                  getTimeWidget("3-4 pm  ", 1, Color(0xffbfbfbf)),
                  getTimeWidget("4-5 pm  ", 1, Color(0xffbfbfbf)),
                  getTimeWidget("5-6 pm  ", 1, Color(0xffbfbfbf)),
                  getTimeWidget("6-7 pm  ", 1, Color(0xffbfbfbf)),
                  getTimeWidget("7-8 pm  ", 1, Color(0xffbfbfbf)),
                  getTimeWidget("8-9 pm  ", 1, Color(0xffbfbfbf)),
                  getTimeWidget("7-9 pm  ", 2, Color(0xffbfbfbf)),
                ],
              ),
            ),
            // sun
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  getTimeWidget("Sun", 1, Colors.white),
                  Expanded(
                    flex: 15,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              getTimeWidget(
                                "Bldg 11/2nd F1 (24 clinics)",
                                3,
                                Color(0xffa7a2d8),
                                header: "OMR 511 GP C",
                                onTap: () {
                                  runApp(
                                    DoctorsCourse(
                                      color: Color(0xffa7a2d8),
                                      doctors: [
                                        "Dr Mohamed AlGhamdi",
                                        "Dr Mazen Almasri",
                                        "Prof Amr Bayoumi",
                                        "Dr Maha Shawki",
                                        "Dr Khalid Moustafa",
                                        "Dr Ibrahim Sankour",
                                      ],
                                    ),
                                  );
                                },
                              ),
                              getTimeWidget("", 1, Colors.white),
                              getTimeWidget("", 3, Colors.white),
                              getTimeWidget("", 6, Colors.white),
                              getTimeWidget("", 2, Colors.white),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              getTimeWidget(
                                "Preclinical",
                                2,
                                Color(0xff91d051),
                                header: "OMR 312 M1/2",
                                onTap: () {
                                  runApp(
                                    DoctorsCourse(
                                      color: Color(0xff91d051),
                                      doctors: [
                                        "Dr Ghassan Darwish",
                                        "Dr Samira Osailan",
                                        "Prof ElSEheimy",
                                        "Dr Nadia AHazmi",
                                        "Dr Basem Jamal",
                                        "Dr Eman AlFayez",
                                      ],
                                    ),
                                  );
                                },
                              ),
                              getTimeWidget("", 2, Colors.white),
                              getTimeWidget("", 3, Colors.white),
                              getTimeWidget("", 4, Colors.white),
                              getTimeWidget("", 2, Colors.white),
                              getTimeWidget(
                                "practical lab",
                                2,
                                Color(0xfff8cbac),
                                header: "SURD 401 M",
                                onTap: () {
                                  runApp(
                                    DoctorsCourse(
                                      color: Color(0xfff8cbac),
                                      doctors: [
                                        "Dr Haitham Attiyah",
                                        "Dr Samira Osailan",
                                        "Prof ElSeheimy",
                                        "Dr Ibrahim Sankour",
                                        "Dr Raed Khayyat",
                                        "Dr Moyassara Samman",
                                        "Dr Sollafa Ayoub",
                                        "Dr Rawan Ghadi",
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            // mon
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  getTimeWidget("Mon", 1, Colors.white),
                  Expanded(
                    flex: 15,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              getTimeWidget("", 2, Colors.white),
                              getTimeWidget(
                                "Preclinical",
                                2,
                                Color(0xff91d051),
                                header: "OMR 312 M3/4",
                                onTap: () {
                                  runApp(
                                    DoctorsCourse(
                                      color: Color(0xff91d051),
                                      doctors: [
                                        "Dr Ghassan Darwish",
                                        "Dr Nadia AlHazmi",
                                        "Dr Firas Bafageeh",
                                        "Dr Samira Osailan",
                                        "Dr Mazen Almasri",
                                        "Dr Samar AlGhamdi",
                                        "Dr Eman AlFayez",
                                      ],
                                    ),
                                  );
                                },
                              ),
                              getTimeWidget("", 3, Colors.white),
                              getTimeWidget("", 4, Colors.white),
                              getTimeWidget("", 2, Colors.white),
                              getTimeWidget(
                                "practical lab",
                                2,
                                Color(0xfff8cbac),
                                header: "SURD 401 F",
                                onTap: () {
                                  runApp(
                                    DoctorsCourse(
                                      color: Color(0xfff8cbac),
                                      doctors: [
                                        "Dr Haitham Attiyah",
                                        "Dr Samira Osailan",
                                        "Prof ElSeheimy",
                                        "Dr Ibrahim Sankour",
                                        "Dr Raed Khayyat",
                                        "Dr Moyassara Samman",
                                        "Dr Sollafa Ayoub",
                                        "Dr Rawan Ghadi",
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              getTimeWidget(
                                "Bldg 11/2nd F1 (19 clinics)",
                                3,
                                Color(0xff8eaadc),
                                header: "OMR 611 GP B",
                                onTap: () {
                                  runApp(
                                    DoctorsCourse(
                                      color: Color(0xff8eaadc),
                                      doctors: [
                                        "Dr Lojain Bassyouni",
                                        "Prof Amr Bayoumi",
                                        "Prof Maha Shawki",
                                        "Dr Khalid Moustafa",
                                        "Dr Hisham Komo",
                                        "Dr Raed Khayyat",
                                      ],
                                    ),
                                  );
                                },
                              ),
                              getTimeWidget("", 1, Colors.white),
                              getTimeWidget("", 3, Colors.white),
                              getTimeWidget("", 2, Colors.white),
                              getTimeWidget(
                                "Bldg 11/2nd F1 (24 clinics)",
                                3,
                                Color(0xffa7a2d8),
                                header: "OMR 511 GP B",
                                onTap: () {
                                  runApp(
                                    DoctorsCourse(
                                      color: Color(0xffa7a2d8),
                                      doctors: [
                                        "Dr Mazen Almasri",
                                        "Dr Haitham Attiyah",
                                        "Prof M ElSeheimy",
                                        "Dr Maha Shawki",
                                        "Prof Amr Bayoumi",
                                        "Prof Hala Mokhtar",
                                        "Dr Raed Khayyat",
                                      ],
                                    ),
                                  );
                                },
                              ),
                              getTimeWidget("", 1, Colors.white),
                              getTimeWidget("", 2, Colors.white),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            // tus
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  getTimeWidget("Tues", 1, Colors.white),
                  getTimeWidget("", 3, Colors.white),
                  getTimeWidget("", 1, Colors.white),
                  getTimeWidget("", 3, Colors.white),
                  getTimeWidget("", 1, Colors.white),
                  getTimeWidget(
                    "Bldg 11/2nd F1 (19 clinics)",
                    3,
                    Color(0xff8eaadc),
                    header: "OMR 611 GP A",
                    onTap: () {
                      runApp(
                        DoctorsCourse(
                          color: Color(0xff8eaadc),
                          doctors: [
                            "Dr Lojain Bassyouni",
                            "Dr Ahmed Jan",
                            "Dr Mohamed AlGhamdi",
                            "Dr Mohamed Nadershah",
                            "Dr Basem Jamal",
                            "Dr Maisa Al-Sebaei",
                            "Dr Hisham Komo",
                            "Dr Ibrahim Sankour",
                          ],
                        ),
                      );
                    },
                  ),
                  getTimeWidget("", 2, Colors.white),
                  getTimeWidget("", 2, Colors.white),
                ],
              ),
            ),
            // wed
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  getTimeWidget("Wed", 1, Colors.white),
                  Expanded(
                    flex: 15,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              getTimeWidget("", 3, Colors.white),
                              getTimeWidget("", 1, Colors.white),
                              getTimeWidget(
                                "Preclinical",
                                2,
                                Color(0xff91d051),
                                header: "OMR 312 F1/F2",
                                onTap: () {
                                  runApp(
                                    DoctorsCourse(
                                      color: Color(0xff91d051),
                                      doctors: [
                                        "Dr Ghassan Darwish",
                                        "Dr Nadia AlHazmi",
                                        "Dr Firas Bafageeh",
                                        "Dr Samira Osailan",
                                      ],
                                    ),
                                  );
                                },
                              ),
                              getTimeWidget("", 1, Colors.white),
                              getTimeWidget("", 3, Colors.white),
                              getTimeWidget("", 3, Colors.white),
                              getTimeWidget("", 2, Colors.white),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              getTimeWidget(
                                "Bldg 11/2nd F1 (19 clinics)",
                                3,
                                Color(0xff8eaadc),
                                header: "OMR 611 GP C",
                                onTap: () {
                                  runApp(
                                    DoctorsCourse(
                                      color: Color(0xff8eaadc),
                                      doctors: [
                                        "Dr Ahmed Jan",
                                        "Dr Hala Mokhtar",
                                        "Dr Ghassan Darwish",
                                        "Prof ElSeheimy",
                                        "Dr Raed Khayyat",
                                        "Dr Lojain Bassyouni",
                                      ],
                                    ),
                                  );
                                },
                              ),
                              getTimeWidget("", 1, Colors.white),
                              getTimeWidget(
                                "Bldg 11/2nd F1 (19 clinics)",
                                3,
                                Color(0xff8eaadc),
                                header: "OMR 611 GP D",
                                onTap: () {
                                  runApp(
                                    DoctorsCourse(
                                      color: Color(0xff8eaadc),
                                      doctors: [
                                        "Dr Mohammed AlGhamdi",
                                        "Dr Ahmed Jan",
                                        "Dr Maha Sahwki",
                                        "Dr Khalid Moustafa",
                                        "Dr Raed Khayyat",
                                      ],
                                    ),
                                  );
                                },
                              ),
                              getTimeWidget("", 3, Colors.white),
                              getTimeWidget("", 5, Colors.white),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            // thurs
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  getTimeWidget("Thurs", 1, Colors.white),
                  Expanded(
                    flex: 15,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              getTimeWidget(
                                "Bldg 11/2nd F1 (24 clinics)",
                                3,
                                Color(0xffa7a2d8),
                                header: "OMR 511 GP D",
                                onTap: () {
                                  runApp(
                                    DoctorsCourse(
                                      color: Color(0xffa7a2d8),
                                      doctors: [
                                        "Dr Ahmed Jan",
                                        "Prof Amr Bayoumi",
                                        "Dr Haitham Attiyah",
                                        "Prof Hala Mokhtar",
                                        "Dr Khalid Moustafa",
                                        "Dr Ibrahim Sankour",
                                      ],
                                    ),
                                  );
                                },
                              ),
                              getTimeWidget("", 1, Colors.white),
                              getTimeWidget(
                                "Bldg 11/2nd F1 (24 clinics)",
                                3,
                                Color(0xffa7a2d8),
                                header: "OMR 511 GP A",
                                onTap: () {
                                  runApp(
                                    DoctorsCourse(
                                      color: Color(0xffa7a2d8),
                                      doctors: [
                                        "Dr Mazen Almasri",
                                        "Dr Basem Jamal",
                                        "Dr Mohamed Nadershah",
                                        "Dr Haitham Attiyah",
                                        "Dr Samira Osailan",
                                        "Dr Ibrahim Sankour",
                                      ],
                                    ),
                                  );
                                },
                              ),
                              getTimeWidget("", 3, Colors.white),
                              getTimeWidget("", 5, Colors.white),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              getTimeWidget("", 2, Colors.white),
                              getTimeWidget(
                                "Preclinical",
                                2,
                                Color(0xff91d051),
                                header: "OMR 312 F1/F2",
                                onTap: () {
                                  runApp(
                                    DoctorsCourse(
                                      color: Color(0xff91d051),
                                      doctors: [
                                        "Dr Ghassan Darwish",
                                        "Dr Maisa AlSebaei",
                                        "Dr Basem Jamal",
                                        "Dr Mohamed Nadershah",
                                      ],
                                    ),
                                  );
                                },
                              ),
                              getTimeWidget("", 3, Colors.white),
                              getTimeWidget("", 3, Colors.white),
                              getTimeWidget("", 5, Colors.white),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  getTimeWidget(String time, int flex, Color color, {String header, onTap}) {
    return Expanded(
      flex: flex,
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
            ),
            color: color,
          ),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              header == null
                  ? SizedBox.shrink()
                  : Center(
                      child: AutoSizeText(
                        header,
                        minFontSize: 5,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                      ),
                    ),
              Center(
                child: AutoSizeText(
                  time,
                  minFontSize: 2,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                  maxLines: 1,
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
