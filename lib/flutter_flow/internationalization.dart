import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'pt'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? ptText = '',
  }) =>
      [enText, ptText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    '1gzxml73': {
      'en': 'Courses',
      'pt': 'Cursos',
    },
    'ahkxx2uw': {
      'en': 'Dictionaries',
      'pt': 'Dicionários',
    },
    'mu8q82uq': {
      'en': 'Contribute',
      'pt': 'Contribuir',
    },
    '6z1vtn78': {
      'en': 'Home',
      'pt': 'Lar',
    },
    's1cpwmne': {
      'en': 'Program',
      'pt': 'Programa',
    },
    '0zrv2acv': {
      'en': 'Downloads',
      'pt': 'Transferências',
    },
    'yi0ni4k5': {
      'en': 'Profile',
      'pt': 'Perfil',
    },
    'nhfjqs3v': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // Start
  {
    'bbgigjmv': {
      'en': 'Traduz',
      'pt': 'Traduz',
    },
    'wwgou4uv': {
      'en': 'Let’s go',
      'pt': 'Vamos',
    },
    'fgbk4gk5': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // SignUp
  {
    'u143vwu1': {
      'en': 'Enter as a guest',
      'pt': 'Entre como convidado',
    },
    'uod7cbty': {
      'en': 'You can start right away.',
      'pt': 'Você pode começar agora mesmo.',
    },
    'edyar5qk': {
      'en': 'Email',
      'pt': 'E-mail',
    },
    'g0j69m4c': {
      'en': 'Password',
      'pt': 'Senha',
    },
    'mxs99klg': {
      'en': 'Confirm Password',
      'pt': 'Confirme sua senha',
    },
    'yv5z7giw': {
      'en': 'Sign up',
      'pt': 'Inscrever-se',
    },
    'o1cxyd9x': {
      'en': 'Already Have An Account?',
      'pt': 'Já tem uma conta?',
    },
    'rek8nbqn': {
      'en': 'Login',
      'pt': 'Conecte-se',
    },
    '1zlyas0m': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // LogIn
  {
    '4izby4j0': {
      'en': 'Username',
      'pt': 'Nome de usuário',
    },
    '281pc328': {
      'en': 'Password',
      'pt': 'Senha',
    },
    'g2ucemdy': {
      'en': 'Log in',
      'pt': 'Conecte-se',
    },
    'kk0jlu96': {
      'en': 'Don’t Have An Account?',
      'pt': 'Não tem uma conta?',
    },
    'v2633o3y': {
      'en': 'Sign Up',
      'pt': 'Inscrever-se',
    },
    '4vjgkr5q': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // Program
  {
    'ngdgt43i': {
      'en': 'Customized plan to achieve individual goals!',
      'pt': 'Plano personalizado para atingir objetivos individuais!',
    },
    '324jsdo4': {
      'en': 'Portuguese',
      'pt': 'Português',
    },
    '0eogrmuu': {
      'en': 'Kikongo',
      'pt': 'Kikongo',
    },
    '34ms16lf': {
      'en': 'Home',
      'pt': 'Lar',
    },
    'f4gkzrqn': {
      'en': 'Program',
      'pt': 'Programa',
    },
    'lsm6mays': {
      'en': 'Downloads',
      'pt': 'Transferências',
    },
    'xdfl05c3': {
      'en': 'Profile',
      'pt': 'Perfil',
    },
    'y6gbrdlg': {
      'en': 'Personal Program',
      'pt': 'Programa Pessoal',
    },
    'z5o81a6x': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // profile
  {
    'vr1i81y3': {
      'en': 'Tracker Notifications',
      'pt': 'Notificações do rastreador',
    },
    'amgwq0u5': {
      'en': 'Help Center',
      'pt': 'Central de Ajuda',
    },
    't3ur00pm': {
      'en': 'Settings',
      'pt': 'Configurações',
    },
    '341noot9': {
      'en': 'Language',
      'pt': 'Linguagem',
    },
    'n78qrpj4': {
      'en': 'Profile Settings',
      'pt': 'Configurações de perfil',
    },
    'lsqp5t1a': {
      'en': 'Edit Profile',
      'pt': 'Editar perfil',
    },
    'tfu2na8d': {
      'en': 'Notification Settings',
      'pt': 'Configurações de notificação',
    },
    '112c9udh': {
      'en': 'Log out of account',
      'pt': 'Sair da conta',
    },
    '9wfhchay': {
      'en': 'Log out',
      'pt': 'Sair',
    },
    'uxf1xx9r': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // Downloads
  {
    '4yjwfjcz': {
      'en': 'Kikongo-Portuguese Dictionary',
      'pt': 'Dicionário Kikongo-Português',
    },
    'l880vkhy': {
      'en': 'Portuguese - Chapter 1',
      'pt': 'Português - Capítulo 1',
    },
    'adnuf1n3': {
      'en': 'Home',
      'pt': 'Lar',
    },
    'u4ks3zdg': {
      'en': 'Program',
      'pt': 'Programa',
    },
    'lfw6x072': {
      'en': 'Downloads',
      'pt': 'Transferências',
    },
    '7t8yburl': {
      'en': 'Profile',
      'pt': 'Perfil',
    },
    'ltpwrh23': {
      'en': 'Downloads',
      'pt': 'Transferências',
    },
    'g0sqv47s': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // SelectLanguage
  {
    't2fma9jn': {
      'en': 'Select your Language',
      'pt': 'Selecione seu idioma',
    },
    'pfkssu6i': {
      'en': 'Português',
      'pt': 'Português',
    },
    'sa2walj2': {
      'en': 'Kikongo',
      'pt': 'Kikongo',
    },
    'gsksljzs': {
      'en': 'English',
      'pt': 'Inglês',
    },
    'zswx42n7': {
      'en': 'Next',
      'pt': 'Próximo',
    },
    'mf8uuzjh': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // Courses
  {
    'pe1dcauh': {
      'en': 'Let’s improve and grow together, step by step!',
      'pt': 'Vamos melhorar e crescer juntos, passo a passo!',
    },
    'brf1hmzd': {
      'en': 'Portuguese',
      'pt': 'Português',
    },
    '1rw6osrl': {
      'en': 'Home',
      'pt': 'Lar',
    },
    'ezcvegb4': {
      'en': 'Program',
      'pt': 'Programa',
    },
    'bp1tghrt': {
      'en': 'Downloads',
      'pt': 'Transferências',
    },
    'r7dzuvux': {
      'en': 'Profile',
      'pt': 'Perfil',
    },
    '7u76bq4h': {
      'en': 'Courses',
      'pt': 'Cursos',
    },
    'qwnkvqpo': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // Dictionaries
  {
    'dboh3lxi': {
      'en': 'Kikongo-Portuguese',
      'pt': 'Kikongo-Português',
    },
    'jmtb2cx9': {
      'en': 'Print',
      'pt': 'Imprimir',
    },
    'zi8dyd5c': {
      'en': 'Home',
      'pt': 'Lar',
    },
    '0q4505k4': {
      'en': 'Program',
      'pt': 'Programa',
    },
    '277irtkn': {
      'en': 'Downloads',
      'pt': 'Transferências',
    },
    'ixr4uuet': {
      'en': 'Profile',
      'pt': 'Perfil',
    },
    'ot2g89oo': {
      'en': 'Dictionaries',
      'pt': 'Dicionários',
    },
    'foumyw31': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // Portuguese-Course
  {
    'qgr9234y': {
      'en': 'Let’s improve and grow together, step by step!',
      'pt': 'Vamos melhorar e crescer juntos, passo a passo!',
    },
    '5ucle8ab': {
      'en': 'Chapter 1:  Common Words',
      'pt': 'Capítulo 1: Palavras Comuns',
    },
    'axryazi0': {
      'en': 'Chapter 2:  Animals',
      'pt': 'Capítulo 2: Animais',
    },
    'qt1yps90': {
      'en': 'Download',
      'pt': 'Download',
    },
    'xswjx40s': {
      'en': 'Home',
      'pt': 'Lar',
    },
    'ksbwzxnc': {
      'en': 'Program',
      'pt': 'Programa',
    },
    '0k56yu2r': {
      'en': 'Downloads',
      'pt': 'Transferências',
    },
    'iggeneif': {
      'en': 'Profile',
      'pt': 'Perfil',
    },
    'yjymeau5': {
      'en': 'Portuguese (Course)',
      'pt': 'Português (Curso)',
    },
    'k9gauj0u': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // Portuguese-Chapter1
  {
    '8o7qgyqa': {
      'en': 'Common Words',
      'pt': 'Palavras comuns',
    },
    '18p8mhlj': {
      'en': 'Task 1',
      'pt': 'Tarefa 1',
    },
    'e5ai1bz1': {
      'en': 'Print',
      'pt': 'Imprimir',
    },
    'mlr0dsgf': {
      'en': 'Download',
      'pt': 'Download',
    },
    '8v9cbm78': {
      'en': 'Home',
      'pt': 'Lar',
    },
    'vqp3q1sb': {
      'en': 'Program',
      'pt': 'Programa',
    },
    'yb3bwqlw': {
      'en': 'Downloads',
      'pt': 'Transferências',
    },
    '2a9puu4l': {
      'en': 'Profile',
      'pt': 'Perfil',
    },
    'w50lx2dj': {
      'en': 'Portuguese - Chapter 1',
      'pt': 'Português - Capítulo 1',
    },
    '366iwge9': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // Kikongo-Portuguese-Dictionary
  {
    'hir2nbt7': {
      'en': 'Search',
      'pt': 'Procurar',
    },
    'xvexx2l6': {
      'en': 'Option 1',
      'pt': 'Opção 1',
    },
    'tvae8y5c': {
      'en': 'Home',
      'pt': 'Lar',
    },
    'vbkn5w50': {
      'en': 'Program',
      'pt': 'Programa',
    },
    'rjohevvr': {
      'en': 'Downloads',
      'pt': 'Transferências',
    },
    'm8ru0p2c': {
      'en': 'Profile',
      'pt': 'Perfil',
    },
    '6pokjx7s': {
      'en': 'Kikongo-Portuguese (Dictionary)',
      'pt': 'Kikongo-Português (Dicionário)',
    },
    'cev8mq5z': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // Kikongo-Course
  {
    's5nx605v': {
      'en': 'Let’s improve and grow together, step by step!',
      'pt': 'Vamos melhorar e crescer juntos, passo a passo!',
    },
    'iwg9ski3': {
      'en': 'Chapter 1:  Basic phrases',
      'pt': 'Capítulo 1: Frases básicas',
    },
    'oagr8mlx': {
      'en': 'Print',
      'pt': 'Imprimir',
    },
    'ge0ghee6': {
      'en': 'Chapter 2:  Animals',
      'pt': 'Capítulo 2: Animais',
    },
    'r6wefnd8': {
      'en': 'Print',
      'pt': 'Imprimir',
    },
    're9au96y': {
      'en': 'Chapter 3: Food',
      'pt': 'Capítulo 3: Comida',
    },
    'mny1ceju': {
      'en': 'Print',
      'pt': 'Imprimir',
    },
    'vreoxtqp': {
      'en': 'Download',
      'pt': 'Download',
    },
    'oox1yrgy': {
      'en': 'Home',
      'pt': 'Lar',
    },
    'dtsek3i3': {
      'en': 'Program',
      'pt': 'Programa',
    },
    'jogfs89p': {
      'en': 'Downloads',
      'pt': 'Transferências',
    },
    'ysg2c4mo': {
      'en': 'Profile',
      'pt': 'Perfil',
    },
    'pfybnck1': {
      'en': 'Kikongo (Course)',
      'pt': 'Kikongo (Curso)',
    },
    'o856zcd7': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // Kikongo-Chapter1
  {
    '4mpst6uj': {
      'en': 'Basic Phrases',
      'pt': 'Frases básicas',
    },
    '92zum4h3': {
      'en': 'Task 1',
      'pt': 'Tarefa 1',
    },
    'pxl5t42l': {
      'en': 'Print',
      'pt': 'Imprimir',
    },
    'nbnnrshp': {
      'en': 'Task 2',
      'pt': 'Tarefa 2',
    },
    '46keuf2p': {
      'en': 'Print',
      'pt': 'Imprimir',
    },
    '3pfpqtnv': {
      'en': 'Task 3',
      'pt': 'Tarefa 3',
    },
    '6157yzu7': {
      'en': 'Print',
      'pt': 'Imprimir',
    },
    'jys9xmes': {
      'en': 'Download',
      'pt': 'Download',
    },
    '0r33h1dp': {
      'en': 'Home',
      'pt': 'Lar',
    },
    'z9hhzcw1': {
      'en': 'Program',
      'pt': 'Programa',
    },
    'a8mnxyq0': {
      'en': 'Downloads',
      'pt': 'Transferências',
    },
    'mggoe7hh': {
      'en': 'Profile',
      'pt': 'Perfil',
    },
    'vgqumnuw': {
      'en': 'Kikongo - Chapter 1',
      'pt': 'Kikongo - Capítulo 1',
    },
    'y0n8b2is': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // test
  {
    'oidvcwfy': {
      'en': 'Page Title',
      'pt': 'Título da página',
    },
    'y33aphz6': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // Kikongo-C2-Task1-Q1
  {
    'ulemann4': {
      'en': 'Task 1',
      'pt': 'Tarefa 1',
    },
    '7xdtgw9a': {
      'en': 'Question 1',
      'pt': 'Questão 1',
    },
    'ndx3tv3l': {
      'en': ' /10',
      'pt': '/10',
    },
    'z9rshkz0': {
      'en': 'Question 1/10',
      'pt': 'Pergunta 1/10',
    },
    '9z7krp1x': {
      'en': 'Select an option',
      'pt': 'Selecione uma opção',
    },
    '8negmc6c': {
      'en': 'nsusu',
      'pt': 'nsusu',
    },
    'vgquisck': {
      'en': 'Galinha',
      'pt': 'Galinha',
    },
    'nuvdkwr8': {
      'en': 'Gato',
      'pt': 'Gato',
    },
    '18aukv0z': {
      'en': 'Lobo',
      'pt': 'Lobo',
    },
    '2v6l62ne': {
      'en': 'Peixe',
      'pt': 'Peixe',
    },
    'h6za8jxs': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // Kikongo-C2-Task1-Q2
  {
    'tctroo4o': {
      'en': 'Task 1',
      'pt': 'Tarefa 1',
    },
    'e1mmuefd': {
      'en': 'Question 2',
      'pt': 'Questão 2',
    },
    'fudnyfxu': {
      'en': ' /10',
      'pt': '/10',
    },
    'hr4mav5c': {
      'en': 'Question 1/10',
      'pt': 'Pergunta 1/10',
    },
    '0fcn67ky': {
      'en': 'Select an option',
      'pt': 'Selecione uma opção',
    },
    'y81b14px': {
      'en': 'mbizi a maza',
      'pt': 'mbizi a maza',
    },
    't2e9gq0l': {
      'en': 'Cão',
      'pt': 'Cão',
    },
    '1g78mbay': {
      'en': 'Lobo',
      'pt': 'Lobo',
    },
    'hmy093lq': {
      'en': 'Peixe',
      'pt': 'Peixe',
    },
    'gzq2wpmv': {
      'en': 'Gato',
      'pt': 'Gato',
    },
    'c7zfn6hp': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // Kikongo-Chapter2
  {
    '7ukf3q25': {
      'en': 'Animals',
      'pt': 'Animais',
    },
    's5akxg0n': {
      'en': 'Task 1',
      'pt': 'Tarefa 1',
    },
    '4jm3zn89': {
      'en': 'Print',
      'pt': 'Imprimir',
    },
    '6eo9t5iz': {
      'en': 'Task 2',
      'pt': 'Tarefa 2',
    },
    'sgqmmu76': {
      'en': 'Print',
      'pt': 'Imprimir',
    },
    'soloozsu': {
      'en': 'Task 3',
      'pt': 'Tarefa 3',
    },
    'e6d1ygh4': {
      'en': 'Print',
      'pt': 'Imprimir',
    },
    '0xzvcexh': {
      'en': 'Download',
      'pt': 'Download',
    },
    'shgcikq4': {
      'en': 'Home',
      'pt': 'Lar',
    },
    'bfafa5qf': {
      'en': 'Program',
      'pt': 'Programa',
    },
    '0b7pzxqj': {
      'en': 'Downloads',
      'pt': 'Transferências',
    },
    'cptb8cb1': {
      'en': 'Profile',
      'pt': 'Perfil',
    },
    'dteyxu5c': {
      'en': 'Kikongo - Chapter 2',
      'pt': 'Kikongo - Capítulo 2',
    },
    'm72g831s': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // Portugues-C2-Task1-Q1
  {
    'smrc5q9i': {
      'en': 'Task 1',
      'pt': 'Tarefa 1',
    },
    '35kukr5x': {
      'en': 'Question 1',
      'pt': 'Questão 1',
    },
    '1cwbhwqj': {
      'en': ' /10',
      'pt': '/10',
    },
    'lmpk8o3f': {
      'en': 'Question 1/10',
      'pt': 'Pergunta 1/10',
    },
    'qq8eewi7': {
      'en': 'Select an option',
      'pt': 'Selecione uma opção',
    },
    'nni5fa86': {
      'en': 'Galinha',
      'pt': 'Galinha',
    },
    '6dgr45et': {
      'en': 'mbwa',
      'pt': 'MBWA',
    },
    '2se75vvq': {
      'en': 'nsunsu',
      'pt': 'nsunsu',
    },
    '2l5egvui': {
      'en': 'nyau',
      'pt': 'nyau',
    },
    '3ytj2l1h': {
      'en': 'mbizi a maza',
      'pt': 'mbizi a maza',
    },
    'xz7mbzns': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // Portuguese-C2-Task1-Q2
  {
    'lhpfuijx': {
      'en': 'Task 1',
      'pt': 'Tarefa 1',
    },
    'lf5wvwq4': {
      'en': 'Question 2',
      'pt': 'Questão 2',
    },
    '5hdqb51c': {
      'en': ' /10',
      'pt': '/10',
    },
    'bm3ttnnb': {
      'en': 'Question 1/10',
      'pt': 'Pergunta 1/10',
    },
    'yow3qdnt': {
      'en': 'Select an option',
      'pt': 'Selecione uma opção',
    },
    '60fky92o': {
      'en': 'Peixe',
      'pt': 'Peixe',
    },
    'ftb884mw': {
      'en': 'mbwa',
      'pt': 'MBWA',
    },
    'qteu1z1u': {
      'en': 'dyevwa',
      'pt': 'Dyevwa',
    },
    '9o5lx7kk': {
      'en': 'mbizi a maza',
      'pt': 'mbizi a maza',
    },
    '0cvb01wa': {
      'en': 'nyau',
      'pt': 'nyau',
    },
    'sxjmfi8w': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // Portugues-C1-Task1-Q1
  {
    'i7162l2l': {
      'en': 'Task 1',
      'pt': 'Tarefa 1',
    },
    '7lghxn2u': {
      'en': 'Question 1',
      'pt': 'Questão 1',
    },
    '25ujk1jc': {
      'en': ' /10',
      'pt': '/10',
    },
    'n74pao1z': {
      'en': 'Question 1/10',
      'pt': 'Pergunta 1/10',
    },
    'ewyus70b': {
      'en': 'Select an option',
      'pt': 'Selecione uma opção',
    },
    'wl0mb3xj': {
      'en': 'Bom dia',
      'pt': 'Bom dia',
    },
    'l6z9n2sq': {
      'en': 'teke',
      'pt': 'teke',
    },
    'av37roe0': {
      'en': 'Nkutu',
      'pt': 'Nkutu',
    },
    'ybjmcwbt': {
      'en': 'Mote',
      'pt': 'Mote',
    },
    'lk9izmdc': {
      'en': 'no ledi e',
      'pt': 'sem ledi e',
    },
    'lu1qdxjr': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // Portugues-C1-Task1-Q2
  {
    'l34gwio6': {
      'en': 'Task 1',
      'pt': 'Tarefa 1',
    },
    'vpm7c1qk': {
      'en': 'Question 2',
      'pt': 'Questão 2',
    },
    'iak7jq1i': {
      'en': ' /10',
      'pt': '/10',
    },
    'muu1ummm': {
      'en': 'Question 1/10',
      'pt': 'Pergunta 1/10',
    },
    'vuqyuycu': {
      'en': 'Select an option',
      'pt': 'Selecione uma opção',
    },
    'si9b4nf9': {
      'en': 'Boa tarde',
      'pt': 'Boa tarde',
    },
    'kcxqcaht': {
      'en': 'teke',
      'pt': 'teke',
    },
    'ywbwnrka': {
      'en': 'Mbote',
      'pt': 'Mbote',
    },
    'r0e0oz69': {
      'en': 'no nangini e',
      'pt': 'não nangini e',
    },
    '0t2f7pkm': {
      'en': 'mboma',
      'pt': 'mboma',
    },
    'tpd2fx2y': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // Portugues-C1-Task1-Q3
  {
    'wa0sl4ev': {
      'en': 'Task 1',
      'pt': 'Tarefa 1',
    },
    'q7oxlar9': {
      'en': 'Question 3',
      'pt': 'Questão 3',
    },
    '2g2uazak': {
      'en': ' /10',
      'pt': '/10',
    },
    '1z9c0hjn': {
      'en': 'Question 1/10',
      'pt': 'Pergunta 1/10',
    },
    'r5zyakue': {
      'en': 'Select an option',
      'pt': 'Selecione uma opção',
    },
    'gagk6duc': {
      'en': 'Escola',
      'pt': 'Escola',
    },
    '0yvmtffi': {
      'en': 'Chicola',
      'pt': 'Chicola',
    },
    '3s2i411v': {
      'en': 'Mbote',
      'pt': 'Mbote',
    },
    'xfvqkufx': {
      'en': 'Mboma',
      'pt': 'Mboma',
    },
    'qc928jes': {
      'en': 'Meke',
      'pt': 'Meke',
    },
    'e92vspj8': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // Portugues-C1-Task1-Q4
  {
    'f913gi7s': {
      'en': 'Task 1',
      'pt': 'Tarefa 1',
    },
    'rvew62d8': {
      'en': 'Question 4',
      'pt': 'Questão 4',
    },
    'swduwn7i': {
      'en': ' /10',
      'pt': '/10',
    },
    'g383smj4': {
      'en': 'Question 1/10',
      'pt': 'Pergunta 1/10',
    },
    't4bz6m6e': {
      'en': 'Select an option',
      'pt': 'Selecione uma opção',
    },
    'whiyg8k5': {
      'en': 'Professor',
      'pt': 'Professor',
    },
    'd4pvz6e1': {
      'en': 'Nguame',
      'pt': 'Nguame',
    },
    'ldpebon0': {
      'en': 'Mboma',
      'pt': 'Mboma',
    },
    'mw629760': {
      'en': 'Meke',
      'pt': 'Meke',
    },
    'ttn77nqu': {
      'en': 'Nlongui',
      'pt': 'Nlongui',
    },
    'bttatatr': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // Portugues-C1-Task1-Q5
  {
    'e6v2nffb': {
      'en': 'Task 1',
      'pt': 'Tarefa 1',
    },
    'tje3ydo7': {
      'en': 'Question 5',
      'pt': 'Questão 5',
    },
    'zbo0hp8f': {
      'en': ' /10',
      'pt': '/10',
    },
    '3t4qq7j0': {
      'en': 'Question 1/10',
      'pt': 'Pergunta 1/10',
    },
    'xog7eio6': {
      'en': 'Select an option',
      'pt': 'Selecione uma opção',
    },
    '339m2j01': {
      'en': 'Pai',
      'pt': 'Pai',
    },
    't267x5ze': {
      'en': 'Ntondele',
      'pt': 'Ntondele',
    },
    'zm2bd66h': {
      'en': 'Mboma',
      'pt': 'Mboma',
    },
    'v5php44h': {
      'en': 'Tata',
      'pt': 'Tata',
    },
    'gc8ox1ri': {
      'en': 'Meke',
      'pt': 'Meke',
    },
    'y09nfape': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // Portugues-C1-Task1-Q6
  {
    'q535ta3j': {
      'en': 'Task 1',
      'pt': 'Tarefa 1',
    },
    'aajqfnu1': {
      'en': 'Question 6',
      'pt': 'Questão 6',
    },
    'nionratu': {
      'en': ' /10',
      'pt': '/10',
    },
    'r7kkfo30': {
      'en': 'Question 1/10',
      'pt': 'Pergunta 1/10',
    },
    'ke3ouplm': {
      'en': 'Select an option',
      'pt': 'Selecione uma opção',
    },
    '65t5ybue': {
      'en': 'Mãe',
      'pt': 'Mãe',
    },
    'zqlfoq9o': {
      'en': 'Cuzeca',
      'pt': 'Cuzeca',
    },
    '2cw5tfnr': {
      'en': 'Nkwa',
      'pt': 'Nkwa',
    },
    '3cte00rx': {
      'en': 'Vutuca',
      'pt': 'Vutuca',
    },
    '5yicyvx0': {
      'en': 'Nsunsu',
      'pt': 'Nsunsu',
    },
    'pvne66ak': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // Portugues-C1-Task1-Q7
  {
    'dzt9j6x2': {
      'en': 'Task 1',
      'pt': 'Tarefa 1',
    },
    'lm17nlvr': {
      'en': 'Question 7',
      'pt': 'Questão 7',
    },
    'db0pq3x2': {
      'en': ' /10',
      'pt': '/10',
    },
    'iwv1nvd9': {
      'en': 'Question 1/10',
      'pt': 'Pergunta 1/10',
    },
    'u2gyscjx': {
      'en': 'Select an option',
      'pt': 'Selecione uma opção',
    },
    'k2zfej18': {
      'en': 'Sim',
      'pt': 'Sim',
    },
    'amnapkv7': {
      'en': 'Nsunsu',
      'pt': 'Nsunsu',
    },
    'v2xi7yai': {
      'en': 'Eyó',
      'pt': 'Eyó',
    },
    'e516670q': {
      'en': 'Vutuca',
      'pt': 'Vutuca',
    },
    '67goichp': {
      'en': 'Ngueta',
      'pt': 'Ngueta',
    },
    '5c62aq25': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // Portugues-C1-Task1-Q8
  {
    '01rplqsz': {
      'en': 'Task 1',
      'pt': 'Tarefa 1',
    },
    '1drjwbht': {
      'en': 'Question 8',
      'pt': 'Questão 8',
    },
    'o0w4yytv': {
      'en': ' /10',
      'pt': '/10',
    },
    'zwb03ylc': {
      'en': 'Question 1/10',
      'pt': 'Pergunta 1/10',
    },
    '63vkqit8': {
      'en': 'Select an option',
      'pt': 'Selecione uma opção',
    },
    'lovbcd1w': {
      'en': 'Estudar',
      'pt': 'Estudar',
    },
    'jqee405f': {
      'en': 'Ntondele',
      'pt': 'Ntondele',
    },
    'dl2a830b': {
      'en': 'Eyó',
      'pt': 'Eyó',
    },
    '2e1597q2': {
      'en': 'Kudilonga',
      'pt': 'Kudilonga',
    },
    'gcgld6ft': {
      'en': 'Vutuca',
      'pt': 'Vutuca',
    },
    '3xonikym': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // Portugues-C1-Task1-Q9
  {
    '0qrdwqnf': {
      'en': 'Task 1',
      'pt': 'Tarefa 1',
    },
    '34fqw1x8': {
      'en': 'Question 9',
      'pt': 'Questão 9',
    },
    'sfqs4ftd': {
      'en': ' /10',
      'pt': '/10',
    },
    'vxanmgpk': {
      'en': 'Question 1/10',
      'pt': 'Pergunta 1/10',
    },
    'h629gng5': {
      'en': 'Select an option',
      'pt': 'Selecione uma opção',
    },
    '55vgo5py': {
      'en': 'Obrigado',
      'pt': 'Obrigado',
    },
    'rb1jim55': {
      'en': 'Tata',
      'pt': 'Tata',
    },
    '6y5wxxa1': {
      'en': 'Meia',
      'pt': 'Meia',
    },
    '22d7y5m2': {
      'en': 'Eyó',
      'pt': 'Eyó',
    },
    'hvh5yaa7': {
      'en': 'Ntondele',
      'pt': 'Ntondele',
    },
    'o6qg0bgc': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // Portugues-C1-Task1-Q10
  {
    'r5usfp87': {
      'en': 'Task 1',
      'pt': 'Tarefa 1',
    },
    'rm9rufyi': {
      'en': 'Question 10',
      'pt': 'Questão 10',
    },
    'ypghr8lz': {
      'en': ' /10',
      'pt': '/10',
    },
    '3boogwq7': {
      'en': 'Question 1/10',
      'pt': 'Pergunta 1/10',
    },
    'gvp85fa4': {
      'en': 'Select an option',
      'pt': 'Selecione uma opção',
    },
    'nzvbvhjv': {
      'en': 'Não',
      'pt': 'Não',
    },
    'l2fgpjrj': {
      'en': 'Nguame',
      'pt': 'Nguame',
    },
    'j5kw0cj9': {
      'en': 'Vutuca',
      'pt': 'Vutuca',
    },
    '9sdfpuqa': {
      'en': 'Eyó',
      'pt': 'Eyó',
    },
    'hzyak9xh': {
      'en': 'Madia',
      'pt': 'Madia',
    },
    '58s2fjjv': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // Portuguese-Chapter2
  {
    '63fbcuw7': {
      'en': 'Animals',
      'pt': 'Animais',
    },
    'e9c9bohm': {
      'en': 'Task 1',
      'pt': 'Tarefa 1',
    },
    'r0qomri7': {
      'en': 'Print',
      'pt': 'Imprimir',
    },
    '64ce5na8': {
      'en': 'Download',
      'pt': 'Download',
    },
    'jgjgi8nn': {
      'en': 'Home',
      'pt': 'Lar',
    },
    '617pdo42': {
      'en': 'Program',
      'pt': 'Programa',
    },
    'w3mlf7ju': {
      'en': 'Downloads',
      'pt': 'Transferências',
    },
    'zz040k50': {
      'en': 'Profile',
      'pt': 'Perfil',
    },
    'boo3aqcz': {
      'en': 'Portuguese - Chapter 2',
      'pt': 'Português - Capítulo 2',
    },
    'x24gcyxb': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // Pdf_viewer
  {
    'u9js2gmq': {
      'en': 'Document Viewer',
      'pt': 'Visualizador de documentos',
    },
    '9gpszmod': {
      'en': 'Documents to Print',
      'pt': 'Documentos para imprimir',
    },
    'q35y3lkt': {
      'en': 'Select All',
      'pt': 'Selecionar tudo',
    },
    'xv6udy9e': {
      'en': 'Available Documents',
      'pt': 'Documentos disponíveis',
    },
    'dwg23t8u': {
      'en': 'Task1.pdf',
      'pt': 'Tarefa1.pdf',
    },
    '7gh2bmys': {
      'en': 'Added: 03/15/2023 • 2.4 MB',
      'pt': 'Adicionado: 15/03/2023 • 2,4 MB',
    },
    '5gqqyrmv': {
      'en': 'Contract_2023.pdf',
      'pt': 'Contrato_2023.pdf',
    },
    'w96ymquz': {
      'en': 'Added: 01/10/2023 • 3.7 MB',
      'pt': 'Adicionado: 01/10/2023 • 3,7 MB',
    },
    '2cnoezod': {
      'en': 'Report_Q1_2023.pdf',
      'pt': 'Relatório_Q1_2023.pdf',
    },
    'af2786nu': {
      'en': 'Added: 04/02/2023 • 1.8 MB',
      'pt': 'Adicionado: 04/02/2023 • 1,8 MB',
    },
    '82qtqbjn': {
      'en': 'Print Selected Documents',
      'pt': 'Imprimir documentos selecionados',
    },
  },
  // Pdf_viewer_solution
  {
    'ofec98sp': {
      'en': 'Document Viewer',
      'pt': 'Visualizador de documentos',
    },
    '4i3kpg25': {
      'en': 'Documents to Print',
      'pt': 'Documentos para imprimir',
    },
    'z9eqy5g7': {
      'en': 'Select All',
      'pt': 'Selecionar tudo',
    },
    'hgya97u3': {
      'en': 'Available Documents',
      'pt': 'Documentos disponíveis',
    },
    'fzjvhwlq': {
      'en': 'Task1.pdf',
      'pt': 'Tarefa1.pdf',
    },
    'w8f5zw99': {
      'en': 'Added: 03/15/2023 • 2.4 MB',
      'pt': 'Adicionado: 15/03/2023 • 2,4 MB',
    },
    'yk9wfbvt': {
      'en': 'Contract_2023.pdf',
      'pt': 'Contrato_2023.pdf',
    },
    'ww2mxzm3': {
      'en': 'Added: 01/10/2023 • 3.7 MB',
      'pt': 'Adicionado: 01/10/2023 • 3,7 MB',
    },
    'iymdqojd': {
      'en': 'Report_Q1_2023.pdf',
      'pt': 'Relatório_Q1_2023.pdf',
    },
    'czdu37bs': {
      'en': 'Added: 04/02/2023 • 1.8 MB',
      'pt': 'Adicionado: 04/02/2023 • 1,8 MB',
    },
    'lus0igx2': {
      'en': 'Print Selected Documents',
      'pt': 'Imprimir documentos selecionados',
    },
  },
  // Portuguese-C2-Task1-Q3
  {
    '7rkvm5yz': {
      'en': 'Task 1',
      'pt': 'Tarefa 1',
    },
    'yyncsn32': {
      'en': 'Question 3',
      'pt': 'Questão 3',
    },
    't26gsfiz': {
      'en': ' /10',
      'pt': '/10',
    },
    'qpd8ldum': {
      'en': 'Question 1/10',
      'pt': 'Pergunta 1/10',
    },
    'zr2hpz5z': {
      'en': 'Select an option',
      'pt': 'Selecione uma opção',
    },
    'lg1kun24': {
      'en': 'Vaca',
      'pt': 'Vaca',
    },
    'dedutc5q': {
      'en': 'dyevwa',
      'pt': 'Dyevwa',
    },
    'olcwyfb0': {
      'en': 'Ngombe',
      'pt': 'Ngombe',
    },
    'exckp4l1': {
      'en': 'nyau',
      'pt': 'nyau',
    },
    '0jhez5nd': {
      'en': 'Nvula',
      'pt': 'Nvula',
    },
    '3uzt6vhh': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // Portuguese-C2-Task1-Q5
  {
    'nhb7yrha': {
      'en': 'Task 1',
      'pt': 'Tarefa 1',
    },
    'gij7dp47': {
      'en': 'Question 5',
      'pt': 'Questão 5',
    },
    'rf6oxsd2': {
      'en': ' /10',
      'pt': '/10',
    },
    '86db6vf4': {
      'en': 'Question 1/10',
      'pt': 'Pergunta 1/10',
    },
    'n5wihlxs': {
      'en': 'Select an option',
      'pt': 'Selecione uma opção',
    },
    '03yrsawf': {
      'en': 'Gato',
      'pt': 'Gato',
    },
    '4b9xz4vx': {
      'en': 'Dyevwa',
      'pt': 'Dyevwa',
    },
    '1i6suod0': {
      'en': 'Candala',
      'pt': 'Candala',
    },
    's1xgv51a': {
      'en': 'Tuia',
      'pt': 'Tuia',
    },
    'mld83ed7': {
      'en': 'Cuzeca',
      'pt': 'Cuzeca',
    },
    '1tide6sx': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // Portuguese-C2-Task1-Q6
  {
    'lxbpv54x': {
      'en': 'Task 1',
      'pt': 'Tarefa 1',
    },
    'oflyyr1r': {
      'en': 'Question 6',
      'pt': 'Questão 6',
    },
    'cj8zkyzl': {
      'en': ' /10',
      'pt': '/10',
    },
    'us2pedo6': {
      'en': 'Question 1/10',
      'pt': 'Pergunta 1/10',
    },
    'snusa5yq': {
      'en': 'Select an option',
      'pt': 'Selecione uma opção',
    },
    'qzqdnaqw': {
      'en': 'Tartaruga',
      'pt': 'Tartaruga',
    },
    'xevmh8xr': {
      'en': 'Teke',
      'pt': 'Teke',
    },
    'bij9b3wz': {
      'en': 'Cuzeca',
      'pt': 'Cuzeca',
    },
    'pha0boez': {
      'en': 'Nzo',
      'pt': 'Nzo',
    },
    'eg84ojrd': {
      'en': 'Kafulu',
      'pt': 'Kafulu',
    },
    'hixqrzlm': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // Portuguese-C2-Task1-Q7
  {
    'cr8v2msr': {
      'en': 'Task 1',
      'pt': 'Tarefa 1',
    },
    'j9ymlvjk': {
      'en': 'Question 7',
      'pt': 'Questão 7',
    },
    'ca5surr4': {
      'en': ' /10',
      'pt': '/10',
    },
    '3l63zrc5': {
      'en': 'Question 1/10',
      'pt': 'Pergunta 1/10',
    },
    '3ekqzzk5': {
      'en': 'Select an option',
      'pt': 'Selecione uma opção',
    },
    'a8wt4tdr': {
      'en': 'Coelho',
      'pt': 'Coelho',
    },
    'peu74wrb': {
      'en': 'Cuzeca',
      'pt': 'Cuzeca',
    },
    'i2kqndv7': {
      'en': 'Kudilonga',
      'pt': 'Kudilonga',
    },
    'is01guc3': {
      'en': 'Ngueta',
      'pt': 'Ngueta',
    },
    'x1zkamho': {
      'en': 'Lapin',
      'pt': 'Lapin',
    },
    '2l7r0lek': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // Portuguese-C2-Task1-Q8
  {
    'mw3ub80w': {
      'en': 'Task 1',
      'pt': 'Tarefa 1',
    },
    'nuf4adbf': {
      'en': 'Question 8',
      'pt': 'Questão 8',
    },
    '0d6giaxq': {
      'en': ' /10',
      'pt': '/10',
    },
    'xm39kjcr': {
      'en': 'Question 1/10',
      'pt': 'Pergunta 1/10',
    },
    't6xhgocz': {
      'en': 'Select an option',
      'pt': 'Selecione uma opção',
    },
    'gyqhbt58': {
      'en': 'Passáro',
      'pt': 'Passaro',
    },
    'kfbjmwoe': {
      'en': 'Tata',
      'pt': 'Tata',
    },
    '8mlxjud6': {
      'en': 'Ndeke',
      'pt': 'Ndeke',
    },
    '1jr6ci94': {
      'en': 'Kudilonga',
      'pt': 'Kudilonga',
    },
    'bwne8p15': {
      'en': 'Meia',
      'pt': 'Meia',
    },
    'g1ro75xt': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // Portuguese-C2-Task1-Q9
  {
    'spqq52rf': {
      'en': 'Task 1',
      'pt': 'Tarefa 1',
    },
    '56x7x54y': {
      'en': 'Question 9',
      'pt': 'Questão 9',
    },
    'xqoieyis': {
      'en': ' /10',
      'pt': '/10',
    },
    'ihm1f375': {
      'en': 'Question 1/10',
      'pt': 'Pergunta 1/10',
    },
    'cmhhqwtf': {
      'en': 'Select an option',
      'pt': 'Selecione uma opção',
    },
    '2j6n5f8k': {
      'en': 'Porco',
      'pt': 'Porco',
    },
    '3z9nd7xa': {
      'en': 'Ngulu',
      'pt': 'Ngulu',
    },
    'iwpb8q4o': {
      'en': 'Tata',
      'pt': 'Tata',
    },
    'yesabhnb': {
      'en': 'Nkwa',
      'pt': 'Nkwa',
    },
    '92rid1j2': {
      'en': 'Teke',
      'pt': 'Teke',
    },
    'q6tc7bnf': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // Portuguese-C2-Task1-Q10
  {
    '3zi2843g': {
      'en': 'Task 1',
      'pt': 'Tarefa 1',
    },
    'sut4708j': {
      'en': 'Question 10',
      'pt': 'Questão 10',
    },
    'tlwvjuh1': {
      'en': ' /10',
      'pt': '/10',
    },
    'von2cce7': {
      'en': 'Question 1/10',
      'pt': 'Pergunta 1/10',
    },
    'eqleei9z': {
      'en': 'Select an option',
      'pt': 'Selecione uma opção',
    },
    'fz5pka3g': {
      'en': 'Animal',
      'pt': 'Animal',
    },
    'gbvs49ow': {
      'en': 'Candala',
      'pt': 'Candala',
    },
    'tle3wx5b': {
      'en': 'Mbwa',
      'pt': 'Mbwa',
    },
    'wcy3h3ze': {
      'en': 'Madia',
      'pt': 'Madia',
    },
    '3cl3ei7r': {
      'en': 'Mbigui',
      'pt': 'Mbigui',
    },
    '04z00aiv': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // Portuguese-C2-Task1-Q4
  {
    '830aj8ul': {
      'en': 'Task 1',
      'pt': 'Tarefa 1',
    },
    '4lenbdum': {
      'en': 'Question 4',
      'pt': 'Questão 4',
    },
    'jtywuol9': {
      'en': ' /10',
      'pt': '/10',
    },
    'fa7ngekq': {
      'en': 'Question 1/10',
      'pt': 'Pergunta 1/10',
    },
    'xz9xe1hn': {
      'en': 'Select an option',
      'pt': 'Selecione uma opção',
    },
    'a17ier6w': {
      'en': 'Cão',
      'pt': 'Cão',
    },
    's4dsjtz9': {
      'en': 'Mbwa',
      'pt': 'Mbwa',
    },
    'j9038472': {
      'en': 'Muanha',
      'pt': 'Muanha',
    },
    'dlc6j546': {
      'en': 'Dyevwa',
      'pt': 'Dyevwa',
    },
    '9va0c1m2': {
      'en': 'Nzo',
      'pt': 'Nzo',
    },
    'q7g2jqyd': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // Kimbundo-Portuguese-Dictionary
  {
    '0y6dh149': {
      'en': 'Search',
      'pt': 'Procurar',
    },
    't9a8yyh2': {
      'en': 'Option 1',
      'pt': 'Opção 1',
    },
    '4yp3ayef': {
      'en': 'Home',
      'pt': 'Lar',
    },
    'rb3n2gs8': {
      'en': 'Program',
      'pt': 'Programa',
    },
    '9lgh2ylh': {
      'en': 'Downloads',
      'pt': 'Transferências',
    },
    'x23okwwy': {
      'en': 'Profile',
      'pt': 'Perfil',
    },
    'e7oynpt9': {
      'en': 'Kimbundo-Portuguese (Dictionary)',
      'pt': 'Kimbundo-Português (Dicionário)',
    },
    'jt2jv1dn': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // Contribute
  {
    'gf96gw0m': {
      'en': 'Add New Word',
      'pt': 'Adicionar nova palavra',
    },
    'zrer7nrm': {
      'en': 'Verify Translation',
      'pt': 'Verificar tradução',
    },
    '8xqbzaoc': {
      'en': 'Home',
      'pt': 'Lar',
    },
    'lzifums0': {
      'en': 'Program',
      'pt': 'Programa',
    },
    'wnojpssx': {
      'en': 'Downloads',
      'pt': 'Transferências',
    },
    'w5icxx1v': {
      'en': 'Profile',
      'pt': 'Perfil',
    },
    'y0l9c5ay': {
      'en': 'Button',
      'pt': 'Botão',
    },
    'j63vvrof': {
      'en': 'Contribute',
      'pt': 'Contribuir',
    },
    'se456wi5': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // AddNewWord
  {
    'e89w2n2m': {
      'en':
          'Please write down the word pair, word type and definition is optional',
      'pt':
          'Por favor, escreva o par de palavras, o tipo de palavra e a definição são opcionais',
    },
    'pq51ctyc': {
      'en': 'Portuguese*',
      'pt': 'Português*',
    },
    'hubblw7m': {
      'en': 'Kikongo*',
      'pt': 'Kikongo*',
    },
    '2y6hokfu': {
      'en': 'Word type',
      'pt': 'Tipo de palavra',
    },
    'nxprvi1v': {
      'en': 'Definition (Portuguese)',
      'pt': 'Definição (Português)',
    },
    't2mjj0uj': {
      'en': 'Add Word',
      'pt': 'Adicionar palavra',
    },
    'yotb1pqn': {
      'en': 'Button',
      'pt': 'Botão',
    },
    'jrfekmyy': {
      'en': 'Add New Word',
      'pt': 'Adicionar nova palavra',
    },
    '1xjkj3u2': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // VerifyTranslations
  {
    '75fuwr2y': {
      'en': 'Contribute',
      'pt': 'Contribuir',
    },
    '3jijeahd': {
      'en': 'Verify Translation',
      'pt': 'Verificar tradução',
    },
    '2x24bjj8': {
      'en': 'Question 1/10',
      'pt': 'Pergunta 1/10',
    },
    '16t4dcbl': {
      'en': 'Animal',
      'pt': 'Ajuda',
    },
    'dsal3vr0': {
      'en': 'Kikongo',
      'pt': 'Kikongo',
    },
    'ndp354y7': {
      'en': 'Mbigi',
      'pt': 'Lusadisu',
    },
    '65p2xucb': {
      'en': 'Confirm',
      'pt': 'Confirmar',
    },
    'z5iqrvro': {
      'en': 'Not Sure',
      'pt': 'Não tenho certeza',
    },
    'hv1qur76': {
      'en': 'Reject',
      'pt': 'Rejeitar',
    },
    'yqu1s4gg': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // Kikongo-Portuguese-DictionaryCopy
  {
    'jncrdy2w': {
      'en': 'Search',
      'pt': 'Procurar',
    },
    '2fk6lpi4': {
      'en': 'Option 1',
      'pt': 'Opção 1',
    },
    '0bgikabk': {
      'en': 'Home',
      'pt': 'Lar',
    },
    'enm8gvlr': {
      'en': 'Program',
      'pt': 'Programa',
    },
    'ozdoana3': {
      'en': 'Downloads',
      'pt': 'Transferências',
    },
    'lyqncfu4': {
      'en': 'Profile',
      'pt': 'Perfil',
    },
    'bohzm44z': {
      'en': 'Kikongo-Portuguese (Dictionary)',
      'pt': 'Kikongo-Português (Dicionário)',
    },
    'k6ah0do2': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // VerifyWord
  {
    'cqr4esjw': {
      'en': 'Search',
      'pt': 'Procurar',
    },
    'aco9gh5h': {
      'en': 'Option 1',
      'pt': 'Opção 1',
    },
    '6awb8x7y': {
      'en': 'Write here the word you want to verify/reject (in Kikongo).',
      'pt': '',
    },
    'zlat8adr': {
      'en': 'Word in Kikongo',
      'pt': '',
    },
    '59my8xo5': {
      'en': 'Verify',
      'pt': '',
    },
    'wlhrhel3': {
      'en': 'Reject',
      'pt': '',
    },
    'oicu38ne': {
      'en': 'Home',
      'pt': 'Lar',
    },
    'senexb6p': {
      'en': 'Program',
      'pt': 'Programa',
    },
    'mqm5f3rb': {
      'en': 'Downloads',
      'pt': 'Transferências',
    },
    'obliyuyl': {
      'en': 'Profile',
      'pt': 'Perfil',
    },
    'tq6udsxr': {
      'en': 'Kikongo-Portuguese (Dictionary)',
      'pt': 'Kikongo-Português (Dicionário)',
    },
    'iucn6xli': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // VerifyWordCopy
  {
    'xeutwtrj': {
      'en': 'Search',
      'pt': 'Procurar',
    },
    'xk92rwow': {
      'en': 'Option 1',
      'pt': 'Opção 1',
    },
    'f9xtce74': {
      'en': 'Write here the word you want to verify/reject (in Kikongo).',
      'pt': '',
    },
    '837bo1fw': {
      'en': 'Word in Kikongo',
      'pt': '',
    },
    'khu1wh0o': {
      'en': 'Verify',
      'pt': '',
    },
    's9z0mppp': {
      'en': 'Reject',
      'pt': '',
    },
    '8ajpi3jz': {
      'en': 'Home',
      'pt': 'Lar',
    },
    'wfvg8dil': {
      'en': 'Program',
      'pt': 'Programa',
    },
    'gjl39sfz': {
      'en': 'Downloads',
      'pt': 'Transferências',
    },
    'pk43baeq': {
      'en': 'Profile',
      'pt': 'Perfil',
    },
    '0kht7guu': {
      'en': 'Kikongo-Portuguese (Dictionary)',
      'pt': 'Kikongo-Português (Dicionário)',
    },
    'ipifssgi': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // correct_answer
  {
    'p715fnqw': {
      'en': 'Correct Answer',
      'pt': 'Resposta correta',
    },
    'tpbdbdd4': {
      'en': 'Great job! You got it right.',
      'pt': 'Ótimo trabalho! Você acertou.',
    },
    'aigko5yr': {
      'en': 'Continue',
      'pt': 'Continuar',
    },
  },
  // wrong_answer
  {
    'pvjfzk56': {
      'en': 'Wrong Answer',
      'pt': 'Resposta errada',
    },
    '4imh9il6': {
      'en': 'You got it wrong!',
      'pt': 'Você entendeu errado!',
    },
    'snwesikp': {
      'en': 'Try again',
      'pt': 'Tentar novamente',
    },
  },
  // print_task_or_solution
  {
    'nqijy20s': {
      'en': 'What would you like to print?',
      'pt': 'O que você gostaria de imprimir?',
    },
    'dsk5u95g': {
      'en': 'Print Task',
      'pt': 'Tarefa de impressão',
    },
    'xa0c0pjo': {
      'en': 'Print Solution',
      'pt': 'Solução de impressão',
    },
  },
  // Dictionary_Word_Card
  {
    'gmc2mzxf': {
      'en': 'Água',
      'pt': 'Água',
    },
    'srg1sb5s': {
      'en': 'Meia – Water',
      'pt': 'Meia – Água',
    },
    'yht1nntv': {
      'en':
          'Líquido incolor, insípido e inodoro à temperatura ambiente, essencial para a vida, que compõe rios, lagos, mares, chuvas e organismos vivos.',
      'pt':
          'Líquido incolor, insípido e inodoro à temperatura ambiente, essencial para a vida, que compõe rios, lagos, éguas, chuvas e organismos vivos.',
    },
  },
  // thankYou
  {
    '2pg7kbbm': {
      'en': 'Thank you!',
      'pt': 'Obrigado!',
    },
    '2vnwfmaj': {
      'en': 'We appreciate your help!',
      'pt': 'Agradecemos sua ajuda!',
    },
    'gks0xh6g': {
      'en': 'Back',
      'pt': 'Voltar',
    },
  },
  // not_synching
  {
    '3xt8a879': {
      'en': 'No internet',
      'pt': 'Obrigado!',
    },
    'xxs9wwst': {
      'en': 'Please connect to internet.',
      'pt': 'Agradecemos sua ajuda!',
    },
    'p6yjzs9t': {
      'en': 'Back',
      'pt': 'Voltar',
    },
  },
  // synching
  {
    'e476q2qq': {
      'en': 'Synching now',
      'pt': 'Obrigado!',
    },
    'dltj0wh2': {
      'en': 'Please wait.',
      'pt': 'Agradecemos sua ajuda!',
    },
    'reovh4f1': {
      'en': 'Stop synchronising',
      'pt': 'Voltar',
    },
  },
  // Miscellaneous
  {
    'bn1rqzpz': {
      'en': 'TextField',
      'pt': 'Campo de texto',
    },
    'e4g8nn8r': {
      'en': '',
      'pt': '',
    },
    'yzrkiz6b': {
      'en': '',
      'pt': '',
    },
    'gyqeb127': {
      'en': '',
      'pt': '',
    },
    '8vf86ca6': {
      'en': '',
      'pt': '',
    },
    'gvdjcfv6': {
      'en': '',
      'pt': '',
    },
    '1xgzmtjd': {
      'en': '',
      'pt': '',
    },
    'lgoubt4l': {
      'en': '',
      'pt': '',
    },
    'kz8zc3we': {
      'en': '',
      'pt': '',
    },
    'w7vbqcy3': {
      'en': '',
      'pt': '',
    },
    'g2pnh6yz': {
      'en': '',
      'pt': '',
    },
    '3yfyhzah': {
      'en': '',
      'pt': '',
    },
    'r9mcykx8': {
      'en': '',
      'pt': '',
    },
    '3ealk9my': {
      'en': '',
      'pt': '',
    },
    'sztisj30': {
      'en': '',
      'pt': '',
    },
    'c472f7fa': {
      'en': '',
      'pt': '',
    },
    'zbxggyv4': {
      'en': '',
      'pt': '',
    },
    'drp8cvdk': {
      'en': '',
      'pt': '',
    },
    '4rixvx8z': {
      'en': '',
      'pt': '',
    },
    'aqte8byz': {
      'en': '',
      'pt': '',
    },
    'ye2k1pl5': {
      'en': '',
      'pt': '',
    },
    'y0hem8n3': {
      'en': '',
      'pt': '',
    },
    'fiyoi6ko': {
      'en': '',
      'pt': '',
    },
    'pdtryxjh': {
      'en': '',
      'pt': '',
    },
    '32toe7dv': {
      'en': '',
      'pt': '',
    },
    '3q7kuy3f': {
      'en': '',
      'pt': '',
    },
  },
].reduce((a, b) => a..addAll(b));
