import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TimerTaskWidget extends StatelessWidget {
  const TimerTaskWidget({
    super.key,
    required this.time,
    required this.title,
    required this.subtitle,
    required this.image,
  });
  final String time;
  final String title;
  final String subtitle;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Slidable(
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 13),
              child: Container(
                height: 76,
                width: 76,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Center(
                  child: Image.asset(
                    "assets/images/icon_delete.png",
                    height: 20,
                    width: 20,
                  ),
                ),
              ),
            ),
            Container(
              height: 76,
              width: 76,
              decoration: const BoxDecoration(
                color: Color(0xff5263fc),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Center(
                child: Image.asset(
                  "assets/images/icon_edit.png",
                  height: 20,
                  width: 20,
                ),
              ),
            ),
          ],
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 76,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Image.asset("assets/images/icon_play.png"),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  time,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const Spacer(),
                Flexible(
                  child: Text(
                    subtitle,
                    style: Theme.of(context).textTheme.bodySmall,
                    overflow: TextOverflow.ellipsis,
                    textDirection: TextDirection.rtl,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(
                  width: 10,
                ),
                Image.asset("assets/images/$image"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
