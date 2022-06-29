

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/Dimensions.dart';
import '../../widgets/BigTxt.dart';
import '../../widgets/smallTxt.dart';

class EmptyContainer extends StatelessWidget {
  const EmptyContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> myOffer=[
      "The weather migh affect stocks",
      "weldone on these offers you are selected",
      "How can yo get 50% OFF",
      "weldone on these offers",
    ];
    final myProducts = List<String>.generate(10, (i) => 'product $i');

    return Container( height: Dimensions.height10*12,
      child: ListView.builder( itemCount: myOffer.length,shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index){
          return
            Container(height:Dimensions.height100*2,width: Dimensions.width20*10, margin: EdgeInsets.symmetric(horizontal: Dimensions.width10/2),
              padding: EdgeInsets.all(Dimensions.width10),
              decoration: (BoxDecoration(color: Color(0xffbff8ea),
              borderRadius: BorderRadius.circular(5))),
              
              child: Container(
                child: Column(mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(child: BigText('kiolo',size: Dimensions.width10*1.6,color:Color(0xff111350) ,)),
                    Flexible(
                      child: SmallTxt(
                        "anya is loading...",
                        size:  Dimensions.width10*1.4,
                        color: Colors.grey.shade700, h: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            );
        },),
    );

  }}
