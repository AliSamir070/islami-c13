
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_c13/style/ColorsManager.dart';
import 'package:islami_c13/style/StringsManager.dart';
import 'package:islami_c13/style/constants.dart';
import 'package:islami_c13/ui/home/widgets/SuraWidget.dart';

import '../../../model/SuraModel.dart';
import '../../../style/AssetsManager.dart';
import '../../../style/PrefsHelper.dart';
import '../widgets/RecentlySuraWidget.dart';

class QuranTab extends StatefulWidget {
  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<SuraModel> filterList = [];

  String searchValue = "";
  List<SuraModel> mostRecentList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mostRecentList = PrefHelper.getRecentList();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(AssetsManager.quranBack),fit: BoxFit.fitWidth)
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                    alignment: Alignment.center,
                    child: Image.asset(AssetsManager.logo,height: 151,width: 291,),),
                TextField(
                  onChanged: (value){
                    setState(() {
                      searchValue = value;
                      searchSura(value);
                    });
                  },
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    fontFamily: "Janna",
                    color: ColorsManager.searchTextColor
                  ),
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    isCollapsed: true,
                    fillColor: ColorsManager.secondary.withOpacity(0.7),
                    filled: true,
                    hintText: "Enter sura name",
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        fontFamily: "Janna",
                        color: ColorsManager.searchTextColor
                    ),
                    prefixIconConstraints: BoxConstraints(
                      maxHeight: 54,
                      maxWidth: 54
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(14),
                      child: SvgPicture.asset(
                        AssetsManager.quran,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: ColorsManager.primary,
                      )
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: ColorsManager.primary,
                        )
                    )
                  ),
                ),
                SizedBox(height: 20,),
                if(searchValue.isEmpty)
                  ...[
                    if(mostRecentList.isNotEmpty)
                    ...[
                      Text(StringsManager.mostRecently,style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Janna",
                          fontWeight: FontWeight.w700,
                          color: ColorsManager.searchTextColor
                      ),),
                      SizedBox(height: 10,),
                      Expanded(
                        flex: 2,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) =>RecentlySuraWidget(
                              suraModel:mostRecentList[index] ,
                            ) ,
                            separatorBuilder: (context, index) => SizedBox(width: 10,),
                            itemCount: mostRecentList.length
                        ),
                      ),
                    ],
                    Text(StringsManager.surasList,style: TextStyle(
                        fontSize: 16,
                        fontFamily: "Janna",
                        fontWeight: FontWeight.w700,
                        color: ColorsManager.searchTextColor
                    ),),
                    SizedBox(height: 10,),
                  ],
                Expanded(
                  flex: 3,
                  child: ListView.separated(
                      itemCount: searchValue.isNotEmpty
                          ?filterList.length
                          :suraList.length,
                      itemBuilder: (context, index) => SuraWidget(
                        addToRecent: (){
                          for(int i=0;i<mostRecentList.length;i++){
                            if(mostRecentList[i].suraNameEn == (searchValue.isNotEmpty
                                ?filterList[index].suraNameEn
                                :suraList[index].suraNameEn)){
                              mostRecentList.removeAt(i);
                            }
                          }
                          mostRecentList.insert(0,searchValue.isNotEmpty
                              ?filterList[index]
                              :suraList[index]);
                          PrefHelper.addRecentList(mostRecentList);
                          setState(() {

                          });
                        },
                        suraModel: searchValue.isNotEmpty
                            ?filterList[index]
                            :suraList[index],
                      ),
                      separatorBuilder: (context, index) => Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 44
                        ),
                        child: Divider(
                          height: 30,
                        ),
                      ),
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }

  searchSura(String searchText){
    filterList = [];
    /*for(int i=0;i<suraList.length;i++){
      if(suraList[i].suraNameEn.contains(searchText) || suraList[i].suraNameAr.contains(searchText)){
        // filter sura list
        filterList.add(suraList[i]);
      }
    }*/
    filterList = suraList.where((element)
    => element.suraNameEn.toLowerCase().contains(searchText.toLowerCase())
        || element.suraNameAr.contains(searchText)).toList();
    print("filter list lenght : ${filterList.length}");
  }
}
