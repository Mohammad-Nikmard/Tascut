import 'package:flutter/material.dart';
import 'package:note_design/constants/constants.dart';

class TaskWidget extends StatefulWidget {
  const TaskWidget({
    super.key,
    required this.title,
    required this.subTitle,
    required this.image,
    required this.time,
    required this.doneTask,
  });
  final String title;
  final String subTitle;
  final String image;
  final String time;
  final bool doneTask;

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  bool isTapped = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: () {
          setState(() {
            isTapped = !isTapped;
          });
        },
        child: Container(
          height: 132,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 32,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Transform.scale(
                              scale: 1.2,
                              child: Checkbox(
                                value: (widget.doneTask == true)
                                    ? widget.doneTask
                                    : isTapped,
                                onChanged: (onchanged) {},
                                activeColor: MyColors.greenColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                checkColor: Colors.white,
                              ),
                            ),
                            Flexible(
                              child: Text(
                                widget.title,
                                style: const TextStyle(
                                  fontFamily: "SM",
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        child: Text(
                          widget.subTitle,
                          textDirection: TextDirection.rtl,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontFamily: "SM",
                          ),
                        ),
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TimeChip(
                            time: widget.time,
                          ),
                          const SizedBox(width: 15),
                          const EditChip(),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Image.asset("assets/images/${widget.image}"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TimeChip extends StatelessWidget {
  const TimeChip({super.key, required this.time});
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 83,
      height: 28,
      decoration: const BoxDecoration(
        color: MyColors.greenColor,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 1.5,
                ),
                Text(
                  time,
                  style: const TextStyle(
                    fontFamily: "SM",
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Image.asset(
              "assets/images/icon_time_task.png",
              height: 16,
              width: 16,
            ),
          ],
        ),
      ),
    );
  }
}

class EditChip extends StatelessWidget {
  const EditChip({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 83,
      height: 28,
      decoration: BoxDecoration(
        color: MyColors.greenColor.withOpacity(0.2),
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "ویرایش",
              style: TextStyle(
                fontFamily: "SM",
                fontSize: 12,
                color: MyColors.greenColor,
              ),
            ),
            Image.asset(
              "assets/images/icon_edit_task.png",
              height: 16,
              width: 16,
            ),
          ],
        ),
      ),
    );
  }
}
