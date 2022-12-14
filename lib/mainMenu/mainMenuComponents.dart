import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsComponents {
  static const List<int> markerId = [0, 1, 2, 3, 4, 5, 6];
  static const List<LatLng> position = [
    LatLng(56.635341, 47.912482),
    LatLng(56.636842, 47.909368),
    LatLng(56.630064, 47.906198),
    LatLng(56.632841, 47.901885),
    LatLng(56.640016, 47.883047),
    LatLng(56.635328, 47.897003),
    LatLng(56.628352, 47.888289),
  ];
  static const List<String> infoWidowTitle = [
    'Hookah Time',
    'O2',
    'The TOP',
    'DeD',
    'На небе',
    'HookahPlace',
    'Oblaka Lounge',
  ];
}

class InfoAboutHookah {
  List<String> adress = [
    'Воскресенский просп., 9Б, Йошкар-Ола, Респ. Марий Эл, Россия',
    'Царьградский просп., 33, Йошкар-Ола, Респ. Марий Эл, Россия',
    'ул. Эшкинина, 10Д, Йошкар-Ола, Респ. Марий Эл, Россия',
    'ул. Архангельская слобода, 7, Йошкар-Ола, Респ. Марий Эл, Россия',
    'ул. Якова Эшпая, 150, Йошкар-Ола, Респ. Марий Эл',
    'б-р Чавайна, 36, Йошкар-Ола, Респ. Марий Эл',
    'пр. Гагарина, 9, Йошкар-Ола, Респ. Марий Эл',
  ];
  List<String> numbPhone = [
    '+7 (987) 720-34-44',
    '+7 (902) 433-64-95',
    '+7 (836) 255-01-21',
    '+7 (927) 877-55-77',
    '+7 (902) 736-23-13',
    '+7 (964) 863-90-00',
    '+7 (836) 232-31-10',
  ];

  List<double?> rating = [
    4.6,
    4.5,
    4.3,
    4.7,
    4.7,
    4.8,
    4.8,
    4.8,
  ];
  List<String?> description = [
    'Hookah Time - топовая кальянная нашего города! Мы всегда рады нашим гостям и в свою очередь представляем лучшие дымные кальяны от крутых мастеров своего дела! Наша команда порадует вас качеством обслуживания и невероятным вкусом наших фирменных чаев и коктейлей!\nГарантируем отличное настроение и прекрасное времяпрепровождение!',
    'O2 - уютное место города со своей оригинальной и неповторимой атмосферой. Наша команда готова радовать вас дымными кальянами, качественным обслуживанием и разнообразными напитками. Мы уверены, что вы останетесь довольны!',
    'Место которое вы полюбите и будете появляться снова и снова. Кафе theTOP - райский уголок в центре Йошкар-Олы. Атмосфера уюта и relax, мягкие диванчики, большой выбор вкусных чаев, настольные игры, PS4, VIP комната. Попадая в theTOP, время останавливается.\nСтрого 18+. Если вам повезло и вы выглядите молодо, пожалуйста, возьмите с собой документы.',
    'Кафе, кальянная, лаунж бар дед находится в красивом, живописном месте на набережной Йошкар-Олы! Рядом Достопримечательности: Благовещенская башня с часами (Московский Кремль), Благовещенский собор, итальянский парк (Парк Медичи). Гости с других городов и стран полюбили и рекомендуют наше заведение! У нас стильно, уютно и вкусно! Мы предлагаем высокое качество обслуживания и качественный отдых!\nЖдём вас в гости!',
    'Lounge Bar "На Небе" - это уютная атмосфера со своим неповторимым стилем. Здесь Вас ждет 7 VIP комнаты для любой компании, с игровыми приставками и футбольными трансляциями. Общий зал с комфортными мягкими диванами. Спортивные трансляции (подключен полный пакет спортивных каналов Матч ТВ и Мачт Футбол), игровые приставки с современными популярными играми, настольные игры, вкусный ароматный чай, дымные сочные паровые коктейли',
    'HookahPlace™ Йошкар-Ола - филиал всемирно известной сети кальянных заведений. Мы предлагаем новый подход к культуре курения кальяна. Без сомнений, Hookah Place делают уникальным местом кальянщики - опытные мастера, которые полностью овладели мастерством приготовления кальяна, знают его секреты и историю. HookahPlace — лучшее место, чтобы покурить кальян недорого в Йошкар-Оле.',
    'OBLAKA LOUNGE – один из самых старых и крутых лаунж баров в городе. Тебя ждут качественные кальяны, широкий ассортимент безалкогольных напитков, а также 10 приставок Playstation с огромным ассортиментом игр для компании.',
  ];
  List<String?> social = [
    'vk.com/hookahtime_yo',
    'vk.com/o2_yo',
    'vk.com/thetop_yo',
    'vk.com/ded_lounge_bar_yo',
    'vk.com/club177016972',
    'vk.com/hookahplace_yo',
    'vk.com/ola_oblaka',
  ];

  List<String> imgHookahTime = [
    'assets/images/photoHookah/hookahtime1.jpg',
    'assets/images/photoHookah/hookahtime2.jpg',
    'assets/images/photoHookah/hookahtime3.jpg',
  ];
  List<String> imgO2 = [
    'assets/images/photoHookah/o2_1.png',
    'assets/images/photoHookah/o2_2.png',
  ];

  List<String> imgTheTop = [
    'assets/images/photoHookah/thetop1.jpg',
    'assets/images/photoHookah/thetop2.jpg',
    'assets/images/photoHookah/thetop3.jpg',
  ];

  List<String> imgDed = [
    'assets/images/photoHookah/ded1.jpg',
    'assets/images/photoHookah/ded2.jpg',
    'assets/images/photoHookah/ded3.jpg',
    'assets/images/photoHookah/ded4.jpg',
  ];

  List<String> imgNaNebe = [
    'assets/images/photoHookah/nanebe1.jpg',
    'assets/images/photoHookah/nanebe2.jpg',
  ];

  List<String> imgHookahPlace = [
    'assets/images/photoHookah/hookahplace1.jpg',
    'assets/images/photoHookah/hookahplace2.jpg',
    'assets/images/photoHookah/hookahplace3.jpg',
    'assets/images/photoHookah/hookahplace4.jpg',
  ];

  List<String> imgOblaka = [
    'assets/images/photoHookah/oblaka1.jpg',
    'assets/images/photoHookah/oblaka2.jpg',
    'assets/images/photoHookah/oblaka3.jpg',
    'assets/images/photoHookah/oblaka4.jpg',
  ];
}
