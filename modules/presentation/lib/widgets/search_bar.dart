import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:presentation/theme/colors.dart';

class SearchBar extends StatefulWidget {
  final TextEditingController controller;
  final Function() onPressedFilter;
  final double radius;
  final bool lightTheme;
  const SearchBar({
    Key? key,
    required this.controller,
    this.lightTheme = false,
    required this.onPressedFilter,
    this.radius = 14,
  }) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  bool hasFocus = false;

  @override
  Widget build(BuildContext context) {
    return FocusScope(
      child: Focus(
        onFocusChange: (focus) {
          setState(() {
            hasFocus = focus;
          });
        },
        child: TextFormField(
          style: const TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
          textCapitalization: TextCapitalization.sentences,
          maxLength: 70,
          controller: widget.controller,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 22,
            ),
            prefixIcon: Icon(
              Icons.search,
              color: hasFocus ? Colors.black : Colors.grey.shade500,
              size: 30,
            ),
            suffixIcon: GestureDetector(
              onTap: () => widget.onPressedFilter(),
              child: const Padding(
                padding: EdgeInsets.only(right: 5),
                child: RotatedBox(
                  quarterTurns: 3,
                  child: Icon(
                    FontAwesomeIcons.slidersH,
                    size: 25,
                    color: AppColors.black,
                  ),
                ),
              ),
            ),
            counter: const Offstage(),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
            ),
            filled: true,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
              borderSide: const BorderSide(
                width: 2,
                color: AppColors.primaryColor,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
              borderSide: const BorderSide(
                width: 2,
                color: AppColors.lightGray,
              ),
            ),
            fillColor: widget.lightTheme
                ? Colors.white
                : hasFocus
                    ? AppColors.lightGray.withOpacity(.3)
                    : AppColors.lightGray,
            hintStyle: TextStyle(
              color: AppColors.kGrey.shade400,
            ),
            hintText: "Search",
          ),
        ),
      ),
    );
  }
}
