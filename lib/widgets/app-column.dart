import 'package:flutter/material.dart';
import 'package:tmchat/utils/colors.dart';
import 'package:tmchat/utils/dimensions.dart';
import 'package:tmchat/widgets/small-text.dart';

import 'big-text.dart';
import 'icon-and-text-widget.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({ Key? key, required this.text }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(text: text, size: Dimensions.font26,),
                      SizedBox(
                        height: Dimensions.height10,
                      ),
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(5, (index) {
                              return Icon(
                                Icons.star,
                                color: AppColors.mainColor,
                                size: 15,
                              );
                            }),
                          ),
                          SizedBox(
                            width: 11,
                          ),
                          SmallTetxt(text: '4.5'),
                          SizedBox(
                            width: 10,
                          ),
                          SmallTetxt(text: '1247'),
                          SizedBox(
                            width: 8,
                          ),
                          SmallTetxt(text: 'commentaires')
                        ],
                      ),
                      SizedBox(
                        height: Dimensions.height10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconAndTextWidget(
                              icon: Icons.circle_sharp,
                              text: 'Normal',
                              iconColor: AppColors.iconColor1),
                          IconAndTextWidget(
                              icon: Icons.location_on,
                              text: '1.7Km',
                              iconColor: AppColors.mainColor),
                          IconAndTextWidget(
                              icon: Icons.access_time_outlined,
                              text: '35min',
                              iconColor: AppColors.iconColor2)
                        ],
                      )
                    ],
                  );
  }
}