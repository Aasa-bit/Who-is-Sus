// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'من المحتال؟';

  @override
  String get startGame => 'ابدأ اللعبة';

  @override
  String get youAreThe => 'أنت هو';

  @override
  String get imposter => 'المحتال';

  @override
  String get youAreTheImposter => 'أنت المحتال!';

  @override
  String get vote => 'التصويت الآن';

  @override
  String get talking => 'وقت التحدث ...';

  @override
  String get gotIt => 'فهمت!';

  @override
  String get players => 'اللاعبون';

  @override
  String get roundTime => 'مدة الجولة (دقيقة)';

  @override
  String get imposters => 'المحتالون';

  @override
  String get categories => 'الفئات';

  @override
  String get setUpYourGame => 'إعداد اللعبة';

  @override
  String get nextPlayer => 'اللاعب التالي';

  @override
  String get howToPlay => 'كيفية اللعب؟';

  @override
  String get getYourRole => 'اعرف دورك';

  @override
  String get getYourRoleDescription =>
      'استلم بطاقتك واكتشف دورك سرّاً. يحصل الجميع على الكلمة نفسها، باستثناء المحتال.';

  @override
  String get giveAClue => 'أعطِ تلميحاً';

  @override
  String get giveAClueDescription =>
      'يقول اللاعبون بالتناوب كلمة واحدة تصف الكلمة السرية. أيها المحتال، حاول الاندماج مع الآخرين واكتشاف الكلمة.';

  @override
  String get finalGuess => 'التخمين النهائي!';

  @override
  String get surviveOrEliminate => 'إما النجاة أو الاستبعاد!';

  @override
  String get votingInstructions =>
      'عندما يحين وقت التصويت، اختر اللاعب الذي تشك بأنه المحتال. اللاعب الذي يحصل على أكبر عدد من الأصوات يُكشف أمره.';

  @override
  String get impostorLastChance =>
      'يحصل المحتال الذي كُشف أمره على فرصة واحدة لتخمين الكلمة السرية.';

  @override
  String get correctGuessRule =>
      'إذا خمن الكلمة بشكل صحيح، يبقى المحتال في اللعبة. وإذا أخطأ، يُستبعد منها.';

  @override
  String get dontLetThemCatchYou => 'لا تدعهم يكشفونك!';

  @override
  String playerNumber(int number) {
    return 'اللاعب $number';
  }

  @override
  String get addPlayerList => 'أضف أسماء اللاعبين';

  @override
  String get deletePlayerTooltip => 'حذف اللاعب';

  @override
  String get addPlayerButton => 'إضافة لاعب';

  @override
  String get minPlayersWarning => 'أضف 3 لاعبين على الأقل';

  @override
  String get savePlayersButton => 'حفظ اللاعبين';

  @override
  String get dialogTitleAdd => 'إضافة لاعب';

  @override
  String get dialogTitleEdit => 'تعديل الاسم';

  @override
  String get playerNameLabel => 'اسم اللاعب';

  @override
  String get validationRequired => 'أدخل اسم اللاعب';

  @override
  String get validationDuplicate => 'هذا الاسم مستخدم بالفعل';

  @override
  String get cancelButton => 'إلغاء';

  @override
  String get saveButton => 'حفظ';

  @override
  String get tapToFlip => 'اضغط لقلب البطاقة';

  @override
  String get gameOver => 'انتهت اللعبة!';

  @override
  String get categoryAnimals => 'حيوانات';

  @override
  String get categoryFood => 'طعام';

  @override
  String get categoryPlaces => 'أماكن';

  @override
  String get categoryJobs => 'مهن';

  @override
  String get gameWordWatermelon => 'بطيخ';

  @override
  String get gameHintWatermelon => 'الصيف';

  @override
  String get gameWordGrapes => 'عنب';

  @override
  String get gameHintGrapes => 'عنقود';

  @override
  String get gameWordEgg => 'بيض مقلي';

  @override
  String get gameHintEgg => 'الفطور';

  @override
  String get gameWordSandwich => 'ساندويش';

  @override
  String get gameHintSandwich => 'وجبة سريعة';

  @override
  String get gameWordDonut => 'دونات';

  @override
  String get gameHintDonut => 'حلويات';

  @override
  String get gameWordCheese => 'جبن';

  @override
  String get gameHintCheese => 'الحليب';

  @override
  String get gameWordBanana => 'موز';

  @override
  String get gameHintBanana => 'فاكهة استوائية';

  @override
  String get gameWordCarrot => 'جزر';

  @override
  String get gameHintCarrot => 'خضار';

  @override
  String get gameWordCake => 'كعكة';

  @override
  String get gameHintCake => 'احتفال';

  @override
  String get gameWordBurger => 'برغر';

  @override
  String get gameHintBurger => 'وجبة سريعة';

  @override
  String get gameWordIceCream => 'آيس كريم';

  @override
  String get gameHintIceCream => 'الصيف';

  @override
  String get gameWordPizza => 'بيتزا';

  @override
  String get gameHintPizza => 'إيطاليا';

  @override
  String get gameWordBread => 'خبز';

  @override
  String get gameHintBread => 'الفرن';

  @override
  String get gameWordApple => 'تفاح';

  @override
  String get gameHintApple => 'بستان';

  @override
  String get gameWordPotato => 'بطاطا';

  @override
  String get gameHintPotato => 'تحت الأرض';

  @override
  String get gameWordZebra => 'حمار وحشي';

  @override
  String get gameHintZebra => 'السافانا';

  @override
  String get gameWordTurtle => 'سلحفاة';

  @override
  String get gameHintTurtle => 'الزواحف';

  @override
  String get gameWordMonkey => 'قرد';

  @override
  String get gameHintMonkey => 'الأشجار';

  @override
  String get gameWordPenguin => 'بطريق';

  @override
  String get gameHintPenguin => 'البرد';

  @override
  String get gameWordTiger => 'نمر';

  @override
  String get gameHintTiger => 'مفترس';

  @override
  String get gameWordGiraffe => 'زرافة';

  @override
  String get gameHintGiraffe => 'السافانا';

  @override
  String get gameWordPanda => 'باندا';

  @override
  String get gameHintPanda => 'آسيا';

  @override
  String get gameWordFox => 'ثعلب';

  @override
  String get gameHintFox => 'حيوان بري';

  @override
  String get gameWordBear => 'دب';

  @override
  String get gameHintBear => 'الغابة';

  @override
  String get gameWordDog => 'كلب';

  @override
  String get gameHintDog => 'حيوان أليف';

  @override
  String get gameWordHorse => 'حصان';

  @override
  String get gameHintHorse => 'السباق';

  @override
  String get gameWordRabbit => 'أرنب';

  @override
  String get gameHintRabbit => 'الجحور';

  @override
  String get gameWordElephant => 'فيل';

  @override
  String get gameHintElephant => 'ضخم';

  @override
  String get gameWordLion => 'أسد';

  @override
  String get gameHintLion => 'مفترس';

  @override
  String get gameWordCat => 'قطة';

  @override
  String get gameHintCat => 'حيوان أليف';

  @override
  String get gameWordBakery => 'مخبز';

  @override
  String get gameHintBakery => 'الصباح';

  @override
  String get gameWordStadium => 'ملعب';

  @override
  String get gameHintStadium => 'الجمهور';

  @override
  String get gameWordZoo => 'حديقة حيوانات';

  @override
  String get gameHintZoo => 'زيارة عائلية';

  @override
  String get gameWordHotel => 'فندق';

  @override
  String get gameHintHotel => 'السفر';

  @override
  String get gameWordCinema => 'سينما';

  @override
  String get gameHintCinema => 'ترفيه';

  @override
  String get gameWordSupermarket => 'سوبرماركت';

  @override
  String get gameHintSupermarket => 'التسوق';

  @override
  String get gameWordTrainStation => 'محطة قطار';

  @override
  String get gameHintTrainStation => 'الرحلات';

  @override
  String get gameWordLibrary => 'مكتبة';

  @override
  String get gameHintLibrary => 'الهدوء';

  @override
  String get gameWordMuseum => 'متحف';

  @override
  String get gameHintMuseum => 'الماضي';

  @override
  String get gameWordPark => 'حديقة';

  @override
  String get gameHintPark => 'الهواء الطلق';

  @override
  String get gameWordRestaurant => 'مطعم';

  @override
  String get gameHintRestaurant => 'قائمة';

  @override
  String get gameWordBeach => 'شاطئ';

  @override
  String get gameHintBeach => 'العطلة';

  @override
  String get gameWordAirport => 'مطار';

  @override
  String get gameHintAirport => 'السفر';

  @override
  String get gameWordHospital => 'مستشفى';

  @override
  String get gameHintHospital => 'الرعاية';

  @override
  String get gameWordSchool => 'مدرسة';

  @override
  String get gameHintSchool => 'الصباح';

  @override
  String get gameWordBaker => 'خباز';

  @override
  String get gameHintBaker => 'العجين';

  @override
  String get gameWordPhotographer => 'مصور';

  @override
  String get gameHintPhotographer => 'الذكريات';

  @override
  String get gameWordPainter => 'رسام';

  @override
  String get gameHintPainter => 'الإبداع';

  @override
  String get gameWordAstronaut => 'رائد فضاء';

  @override
  String get gameHintAstronaut => 'الاستكشاف';

  @override
  String get gameWordDentist => 'طبيب أسنان';

  @override
  String get gameHintDentist => 'الابتسامة';

  @override
  String get gameWordPoliceOfficer => 'شرطي';

  @override
  String get gameHintPoliceOfficer => 'النظام';

  @override
  String get gameWordScientist => 'عالم';

  @override
  String get gameHintScientist => 'التجارب';

  @override
  String get gameWordFarmer => 'مزارع';

  @override
  String get gameHintFarmer => 'الأرض';

  @override
  String get gameWordMechanic => 'ميكانيكي';

  @override
  String get gameHintMechanic => 'الإصلاح';

  @override
  String get gameWordFirefighter => 'رجل إطفاء';

  @override
  String get gameHintFirefighter => 'الإنقاذ';

  @override
  String get gameWordChef => 'طباخ';

  @override
  String get gameHintChef => 'النكهات';

  @override
  String get gameWordPilot => 'طيار';

  @override
  String get gameHintPilot => 'الرحلات';

  @override
  String get gameWordEngineer => 'مهندس';

  @override
  String get gameHintEngineer => 'التصميم';

  @override
  String get gameWordTeacher => 'معلم';

  @override
  String get gameHintTeacher => 'الشرح';

  @override
  String get gameWordDoctor => 'طبيب';

  @override
  String get gameHintDoctor => 'الرعاية';

  @override
  String hintLabel(String hint) {
    return 'تلميح: $hint';
  }

  @override
  String get passPhoneToNextPlayer => 'مرّر الهاتف إلى اللاعب التالي';

  @override
  String get rememberUrCard => 'احفظ معلوماتك ثم أخفِ البطاقة بالزر أدناه';

  @override
  String get flipToRevealSecretWord => 'اقلب البطاقة لكشف كلمتك السرية';

  @override
  String get getReady => 'استعدوا!';

  @override
  String roundTimer(int number) {
    return 'مؤقّت الجولة $number';
  }

  @override
  String get roundTimerLabel => 'مؤقّت الجولة';

  @override
  String get discussion => 'وقت النقاش!';

  @override
  String get discussionInstructions =>
      'يقول كل لاعب، عندما يحين دوره، كلمة واحدة فقط مرتبطة بالكلمة السرية.';

  @override
  String get timeOver => 'انتهى الوقت!';

  @override
  String get whoIsTheImposter => 'من تظن أنه المحتال؟';

  @override
  String get theImposterIs => 'المحتال هو:';

  @override
  String get reveal => 'اكشف';

  @override
  String get submit => 'إرسال';

  @override
  String get youCaughtTheImposter => 'لقد كشفتم المحتال!';

  @override
  String get theActualImposterIs => 'المحتال الفعلي هو:';

  @override
  String oneChanceToGuess(int number) {
    return 'يا لاعب $number، لديك فرصة واحدة! هل تستطيع تخمين الكلمة السرية؟';
  }

  @override
  String get itIsATie => 'تعادل!';

  @override
  String get caught => 'تم كشفه!';

  @override
  String get votedForImposter => 'صوّتّم للمحتال!';

  @override
  String get votedForWrongPerson => 'صوّتّم للشخص الخطأ!';

  @override
  String get writeItDown => 'اكتب تخمينك...';

  @override
  String get continueAction => 'متابعة';

  @override
  String get wrongVoteMessage =>
      'صوّتَّ للاعب الخطأ. ما زال المحتال في اللعبة!';

  @override
  String get imposterEscaped => 'نجا المحتال!';

  @override
  String get scratchToReveal => 'امسح لكشف الكلمة';

  @override
  String correctSecretWordGuessMessage(int number) {
    return 'يا لاعب $number، لقد خمّنت الكلمة السرية بشكل صحيح! ما زلت في اللعبة!';
  }

  @override
  String get playAgain => 'العب مجدداً';

  @override
  String secretWordWithValue(String word) {
    return 'الكلمة السرية: «$word»';
  }

  @override
  String get congratulations => 'تهانينا';

  @override
  String get weHaveAWinner => 'لدينا فائز!';

  @override
  String get yourSecretWordIs => 'كلمتك السرية هي:';

  @override
  String get revealWord => 'كشف الكلمة';

  @override
  String secretWordLabel(String word) {
    return 'الكلمة السرية: $word';
  }
}
