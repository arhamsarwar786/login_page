import 'package:flutter/material.dart';
import 'package:login_page/utils/app_color.dart';
import 'package:login_page/utils/responsive.dart';
import 'package:login_page/viewmodel/theme_view_model.dart';
import 'package:login_page/views/widgets/costom_card_grid.dart';
import 'package:login_page/views/widgets/details_card.dart';
import 'package:login_page/views/widgets/graph_map_gridview.dart';
import 'package:login_page/views/widgets/header_widget.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const MainScreen({super.key, required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    
    // Provider ko listen karo
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColor.pink,
                AppColor.blue,
              ],
            ),
          ),
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Responsive.isMobile(context) ? 15 : 10,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: Responsive.isMobile(context) ? 40 : 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: HeaderWidget(scaffoldKey: scaffoldKey),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Responsive(
                    mobile: CustomCardGridView(
                      crossAxisCount: size.width < 650 ? 2 : 4,
                      childAspectRatio: size.width < 650 ? 1.3 : 1.2,
                    ),
                    tablet: CustomCardGridView(
                      crossAxisCount: size.width < 800 ? 2 : 4,
                      childAspectRatio: size.width < 800 ? 1.5 : 1.2,
                    ),
                    desktop: CustomCardGridView(
                      childAspectRatio: size.width < 1400 ? 1.3 : 1.5,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Responsive(
                    mobile: GraphMapGridView(
                      crossAxisCount: size.width < 650 ? 1 : 2,
                      childAspectRatio: size.width < 650 ? 1.2 : 1,
                    ),
                    tablet: GraphMapGridView(
                      crossAxisCount: 2,
                      childAspectRatio: size.width < 800 ? 1.05 : 1.27,
                    ),
                    desktop: GraphMapGridView(
                      childAspectRatio: size.width < 1400 ? 1.35 : 1.7,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  DetailsCard(),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}