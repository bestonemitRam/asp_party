import 'dart:ui';

import 'package:aps_party/layers/data/utils/app_color.dart';
import 'package:aps_party/layers/data/utils/app_images.dart';
import 'package:aps_party/layers/domain/entity/banner_member.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PartyPresident extends StatefulWidget {
  const PartyPresident({super.key});

  @override
  State<PartyPresident> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<PartyPresident> {
  @override
  Widget build(BuildContext context) {
    final double h = MediaQuery.of(context).size.height;
    final double w = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   title: Text(
      //     "ASP Party ",
      //     style: TextStyle(
      //         fontFamily: 'Fontspring-DEMO-blue_vinyl_regular_ps_ot',
      //         fontSize: 30),
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
              child: Container(
                  padding: EdgeInsets.all(10),
                  // height: h * 0.45,
                  width: double.infinity,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 2.h,
                          ),
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  height: 35.h,
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.only(left: 1.0, right: 1),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.white,
                                      image: DecorationImage(
                                          image: AssetImage(AppImages.chandra),
                                          fit: BoxFit.fill)),
                                ),
                              ),
                              Positioned(
                                // top: 2.h,
                                left: 1.h,
                                // right: 0,
                                bottom: 2.h,
                                child: SizedBox(
                                    child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10)),
                                    color:
                                        AppColors.primarycolor.withOpacity(0.9),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    child: const Text(
                                      "एडवोकेट चंद्रशेखर आजाद",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    ),
                                  ),
                                )),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 0, vertical: 10),
                            child: Text(
                              "About",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 0, vertical: 0),
                            child: Text(
                              // widget.userStory.description,
                              "एडवोकेट चंद्रशेखर आजाद का जन्म 3 दिसंबर 1986 को एक साधारण दलित घर में हुआ! आपके पिताजी प्राइमरी स्कूल के अध्यापक थे !और माताजी घरेलू महिला है! चंद्रशेखर आजाद ने अपनी शिक्षा स्नातकोत्तर एवं विधि विषय में की है! बाबा साहब एवं मान्यवर कांशीराम साहब के विचारों को जीवन में धारण करने वाले चंद्रशेखर आजाद जी ने अपने जीवन को दलित , पिछड़े अल्पसंख्यकों महिलाओं एवं समाज के कमजोर वर्गों उत्थान के लिए समर्पित कर दिया!",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Divider(
                            color: Colors.black,
                            height: 2,
                            thickness: 3,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 04, vertical: 20),
                            child: Text(
                              // widget.userStory.description,
                              "भाई चंद्रशेखर आजाद जी सामाजिक और शैक्षणिक रूप से समाज को मजबूती देने के लिए भीम आर्मी भारत एकता मिशन नाम का संगठन गठित किया वो धीरे धीरे यह संगठन भारत में संघर्ष की मिसाल बन गया दलित अल्पसंख्यक पिछड़ों के अधिकारों की लड़ाई लड़ने के लिए आज भारत के सभी राज्यों में और अधिकांश जिलों में और निचले स्तर तक यह संगठन सामाजिक एवं शैक्षणिक रूप से समाज को उन्नत करने का कार्य कर रहा है ! एडवोकेट चंद्रशेखर आजाद ने इस संघर्ष में अनेकों बार सरकारिया जोर ,जुल्म, ज्यादती और अत्याचार को स्वयं समाज के लिए झेला लेकिन अपने इरादे से तनिक भी विचलित नहीं हुए! एडवोकेट चंद्रशेखर आजाद ने समाज में गैर बराबरी समाप्त करने के मूलनिवासी 85% समाज को जागृत करने वाले महापुरुषों के सपने को साकार करने के लिए राजनीतिक सत्ता से व्यवस्था परिवर्तन करने का संकल्प लिया है ! ऐसा व्यवस्था परिवर्तन, जिसमें आर्थिक गैर बराबरी भी खत्म हो! जिसमें समाज के लोगों को आर्थिक और सामाजिक रुप से न्याय मिल सके! और समाज का नजरिया परिवर्तित हो सके! इसी संकल्प के साथ 15 मार्च 2020 को को एडवोकेट चंद्रशेखर आजाद ने आजाद समाज पार्टी काशीराम का गठन किया है!",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Divider(
                            color: Colors.black,
                            height: 2,
                            thickness: 3,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 04, vertical: 10),
                            child: Text(
                              "एडवोकेट चंद्रशेखर आजाद के संघर्ष को देखते हुए दुनिया की सर्वाधिक प्रतिष्ठित अमेरिका की टाइम पत्रिका ने 2021 के सर्वाधिक प्रतिभाशाली भविष्य के नेता की श्रेणी में एकमात्र मूल भारतीय के रूप में स्थान दिया! और उन्हें भविष्य का नेता बताया उनके संघर्ष की सराहना की! बाबा साहब भीमराव अंबेडकर के दिखाए रास्ते और उनके द्वारा लिखित संविधान संविधान के लिए कृत संकल्पित एडवोकेट चंद्रशेखर आजाद समाज में नई चेतना भरने के लिए मान्यवर कांशीराम जी के आदर्शों और सिद्धांतों पर चलते हुए , दबे, कुचले, पिछड़े ,अल्पसंख्यकों ,आर्थिक रूप से कमजोर लोगों के भविष्य को संवारने के लिए जीवन को समर्पित कर चुके हैं! ",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 04, vertical: 10),
                            child: Text(
                              'एडवोकेट चंद्रशेखर आजाद का मानना है माताओं और बहनों के सम्मान के लिए अगर जीवन की कुर्बानी भी तो नहीं पड़ी तो पीछे नहीं हटा जाएगा! एडवोकेट चंद्रशेखर आजाद अपनी ताकत के पीछे भीम आर्मी भारत एकता मिशन एवं आजाद समाज पार्टी के सबसे छोटे से छोटे जमीनी कार्यकर्ता को अपनी ताकत मानते हैं!',
                              style: TextStyle(fontSize: 16),
                            ),
                          )
                        ],
                      )
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
    ;
  }
}
