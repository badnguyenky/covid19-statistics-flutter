import 'package:covid_19_tracker_app_flutter/models/expansionpanel_model.dart';
import 'package:covid_19_tracker_app_flutter/utils/myclipper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants/constant.dart';

class InfoScreen extends StatefulWidget {
  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  final List<ExpansionPanelModel> infoList = [
    ExpansionPanelModel(
        header: "Nguồn API",
        body:
            "Bộ Y Tế: http://static.pipezero.com/covid/data.json\nTrung tâm Công nghệ phòng chống dịch COVID-19 quốc gia: https://covid19.ncsc.gov.vn/api/v3/covid\nKênh Youtube VTV24: https://developers.google.com/youtube/v3"),
    ExpansionPanelModel(
        header: "Nguồn tin tức", body: "Bộ Y Tế: https://covid19.gov.vn/")
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              padding: EdgeInsets.only(top: 50),
              height: 400,
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color(0xFF3383CD),
                      Color(0xFF11249F),
                    ],
                  ),
                  image: DecorationImage(
                      image: AssetImage("assets/images/virus.png"))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          top: -50,
                          left: -50,
                          child: SvgPicture.asset(
                            "assets/icons/Coding-rafiki.svg",
                            width: 450,
                            fit: BoxFit.fitWidth,
                            alignment: Alignment.topCenter,
                          ),
                        ),
                        Positioned(
                          top: 100,
                          left: 200,
                          child: Text("Thông tin về \n ỨNG DỤNG",
                              style: kHeadingTextStyle.copyWith(
                                  color: Colors.white, fontSize: 25),
                              textAlign: TextAlign.center),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 4),
                  blurRadius: 30,
                  color: kShadowColor,
                )
              ],
            ),
            child: Column(
              children: [
                Text(
                  "NGHIÊN CỨU KỸ THUẬT LẬP TRÌNH FLUTTER VÀ XÂY DỰNG ỨNG DỤNG CHAT BOT TRẢ LỜI TÌNH HÌNH DỊCH BỆNH COVID-19",
                  style: kHeadingTextStyle,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "NGUYỄN VIẾT KỲ",
                  style: kTitleTextstyle,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "MSV: DTC175524802010010",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "GVHD: ThS. Nguyễn Thu Phương",
                  style: kTitleTextstyle,
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: infoList.length,
            itemBuilder: (context, index) => Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 30,
                    color: kShadowColor,
                  )
                ],
              ),
              child: ExpansionPanelList(
                  animationDuration: Duration(milliseconds: 500),
                  elevation: 0,
                  expansionCallback: (int item, bool isExpanded) {
                    setState(() {
                      infoList[index].isExpanded = !infoList[index].isExpanded;
                    });
                  },
                  children: [
                    ExpansionPanel(
                      canTapOnHeader: true,
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            FaIcon(FontAwesomeIcons.sourcetree),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              infoList[index].header,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        );
                      },
                      isExpanded: infoList[index].isExpanded,
                      body: Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text(
                          infoList[index].body,
                          textAlign: TextAlign.left,
                        ),
                      ),
                    )
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
