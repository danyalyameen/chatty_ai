import 'package:chatty_ai/Constants/app_colors.dart';
import 'package:chatty_ai/Constants/icons_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomDatePicker extends StatefulWidget {
  final double width, height;
  final String title;
  const CustomDatePicker({
    super.key,
    required this.width,
    required this.height,
    required this.title,
  });

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime? date;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(
            color: AppColors.primaryBlack,
            fontSize: widget.width * 0.04,
            fontWeight: FontWeight.w800,
          ),
        ),
        SizedBox(
          height: widget.height * 0.01,
        ),
        InkWell(
          onTap: () async {
            date = await showDatePicker(
              context: context,
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
            );
            setState(() {});
          },
          child: SizedBox(
            width: widget.width * 0.9,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${date?.month ?? "MM"}/${date?.day ?? "DD"}/${date?.year ?? "YYYY"} ",
                      style: TextStyle(
                        color: date != null
                            ? AppColors.primaryBlack
                            : AppColors.black60,
                        fontSize: date != null
                            ? widget.width * 0.04
                            : widget.width * 0.045,
                        fontWeight:
                            date != null ? FontWeight.w800 : FontWeight.w700,
                      ),
                    ),
                    SvgPicture.asset(IconsPath.downArrow),
                  ],
                ),
                SizedBox(
                  height: widget.height * 0.01,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: AppColors.primary,
                        width: widget.width * 0.005,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
