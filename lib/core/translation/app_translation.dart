import 'package:get/get.dart';
import 'package:car_medic/core/translation/languages/ar_language.dart';
import 'package:car_medic/core/translation/languages/en_language.dart';
import 'package:car_medic/core/translation/languages/tr_tanslation.dart';

class AppTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "en_US": EnLanguage.map,
        "ar_SA": ARLanguage.map,
        "tr_TR": TRLangauge.map
      };
}

tr(String key) => key.tr;
