import 'package:chatty_ai/Constants/app_colors.dart';
import 'package:chatty_ai/Constants/icons_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomDatePicker extends StatefulWidget {
  final double width, height;
  final String title;
  final Function(DateTime? date) onChange;
  final DateTime? initialDate;
  const CustomDatePicker({
    super.key,
    required this.width,
    required this.height,
    required this.title,
    required this.onChange,
    this.initialDate,
  });

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  // Variables
  DateTime? date;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Text(
          widget.title,
          style: TextStyle(
            color: AppColors.primaryBlack,
            fontSize: widget.width * 0.04,
            fontWeight: FontWeight.w800,
          ),
        ),
        // For Spacing
        SizedBox(
          height: widget.height * 0.01,
        ),
        // Custom Date Picker UI
        InkWell(
          onTap: () async {
            // Show Date Picker Dialog
            date = await showDatePicker(
              context: context,
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
            );
            widget.onChange(date);
            setState(() {});
          },
          child: SizedBox(
            width: widget.width * 0.9,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Hint Text
                    Text(
                      widget.initialDate != null
                          ? "${widget.initialDate?.month ?? "MM"}/${widget.initialDate?.day ?? "DD"}/${widget.initialDate?.year ?? "YYYY"} "
                          : "${date?.month ?? "MM"}/${date?.day ?? "DD"}/${date?.year ?? "YYYY"} ",
                      style: TextStyle(
                        color: widget.initialDate != null || date != null
                            ? AppColors.primaryBlack
                            : AppColors.black60,
                        fontSize: date != null
                            ? widget.width * 0.04
                            : widget.width * 0.045,
                        fontWeight:
                            date != null ? FontWeight.w800 : FontWeight.w700,
                      ),
                    ),
                    // Down Arrow
                    SvgPicture.asset(IconsPath.downArrow),
                  ],
                ),
                // For Spacing
                SizedBox(
                  height: widget.height * 0.01,
                ),
                // Bottom Line
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
