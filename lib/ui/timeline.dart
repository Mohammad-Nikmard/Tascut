import 'package:flutter/material.dart';
import 'package:note_design/constants/constants.dart';

class TimeLine extends StatelessWidget {
  const TimeLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: const Alignment(0.190, 0.4),
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Container(
                height: 3,
                width: MediaQuery.of(context).size.width,
                color: MyColors.lightGreenColor,
              ),
            ),
            Container(
              height: 10,
              width: 10,
              decoration: const BoxDecoration(
                color: MyColors.greenColor,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: SizedBox(
            height: 38,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Padding(
                padding: const EdgeInsets.only(right: 15),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "همه",
                        style: TextStyle(
                          fontFamily: "SM",
                          fontSize: 16,
                          color: MyColors.greyColor,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "8:30-10",
                        style: TextStyle(
                          fontFamily: "SM",
                          fontSize: 16,
                          color: MyColors.greyColor,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "10-12",
                        style: TextStyle(
                          fontFamily: "SM",
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "12-13:30",
                        style: TextStyle(
                          fontFamily: "SM",
                          fontSize: 16,
                          color: MyColors.greyColor,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "14-16:20",
                        style: TextStyle(
                          fontFamily: "SM",
                          fontSize: 16,
                          color: MyColors.greyColor,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "18-19:30",
                        style: TextStyle(
                          fontFamily: "SM",
                          fontSize: 16,
                          color: MyColors.greyColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
