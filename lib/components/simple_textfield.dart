import 'package:flutter/material.dart';
import 'package:login_page/utils/app_color.dart';
import 'package:login_page/utils/appstyle.dart';
import 'package:login_page/viewmodel/login_view_model.dart';
import 'package:provider/provider.dart';

class SimpleTextfield extends StatelessWidget {
  final String label;
  final String fieldName; // Unique identifier for this field
  
  const SimpleTextfield({
    super.key,
    required this.label,
    required this.fieldName, required controller,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    
    return Consumer<LoginViewModel>(
      builder: (context, provider, child) {
        final controller = provider.getController(fieldName);
        final error = provider.getError(fieldName);
        
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
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 14),
                  label: Text(label, style: Appstyle().light()),
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
                ),
              ),
              if (error != null)
                Padding(
                  padding: const EdgeInsets.only(top: 4, left: 12),
                  child: Text(
                    error,
                    style: TextStyle(
                      color: AppColor.red,
                      fontSize: 12,
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  double _getWidth(Size size) {
    if (size.width < 600) {
      // Mobile
      return size.width * 0.85;
    } else if (size.width < 768) {
      // Small tablet
      return size.width * 0.7;
    } else if (size.width < 1024) {
      // Tablet
      return size.width * 0.6;
    } else if (size.width < 1440) {
      // Laptop
      return size.width * 0.45;
    } else {
      // Desktop
      return size.width * 0.4;
    }
  }
}
