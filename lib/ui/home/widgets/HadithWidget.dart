import 'package:flutter/material.dart';
import 'package:islami_c13/model/HadithModel.dart';
import 'package:islami_c13/style/ColorsManager.dart';
import 'package:islami_c13/ui/hadith_details/screen/hadithdetails_screen.dart';

import '../../../style/AssetsManager.dart';

class HadithWidget extends StatelessWidget {
  final HadithModel hadithModel;
  const HadithWidget({super.key,required this.hadithModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, HadithDetailsScreen.routeName,arguments: hadithModel);
      },
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: ColorsManager.primary,
          borderRadius: BorderRadius.circular(20)
        ),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Row(

                    children: [
                      Image.asset(
                          AssetsManager.leftCorner,
                        color:ColorsManager.secondary ,
                      ),
                      Expanded(
                        child: Text(hadithModel.title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: "Janna",
                              color: ColorsManager.secondary,
                              fontWeight: FontWeight.w700,
                              fontSize: 20
                          ),),
                      ),
                      Image.asset(
                          AssetsManager.rightCorner,
                          color:ColorsManager.secondary
                      ),
                    ],
                  ),
                  SizedBox(height: 19,),
                  Expanded(
                    child:Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(AssetsManager.hadithBack),
                        Text(hadithModel.content,
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 10,
                          style: TextStyle(
                              color: ColorsManager.secondary,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Janna"
                          ),),
                      ],
                    ) ,
                  ),
                ],
              ),
            ),
            Image.asset(
              AssetsManager.mosque,
              width: double.infinity,
              color:ColorsManager.secondary ,
            )
          ],
        ),
      ),
    );
  }
}
