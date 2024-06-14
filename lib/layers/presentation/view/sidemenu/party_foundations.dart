import 'dart:ui';

import 'package:aps_party/layers/data/utils/app_color.dart';
import 'package:aps_party/layers/data/utils/app_images.dart';
import 'package:aps_party/layers/domain/entity/banner_member.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PartyFoundations extends StatefulWidget {
  const PartyFoundations({super.key});

  @override
  State<PartyFoundations> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<PartyFoundations> {
  @override
  Widget build(BuildContext context) {
    final double h = MediaQuery.of(context).size.height;
    final double w = MediaQuery.of(context).size.width;
    return Scaffold(
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
                                          image: AssetImage(AppImages.Bhim_Army_Bharat_Ekta_Mission_logo),
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
                                        AppColors.primarycolor.withOpacity(0.6),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    child: const Text(
                                      "Party History",
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
                                horizontal: 0, vertical: 0),
                            child: Text(
                                "भीम आर्मी - भारत एकता मिशन की स्थापना 2015 में पश्चिमी यूपी के सहारनपुर जिले में हुई थी। जाति से प्रेरित हमले, महत्वपूर्ण दलित शख्सियतों की मूर्तियों को अपवित्र किया गया, हिंदू दक्षिणपंथी ताकतों द्वारा दंगे और संपत्ति का विनाश सहारनपुर में बड़े पैमाने पर हुआ। भीम आर्मी ने खुद को दलित दावे के दबाव समूह के रूप में तैयार किया और यह स्पष्ट कर दिया कि दलितों पर दुर्व्यवहार और हिंसा अब बर्दाश्त नहीं की जाएगी, और दलितों के साथ सम्मान के साथ व्यवहार किया जाना चाहिए।",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 04, vertical: 10),
                            child: Text(
                              // widget.userStory.description,
                              "समय के साथ, भीम आर्मी समग्र रूप से समुदाय के उत्थान की दिशा में काम करने के लिए विकसित हुई। खुद को और समुदाय को शिक्षित करने के बाबासाहेब के आह्वान को ध्यान में रखते हुए, भीम आर्मी ने भीम पाठशाला की स्थापना की, जो बच्चों के लिए स्कूल के बाद मुफ्त ट्यूशन सेंटर है। इस अवधारणा ने जड़ें जमा लीं और पूरे पश्चिमी यूपी में फैल गईं। सरकारी संस्थानों की शिक्षा नीतियों के बावजूद, दलित बच्चों को अक्सर कक्षाओं में भेदभावपूर्ण व्यवहार का अनुभव होता है, जिसके कारण वे सामाजिक और शैक्षणिक रूप से पीछे रह जाते हैं। भीम पाठशाला, जिसका संरक्षण ज्यादातर दलित बच्चों द्वारा किया जाता है, रिश्तेदारी और सीखने का स्थान है, शिक्षक स्वयंसेवक हैं और संसाधन समुदाय के भीतर से ही प्राप्त होते हैं। इसके अनूठे शिक्षण मॉडल में, स्वयंसेवी शिक्षक बड़े बच्चों को पढ़ाते हैं, जो बदले में छोटे बच्चों को पढ़ाते हैं। इस पहल ने भाग लेने वाले बच्चों की साक्षरता और शैक्षणिक प्रदर्शन को बेहतर बनाने में काफी मदद की है। केंद्र बच्चों को दलित समुदाय के प्रेरणादायक शख्सियतों, गीतों और पौराणिक कथाओं से भी परिचित कराते हैं और संस्कृति में व्याप्त वर्चस्ववादी ब्राह्मणवादी कथा के लिए एक वैकल्पिक संस्कृति की पेशकश करते हैं, जिसका वे अन्यथा सामना करते हैं।",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 04, vertical: 10),
                            child: Text(
                              'सहारनपुर में ठाकुर जाति के अत्याचारों के खिलाफ दिल्ली के जंतर-मंतर पर एक रैली के बाद, भीम आर्मी के संस्थापक चन्द्रशेखर आजाद को कठोर राष्ट्रीय सुरक्षा कानून के तहत हिरासत में लिया गया, जो 15 महीने तक बिना मुकदमे के जेल की अनुमति देता है। 2019 में, भीम आर्मी दो महत्वपूर्ण विरोध प्रदर्शनों का हिस्सा थी - एक दिल्ली में रविदास मंदिर के विध्वंस के खिलाफ, और "नागरिकता संशोधन अधिनियम" और "राष्ट्रीय नागरिकता रजिस्टर" विरोधी का भी समर्थन किया, जिसने साल के अंत में देशव्यापी आंदोलन को जन्म दिया। . चन्द्रशेखर आज़ाद ने सीएए/एनआरसी विरोध प्रदर्शन के दौरान जामिया मिलिया इस्लामिया विश्वविद्यालय के छात्रों और शाहीन बाग की महिलाओं को भी अपना समर्थन दिया।',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
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
