import 'dart:async';

import 'mainMenuComponents.dart';

class InfoTextLogic {
  final infoHookah = InfoAboutHookah();
  int? _id;
  int? get id => _id;

  set id(int? newValue) {
    _id = newValue;
    _idController.add(newValue);
  }

  final StreamController<int?> _idController =
      StreamController<int?>.broadcast();

  Stream<String?> get streamAdress {
    return _idController.stream.map(
      (id) {
        if (id == null) return null;
        final textIndex = id;
        if (textIndex < 0 || textIndex > infoHookah.adress.length) return null;
        return infoHookah.adress[textIndex];
      },
    );
  }

  Stream<String?> get streamPhoneNumb {
    return _idController.stream.map(
      (id) {
        if (id == null) return null;
        final textIndex = id;
        if (textIndex < 0 || textIndex > infoHookah.numbPhone.length) {
          return null;
        }
        return infoHookah.numbPhone[textIndex];
      },
    );
  }

  Stream<double?> get streamRating {
    return _idController.stream.map(
      (id) {
        if (id == null) return null;
        final ratingIndex = id;
        if (ratingIndex < 0 || ratingIndex > infoHookah.rating.length) {
          return null;
        }
        return infoHookah.rating[ratingIndex];
      },
    );
  }

  Stream<String?> get streamDescription {
    return _idController.stream.map(
      (id) {
        if (id == null) return null;
        final textIndex = id;
        if (textIndex < 0 || textIndex > infoHookah.description.length) {
          return null;
        }
        return infoHookah.description[textIndex];
      },
    );
  }

  Stream<String?> get streamSocial {
    return _idController.stream.map(
      (id) {
        if (id == null) return null;
        final textIndex = id;
        if (textIndex < 0 || textIndex > infoHookah.social.length) {
          return null;
        }
        return infoHookah.social[textIndex];
      },
    );
  }

  Stream<String?> get streamNameHookah {
    return _idController.stream.map(
      (id) {
        if (id == null) return null;
        final textIndex = id;
        if (textIndex < 0 ||
            textIndex > GoogleMapsComponents.infoWidowTitle.length) {
          return null;
        }
        return GoogleMapsComponents.infoWidowTitle[textIndex];
      },
    );
  }

  Stream<List<String>?> get streamImgHookah {
    return _idController.stream.map(
      (id) {
        if (id == null || id < 0 || id > infoHookah.imgHookahTime.length) {
          return null;
        }

        switch (id) {
          case 0:
            return infoHookah.imgHookahTime;
          case 1:
            return infoHookah.imgO2;
          default:
            return null;
        }
      },
    );
  }

  void dispose() {
    _idController.close();
  }
}
