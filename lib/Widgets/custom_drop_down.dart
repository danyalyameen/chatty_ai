import 'package:chatty_ai/Constants/app_colors.dart';
import 'package:chatty_ai/Constants/icons_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomDropDown extends StatelessWidget {
  final double width, height;
  final String title, hintText;
  final TextEditingController? controller;
  final List<String> items;
  final void Function(String? value)? selectedValue;
  const CustomDropDown(
      {super.key,
      required this.hintText,
      required this.width,
      required this.height,
      required this.selectedValue,
      required this.title,
      required this.items,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Text(
          title,
          style: TextStyle(
            color: AppColors.primaryBlack,
            fontSize: width * 0.04,
            fontWeight: FontWeight.w800,
          ),
        ),
        // Drop Down Menu
        DropdownMenu<String>(
          hintText: hintText,
          width: width * 0.9,
          textStyle: TextStyle(
            color: AppColors.primaryBlack,
            fontWeight: FontWeight.w800,
            fontSize: width * 0.045,
          ),
          controller: controller,
          trailingIcon: SvgPicture.asset(IconsPath.downArrow),
          selectedTrailingIcon: Transform.rotate(
            angle: 3.14,
            child: SvgPicture.asset(IconsPath.downArrow),
          ),
          menuStyle: MenuStyle(
            backgroundColor: WidgetStatePropertyAll(AppColors.primaryLight),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(width * 0.04),
                  bottomRight: Radius.circular(width * 0.04),
                ),
              ),
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
            hintStyle: TextStyle(
              color: AppColors.black60,
              fontSize: width * 0.045,
              fontWeight: FontWeight.w700,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.primary,
                width: width * 0.005,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.primary,
                width: width * 0.005,
              ),
            ),
          ),
          dropdownMenuEntries: items.map(
            (e) {
              return DropdownMenuEntry(
                value: e.toString(),
                label: e.toString(),
                style: ButtonStyle(
                  textStyle: WidgetStatePropertyAll(
                    TextStyle(
                      color: AppColors.primaryBlack,
                      fontWeight: FontWeight.w600,
                      fontSize: width * 0.04,
                    ),
                  ),
                ),
              );
            },
          ).toList(),
          onSelected: (value) => selectedValue!(value!),
        ),
      ],
    );
  }
}
