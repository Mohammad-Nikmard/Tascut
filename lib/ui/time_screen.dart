import 'package:circular_seek_bar/circular_seek_bar.dart';
import 'package:flutter/material.dart';
import 'package:note_design/constants/constants.dart';
import 'package:note_design/widgets/timer_task_widget.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class TimeScreen extends StatefulWidget {
  const TimeScreen({super.key});

  @override
  State<TimeScreen> createState() => _TimeScreenState();
}

class _TimeScreenState extends State<TimeScreen> with TickerProviderStateMixin {
  TabController? _controller;
  @override
  void initState() {
    _controller = TabController(length: 2, vsync: this);
    _controller!.index = 1;
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Image.asset(
                "assets/images/icon_add_task.png",
                height: 25,
                width: 25,
              ),
            ),
            Image.asset(
              "assets/images/icon_task_setting.png",
              height: 25,
              width: 25,
            ),
          ],
        ),
        leadingWidth: 85,
        actions: [
          TabBar(
            indicatorWeight: 2,
            dividerColor: Colors.transparent,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorPadding: const EdgeInsets.symmetric(horizontal: 10),
            labelColor: Colors.black,
            labelStyle: Theme.of(context).textTheme.titleMedium,
            unselectedLabelColor: MyColors.greyColor,
            indicatorColor: MyColors.greenColor,
            unselectedLabelStyle: Theme.of(context).textTheme.titleMedium,
            isScrollable: true,
            controller: _controller,
            tabs: const [
              Tab(
                text: "زمان شمار",
              ),
              Tab(
                text: "شمارنده معکوس",
              ),
            ],
          ),
        ],
      ),
      backgroundColor: MyColors.greyBackgroundColor.withOpacity(0.5),
      body: SafeArea(
        child: TabBarView(
          controller: _controller,
          children: const [
            Column(),
            ReverseTimerPage(),
          ],
        ),
      ),
    );
  }
}

class ReverseTimerPage extends StatelessWidget {
  const ReverseTimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    const CircularSeekBar(
                      trackColor: MyColors.lightGreenColor,
                      width: double.infinity,
                      height: 250,
                      progress: 60,
                      barWidth: 8,
                      startAngle: 180,
                      sweepAngle: 360,
                      progressGradientColors: [
                        MyColors.lightGreenColor,
                        MyColors.greenColor
                      ],
                      strokeCap: StrokeCap.round,
                      progressColor: MyColors.greenColor,
                      innerThumbRadius: 8.5,
                      innerThumbStrokeWidth: 8,
                      innerThumbColor: MyColors.greenColor,
                      outerThumbRadius: 8.5,
                      outerThumbStrokeWidth: 5,
                      outerThumbColor: MyColors.whiteColor,
                      animation: true,
                    ),
                    CircularStepProgressIndicator(
                      stepSize: 4,
                      unselectedColor: Colors.transparent,
                      selectedColor: MyColors.greenColor,
                      height: 190,
                      width: 190,
                      totalSteps: 23,
                      currentStep: 14,
                      roundedCap: (_, isSelected) => isSelected,
                    ),
                    Column(
                      children: [
                        const Text(
                          "توقف",
                          style: TextStyle(
                            fontFamily: "SB",
                            fontSize: 24,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "04:33",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 107,
                      height: 36,
                      decoration: const BoxDecoration(
                        color: MyColors.greenColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          "ادامه",
                          style: TextStyle(
                            fontFamily: "SB",
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 107,
                      height: 36,
                      decoration: const BoxDecoration(
                        color: MyColors.lightGreenColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          "پایان",
                          style: TextStyle(
                            fontFamily: "SB",
                            color: MyColors.greenColor,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  "شمارنده های ذخیره",
                  style: TextStyle(
                    fontFamily: "SB",
                    color: MyColors.greyColor,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const TimerTaskWidget(
                  time: "00:25:00",
                  title: "کارآموزی",
                  subtitle: "جلسه با خانم رضایی",
                  image: "icon_emoji3.png",
                ),
                const TimerTaskWidget(
                  time: "01:00:00",
                  title: "جلسه",
                  subtitle: "هماهنگی کار های این هفته",
                  image: "icon_emoji2.png",
                ),
                const TimerTaskWidget(
                  time: "00:45:00",
                  title: "لایو",
                  subtitle: "دیدن لایو آموزشی",
                  image: "icon_emoji1.png",
                ),
                const TimerTaskWidget(
                  time: "03:00:00",
                  title: "کار زیاد",
                  subtitle: "انجام تسک های فلاتر",
                  image: "icon_emoji2.png",
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
