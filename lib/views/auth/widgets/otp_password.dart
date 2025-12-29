import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:login_page/utils/app_color.dart';
import 'package:login_page/utils/app_text.dart';
import 'package:login_page/utils/appstyle.dart';
import 'package:login_page/viewmodel/login_view_model.dart';
import 'package:provider/provider.dart';

class OtpPassword extends StatefulWidget {
  const OtpPassword({super.key});

  @override
  State<OtpPassword> createState() => _OtpPasswordState();
}

class _OtpPasswordState extends State<OtpPassword> {
  final List<FocusNode> focusNodes = List.generate(6, (index) => FocusNode());
  final List<TextEditingController> controllers = List.generate(6, (index) => TextEditingController(text: ''));

  @override
  void initState() {
    super.initState();
    final viewModel = Provider.of<LoginViewModel>(context, listen: false);
    
    for (int i = 0; i < focusNodes.length; i++) {
      focusNodes[i].addListener(() {
        viewModel.notifyFocusChange();
      });
    }
  }

  @override
  void dispose() {
    for (var node in focusNodes) {
      node.dispose();
    }
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bool isLandscape = size.width > size.height;

    final double boxHeight = isLandscape ? 100 : size.width > 450 ? 65 : 50;
    final double boxWidth = isLandscape ? 70 : size.width > 450 ? 52 : 40;
    final double spacing = isLandscape ? size.width * 0.025 : size.width > 450 ? size.width * 0.04 : size.width * 0.02;

    return Consumer<LoginViewModel>(
      builder: (context, viewModel, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(6, (index) {
                return Row(
                  children: [
                    if (index > 0) SizedBox(width: spacing),
                    
                    Container(
                      height: boxHeight,
                      width: boxWidth,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: TextFormField(
                        controller: controllers[index],
                        focusNode: focusNodes[index],
                      
                        onChanged: (value) {
                          viewModel.updateOtp(index, value);
                          
                          if (value.length == 1 && index < 5) {
                            FocusScope.of(context).nextFocus();
                          }
                          if (value.isEmpty && index > 0) {
                            FocusScope.of(context).previousFocus();
                          }
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                          border: InputBorder.none,
                          enabledBorder: viewModel.otpValues[index].isNotEmpty
                              ? GradientOutlineInputBorder(
                                  gradient: LinearGradient(
                                    colors: [AppColor.pink, AppColor.blue],
                                  ),
                                  borderRadius: BorderRadius.circular(4),
                                )
                              : OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: viewModel.showError ? Colors.red : AppColor.grey,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                          focusedBorder: viewModel.otpValues[index].isEmpty
                              ? GradientOutlineInputBorder(
                                  gradient: LinearGradient(
                                    begin: Alignment.topRight,
                                    colors: [AppColor.pink, AppColor.blue],
                                  ),
                                  borderRadius: BorderRadius.circular(4),
                                )
                              : OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColor.grey,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                        ),
                        style: Appstyle().bold(context),
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        cursorColor: AppColor.white,
                      ),
                    ),
                  ],
                );
              }),
            ),
            if (viewModel.showError)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  AppText.enteryourpasscode.tr(),
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}