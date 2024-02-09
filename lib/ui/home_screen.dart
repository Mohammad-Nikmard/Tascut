import 'package:flutter/material.dart';
import 'package:note_design/constants/constants.dart';
import 'package:note_design/ui/timeline.dart';
import 'package:note_design/widgets/task_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.greyBackgroundColor.withOpacity(0.5),
      body: const SafeArea(
        child: CustomScrollView(
          slivers: [
            Header(),
            SearchBox(),
            Category(),
            TodayTask(),
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
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "مشاهده بیشتر",
                  style: TextStyle(
                    fontFamily: "SM",
                    fontSize: 14,
                    color: MyColors.greenColor,
                  ),
                ),
                Text(
                  "تسک های امروز",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const TimeLine(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TaskWidget(
              doneTask: false,
              title: "آموزش فلاتر",
              subTitle: "دیدن ویدیو های فلاتر",
              image: "programming.png",
              time: "11:00",
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TaskWidget(
              doneTask: false,
              title: "گردش",
              subTitle: "با دوستان بیرون رفتن",
              image: "social_frends.png",
              time: "3:00",
            ),
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "مشاهده بیشتر",
                  style: TextStyle(
                    fontFamily: "SM",
                    fontSize: 14,
                    color: MyColors.greenColor,
                  ),
                ),
                Text(
                  "دسته بندی",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 220,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Image.asset(
                    "assets/images/shop_image.png",
                  ),
                  Image.asset(
                    "assets/images/sport_image.png",
                  ),
                  Image.asset(
                    "assets/images/learn_image.png",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 46,
          decoration: const BoxDecoration(
            color: MyColors.whiteColor,
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Image.asset(
                  "assets/images/icon_filter.png",
                  height: 25,
                  width: 25,
                ),
                const Spacer(),
                Expanded(
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextField(
                      style: const TextStyle(
                        fontFamily: "SM",
                        fontSize: 16,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        hintText: "جستجوی تسکات ...",
                        contentPadding: const EdgeInsets.only(top: 15),
                        hintStyle: Theme.of(context).textTheme.bodySmall,
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(
                            style: BorderStyle.none,
                            width: 0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Image.asset(
                  "assets/images/icon_search.png",
                  height: 25,
                  width: 25,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Row(
            children: [
              Image.asset('assets/images/icon_emoji1.png'),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        "سلام , ",
                        style: TextStyle(
                          fontFamily: "SB",
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      const Text(
                        "محمد ",
                        style: TextStyle(
                          fontFamily: "SB",
                          fontSize: 16,
                          color: MyColors.greenColor,
                        ),
                      ),
                      Image.asset('assets/images/👋.png'),
                    ],
                  ),
                  Text(
                    "20 بهمن",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              const Spacer(),
              Container(
                height: 26,
                decoration: const BoxDecoration(
                  color: MyColors.lightGreenColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    "20 تسک فعال",
                    style: TextStyle(
                      fontFamily: "SB",
                      fontWeight: FontWeight.w900,
                      fontSize: 12,
                      color: MyColors.greenColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
