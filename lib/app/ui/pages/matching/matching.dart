import 'package:flutter/material.dart';
import '../../themes/colors.dart';
import '../../widgets/matching/profiles.dart';

class Matching extends StatelessWidget {
  const Matching({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: AppColors.primary,
            automaticallyImplyLeading: false,
            title: const TabBar(
                labelColor: AppColors.white,
                indicatorColor: AppColors.white,
                unselectedLabelColor: AppColors.black,
                isScrollable: false,
                indicatorSize: TabBarIndicatorSize.label,
                tabs: [
                  Tab(
                    icon: Icon(
                      Icons.whatshot,
                      size: 30,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.chat,
                    ),
                  ),
                ]),
          ),
          body: const TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [ProfileCard(), SizedBox()],
          ),
        ),
      ),
    );
  }
}
