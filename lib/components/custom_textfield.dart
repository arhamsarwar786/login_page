import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:login_page/utils/app_color.dart';
import 'package:login_page/utils/appstyle.dart';
import 'package:login_page/viewmodel/login_view_model.dart';

class CustomTextfields extends StatefulWidget {
  final String label;
  final bool eye;
  final String? fieldName; // Add fieldName parameter for validation
  
  const CustomTextfields({
    super.key,
    required this.label,
    required this.eye,
    this.fieldName, // Optional fieldName
  });

  @override
  State<CustomTextfields> createState() => _CustomTextfieldsState();
}

class _CustomTextfieldsState extends State<CustomTextfields> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    if (widget.fieldName != null) {
      return Consumer<LoginViewModel>(
        builder: (context, provider, child) {
          final controller = provider.getController(widget.fieldName!);
          final error = provider.getError(widget.fieldName!);

          return SizedBox(
            width: _getWidth(size),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: controller,
                  style: Appstyle().bold1(context),
                  cursorColor: AppColor.white,
                  obscureText: widget.eye ? obscureText : false,
                  minLines: 1,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                    label: Text(widget.label, style: Appstyle().light()),
                    suffixIcon: widget.eye
                        ? IconButton(
                            onPressed: () {
                              setState(() {
                                obscureText = !obscureText;
                              });
                            },
                            icon: Icon(
                              obscureText ? Icons.visibility_off : Icons.visibility,
                              color: AppColor.grey,
                            ),
                          )
                        : null,
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: error != null ? AppColor.red : AppColor.grey,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: error != null ? AppColor.red : AppColor.darkgrey,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColor.red),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColor.red, width: 1.5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                if (error != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 6, left: 12),
                    child: Text(
                      error,
                      style: TextStyle(
                        color: AppColor.red,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      );
    } else {
      return SizedBox(
        width: _getWidth(size),
        child: TextFormField(
          style: Appstyle().bold1(context),
          cursorColor: AppColor.white,
          obscureText: widget.eye ? obscureText : false,
          minLines: 1,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            label: Text(widget.label, style: Appstyle().light()),
            suffixIcon: widget.eye
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                    icon: Icon(
                      obscureText ? Icons.visibility_off : Icons.visibility,
                      color: AppColor.grey,
                    ),
                  )
                : null,
            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.darkgrey, width: 1.5),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      );
    }
  }

  double _getWidth(Size size) {
    if (size.width < 600) {
      return size.width * 0.85;
    } else if (size.width < 768) {
      return size.width * 0.7;
    } else if (size.width < 1024) {
      return size.width * 0.6;
    } else if (size.width < 1440) {
      return size.width * 0.45;
    } else {
      return size.width * 0.4;
    }
  }
  
}