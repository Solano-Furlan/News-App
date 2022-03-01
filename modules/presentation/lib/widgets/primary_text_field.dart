import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:presentation/theme/colors.dart';

class PrimaryTextField extends StatefulWidget {
  final String hint;
  final String? label;
  final String initVal;
  final TextInputType keyboardType;
  final bool isRequired;
  final bool isEmail;
  final double radius;
  final bool whiteBackground;
  final bool isPassword;
  final IconData? trailingIcon;
  final Widget? prefixIcon;
  final String? toMatch;
  final bool autofocus;
  final int maxLength;
  final Function(String)? onChanged;
  final Function()? onPressedTailingIcon;

  const PrimaryTextField({
    Key? key,
    required this.hint,
    this.label,
    this.autofocus = false,
    this.whiteBackground = false,
    this.keyboardType = TextInputType.text,
    required this.initVal,
    this.onChanged,
    this.toMatch,
    this.radius = 12,
    this.trailingIcon,
    this.prefixIcon,
    this.maxLength = 70,
    this.isPassword = false,
    this.isEmail = false,
    this.isRequired = true,
    this.onPressedTailingIcon,
  }) : super(key: key);

  @override
  _PrimaryTextFieldState createState() => _PrimaryTextFieldState();
}

class _PrimaryTextFieldState extends State<PrimaryTextField> {
  String currentValue = "";
  bool _isPassword = false;

  @override
  void initState() {
    currentValue = widget.initVal;
    _isPassword = widget.isPassword;
    super.initState();
  }

  bool hasFocus = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label ?? "",
          style: TextStyle(
            color:
                hasFocus ? AppColors.primary_color : AppColors.kGrey.shade700,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: double.infinity,
          child: FocusScope(
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
                initialValue: widget.initVal,
                keyboardType: widget.keyboardType,
                textCapitalization: widget.isEmail
                    ? TextCapitalization.none
                    : TextCapitalization.sentences,
                maxLength: widget.maxLength,
                onChanged: (val) {
                  if (widget.onChanged != null) {
                    setState(() {
                      currentValue = val;
                    });
                    widget.onChanged!(val.trim());
                  }
                },
                validator: (value) {
                  if (value != null) {
                    value = value.trim();
                    if (value.isEmpty && widget.isRequired) {
                      return 'This field should not be empty';
                    }
                    if (widget.isEmail && !EmailValidator.validate(value)) {
                      return 'Invalid email';
                    }
                    if (widget.isPassword && value.length < 8) {
                      return 'Short password (8 characters minimum)';
                    }
                    if (widget.toMatch != null && widget.toMatch != value) {
                      return 'The passwords don\'t match';
                    }
                  }
                  return null;
                },
                obscureText: _isPassword,
                autofocus: widget.autofocus,
                decoration: InputDecoration(
                  errorStyle: const TextStyle(
                    height: 1.3,
                    fontSize: 14,
                    color: AppColors.red,
                  ),
                  labelStyle: const TextStyle(
                    fontSize: 18,
                    color: Color.fromRGBO(97, 202, 255, .8),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(widget.radius),
                    ),
                    borderSide: const BorderSide(
                      width: 1,
                      color: AppColors.red,
                    ),
                  ),
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 22,
                  ),
                  prefixIcon: widget.prefixIcon,
                  suffixIcon: widget.isPassword && currentValue.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _isPassword = !_isPassword;
                              });
                            },
                            child: Container(
                              color: Colors.transparent,
                              child: Icon(
                                !_isPassword
                                    ? Icons.visibility_rounded
                                    : Icons.visibility_off_rounded,
                                size: 28,
                                color: AppColors.kGrey.shade300,
                              ),
                            ),
                          ),
                        )
                      : widget.trailingIcon != null
                          ? GestureDetector(
                              onTap: () => widget.onPressedTailingIcon != null
                                  ? widget.onPressedTailingIcon!()
                                  : null,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 7),
                                child: Icon(
                                  widget.trailingIcon,
                                  size: 25,
                                  color: AppColors.kGrey.shade300,
                                ),
                              ),
                            )
                          : null,
                  counter: const Offstage(),
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(widget.radius)),
                  ),
                  filled: true,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  focusedBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(widget.radius)),
                    borderSide: const BorderSide(
                      width: 2,
                      color: AppColors.primary_color,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(widget.radius)),
                    borderSide: const BorderSide(
                      width: 2,
                      color: AppColors.light_gray,
                    ),
                  ),
                  fillColor: widget.whiteBackground
                      ? Colors.white
                      : hasFocus
                          ? Colors.white
                          : currentValue.isNotEmpty
                              ? Colors.white
                              : AppColors.light_gray,
                  hintStyle: TextStyle(
                    color: AppColors.kGrey.shade400,
                  ),
                  hintText: widget.hint,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
