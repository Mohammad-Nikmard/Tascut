import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:note_design/constants/constants.dart';
import 'package:note_design/ui/timeline.dart';
import 'package:note_design/widgets/task_widget.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: MyColors.greenColor,
        elevation: 4,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(40),
          ),
        ),
        child: Image.asset("assets/images/icon_add.png"),
      ),
      backgroundColor: MyColors.greyBackgroundColor.withOpacity(0.5),
      body: const SafeArea(
        child: CustomScrollView(
          slivers: [
            Header(),
            CalendarSection(),
            TodayTask(),
            DoneTasks(),
          ],
        ),
      ),
    );
  }
}

class DoneTasks extends StatelessWidget {
  const DoneTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 32,
              decoration: const BoxDecoration(
                color: MyColors.whiteColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "assets/images/icon_arrow_down.png",
                      height: 8,
                      width: 14,
                    ),
                    Text(
                      "تسک های انجام شده",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const SizedBox(
                      height: 1,
                      width: 1,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                const TaskWidget(
                  doneTask: true,
                  title: "ورزش",
                  subTitle: "انجام ورزش صبحگاهی",
                  image: "workout.png",
                  time: "8:00",
                ),
                Container(
                  height: 132,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: MyColors.greyColor.withOpacity(0.3),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                const TaskWidget(
                  doneTask: true,
                  title: "قرار کاری",
                  subTitle: "هماهنگی برنامه های این هفته",
                  image: "work_meeting.png",
                  time: "9:00",
                ),
                Container(
                  height: 132,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: MyColors.greyColor.withOpacity(0.3),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TodayTask extends StatelessWidget {
  const TodayTask({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            TaskWidget(
              doneTask: false,
              title: "امور بانکی",
              subTitle: "انجام امور بانکی خودم",
              image: "banking.png",
              time: "10:00",
            ),
            TaskWidget(
              doneTask: false,
              title: "آرامش",
              subTitle: "انجام کارای مورد علاقم",
              image: "meditate.png",
              time: "5:00",
            ),
          ],
        ),
      ),
    );
  }
}

class CalendarSection extends StatefulWidget {
  const CalendarSection({super.key});

  @override
  State<CalendarSection> createState() => _CalendarSectionState();
}

class _CalendarSectionState extends State<CalendarSection> {
  int selectedIndex = 0;
  List<String> days = [
    "جمعه",
    "شنبه",
    "یکشنبه",
    "دوشبنه",
    "سه شنبه",
  ];
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: SizedBox(
                height: 95,
                child: ListView.builder(
                  itemCount: days.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Container(
                          height: 87,
                          width: 75,
                          decoration: ShapeDecoration(
                            color: (selectedIndex == index)
                                ? MyColors.greenColor
                                : MyColors.lightGreenColor,
                            shadows: [
                              BoxShadow(
                                offset: const Offset(0, 10),
                                spreadRadius: -10,
                                blurRadius: 25,
                                color: (selectedIndex == index)
                                    ? MyColors.greenColor
                                    : MyColors.lightGreenColor,
                              ),
                            ],
                            shape: const ContinuousRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(35),
                              ),
                            ),
                          ),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                days[index],
                                style: TextStyle(
                                  fontFamily: "SM",
                                  fontSize: 14,
                                  color: (selectedIndex == index)
                                      ? Colors.white
                                      : MyColors.greenColor,
                                ),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                "${index + 19}",
                                style: TextStyle(
                                  fontFamily: "SB",
                                  fontSize: 20,
                                  color: (selectedIndex == index)
                                      ? Colors.white
                                      : MyColors.greenColor,
                                ),
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              Container(
                                height: 5,
                                width: 5,
                                decoration: BoxDecoration(
                                  color: (selectedIndex == index)
                                      ? Colors.white
                                      : MyColors.greenColor,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const TimeLine(),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<double> notifier = ValueNotifier(0);
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
          children: [
            Container(
              height: 56,
              width: 56,
              decoration: const ShapeDecoration(
                color: MyColors.greenColor,
                shadows: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 25,
                    spreadRadius: -10,
                    color: MyColors.greenColor,
                  ),
                ],
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(45),
                  ),
                ),
              ),
              child: Center(
                child: Image.asset(
                  "assets/images/icon_calendar_white.png",
                  height: 26,
                  width: 26,
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            DashedCircularProgressBar(
              width: 56,
              height: 56,
              animationCurve: Curves.decelerate,
              valueNotifier: notifier,
              progress: 20,
              maxProgress: 100,
              corners: StrokeCap.butt,
              foregroundColor: MyColors.greenColor,
              backgroundColor: MyColors.lightGreenColor,
              foregroundStrokeWidth: 6,
              backgroundStrokeWidth: 6,
              animation: true,
              child: Center(
                child: ValueListenableBuilder(
                  valueListenable: notifier,
                  builder: (_, double value, __) => Text(
                    '%${value.toInt()}',
                    style: const TextStyle(
                      fontFamily: "SB",
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  "20 بهمن",
                  style: TextStyle(
                    fontFamily: "SB",
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                  textDirection: TextDirection.rtl,
                ),
                const SizedBox(height: 5),
                Text(
                  "2 تسک فعال در امروز",
                  style: Theme.of(context).textTheme.bodySmall,
                  textDirection: TextDirection.rtl,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
