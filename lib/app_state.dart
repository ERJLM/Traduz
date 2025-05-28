import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _progress = await secureStorage.getString('ff_progress') ?? _progress;
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_user') != null) {
        try {
          final serializedData =
              await secureStorage.getString('ff_user') ?? '{}';
          _user = UserStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      _DictionaryDemo = (await secureStorage.getStringList('ff_DictionaryDemo'))
              ?.map((x) {
                try {
                  return DictionaryWordStruct.fromSerializableMap(
                      jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _DictionaryDemo;
    });
    await _safeInitAsync(() async {
      _Words = await secureStorage.getStringList('ff_Words') ?? _Words;
    });
    await _safeInitAsync(() async {
      _DictionaryFirebase =
          (await secureStorage.getString('ff_DictionaryFirebase'))?.ref ??
              _DictionaryFirebase;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  String _progress = '0%';
  String get progress => _progress;
  set progress(String value) {
    _progress = value;
    secureStorage.setString('ff_progress', value);
  }

  void deleteProgress() {
    secureStorage.delete(key: 'ff_progress');
  }

  /// This variable represents a user.
  ///
  /// It contains all the relevant information about the user.
  UserStruct _user = UserStruct.fromSerializableMap(jsonDecode('{}'));
  UserStruct get user => _user;
  set user(UserStruct value) {
    _user = value;
    secureStorage.setString('ff_user', value.serialize());
  }

  void deleteUser() {
    secureStorage.delete(key: 'ff_user');
  }

  void updateUserStruct(Function(UserStruct) updateFn) {
    updateFn(_user);
    secureStorage.setString('ff_user', _user.serialize());
  }

  String _SearchWord = '';
  String get SearchWord => _SearchWord;
  set SearchWord(String value) {
    _SearchWord = value;
  }

  List<DictionaryWordStruct> _DictionaryDemo = [
    DictionaryWordStruct.fromSerializableMap(jsonDecode(
        '{\"Portuguese\":\"Água\",\"English\":\"Water\",\"Kikongo\":\"Meia\",\"wordType\":\"substantivo feminino\",\"definitionPortuguese\":\"Líquido incolor, insípido e inodoro à temperatura ambiente, essencial para a vida, que compõe rios, lagos, mares, chuvas e organismos vivos.\",\"Preview\":\"Água – Meia – Water, substantivo feminino, Líquido incolor, insípido e inodoro à temperatura ambiente, essencial para a vida, que compõe rios, lagos, mares, chuvas e organismos vivos.\"}')),
    DictionaryWordStruct.fromSerializableMap(jsonDecode(
        '{\"Portuguese\":\"Escola\",\"English\":\"School\",\"Kikongo\":\"Chicola\",\"wordType\":\"substantivo feminino\",\"definitionPortuguese\":\"Instituição dedicada ao ensino e à aprendizagem, onde alunos recebem formação intelectual, social e, muitas vezes, profissional, segundo programas e métodos pedagógicos.\",\"Preview\":\"Escola – Chicola – School\\nsubstantivo feminino\\nInstituição dedicada ao ensino e à aprendizagem, onde alunos recebem formação intelectual, social e, muitas vezes, profissional, segundo programas e métodos pedagógicos.\"}')),
    DictionaryWordStruct.fromSerializableMap(jsonDecode(
        '{\"Portuguese\":\"Estudar\",\"English\":\"To Study\",\"Kikongo\":\"Kudilonga\",\"Kimbundo\":\"Hello World\",\"wordType\":\"verbo transitivo e intransitivo\",\"definitionPortuguese\":\"Dedicar-se de forma sistemática à leitura, à observação ou à prática de um assunto com o objetivo de conhecer, compreender ou aprender algo.\",\"Preview\":\"Estudar – Kudilonga – To study\\nverbo transitivo e intransitivo\\nDedicar-se de forma sistemática à leitura, à observação ou à prática de um assunto com o objetivo de conhecer, compreender ou aprender algo.\"}')),
    DictionaryWordStruct.fromSerializableMap(jsonDecode(
        '{\"Portuguese\":\"Chuva\",\"English\":\"Rain\",\"Kikongo\":\"Nvula\",\"Kimbundo\":\"Hello World\",\"wordType\":\"substantivo feminino\",\"definitionPortuguese\":\"Precipitação atmosférica de gotas de água líquida que caem das nuvens sobre a superfície terrestre.\",\"Preview\":\"Chuva – Nvula – Rain\\nsubstantivo feminino\\nPrecipitação atmosférica de gotas de água líquida que caem das nuvens sobre a superfície terrestre.\"}')),
    DictionaryWordStruct.fromSerializableMap(jsonDecode(
        '{\"Portuguese\":\"Fogo\",\"English\":\"Fire\",\"Kikongo\":\"Túia\",\"Kimbundo\":\"Hello World\",\"wordType\":\"substantivo masculino\",\"definitionPortuguese\":\"Conjunto de chamas e calor produzido pela combustão de um material, resultado de uma reação química (oxidação) que libera energia luminosa e térmica.\",\"Preview\":\"Fogo – Túia – Fire\\nsubstantivo masculino\\nConjunto de chamas e calor produzido pela combustão de um material, resultado de uma reação química (oxidação) que libera energia luminosa e térmica.\"}')),
    DictionaryWordStruct.fromSerializableMap(jsonDecode(
        '{\"Portuguese\":\"Mãe\",\"English\":\"Mother\",\"Kikongo\":\"Nkwa\",\"Kimbundo\":\"Hello World\",\"wordType\":\"substantivo feminino\",\"definitionPortuguese\":\"Mulher que gerou, deu à luz ou criou um ou mais filhos; figura que simboliza cuidado, nutrição e proteção.\",\"Preview\":\"Mãe – Nkwa – Mother\\nsubstantivo feminino\\nMulher que gerou, deu à luz ou criou um ou mais filhos; figura que simboliza cuidado, nutrição e proteção.\"}')),
    DictionaryWordStruct.fromSerializableMap(jsonDecode(
        '{\"Portuguese\":\"Pai\",\"English\":\"Father\",\"Kikongo\":\"Tata\",\"Kimbundo\":\"Hello World\",\"wordType\":\"substantivo masculino\",\"definitionPortuguese\":\"Homem que gerou ou criou um ou mais filhos; figura associada a proteção, orientação e provisão na família.\",\"Preview\":\"Pai – Tata – Father\\nsubstantivo masculino\\nHomem que gerou ou criou um ou mais filhos; figura associada a proteção, orientação e provisão na família.\"}')),
    DictionaryWordStruct.fromSerializableMap(jsonDecode(
        '{\"Portuguese\":\"Animal\",\"English\":\"Animal\",\"Kikongo\":\"Mbigi\",\"Kimbundo\":\"Hello World\",\"wordType\":\"substantivo masculino\",\"definitionPortuguese\":\"Ser vivo pertencente ao reino Animalia, caracterizado por células sem parede celular, capacidade de locomoção voluntária (na maioria dos casos) e nutrição heterotrófica.\",\"Preview\":\"Animal – Mbigi – Animal\\nsubstantivo masculino\\nSer vivo pertencente ao reino Animalia, caracterizado por células sem parede celular, capacidade de locomoção voluntária (na maioria dos casos) e nutrição heterotrófica.\"}'))
  ];
  List<DictionaryWordStruct> get DictionaryDemo => _DictionaryDemo;
  set DictionaryDemo(List<DictionaryWordStruct> value) {
    _DictionaryDemo = value;
    secureStorage.setStringList(
        'ff_DictionaryDemo', value.map((x) => x.serialize()).toList());
  }

  void deleteDictionaryDemo() {
    secureStorage.delete(key: 'ff_DictionaryDemo');
  }

  void addToDictionaryDemo(DictionaryWordStruct value) {
    DictionaryDemo.add(value);
    secureStorage.setStringList('ff_DictionaryDemo',
        _DictionaryDemo.map((x) => x.serialize()).toList());
  }

  void removeFromDictionaryDemo(DictionaryWordStruct value) {
    DictionaryDemo.remove(value);
    secureStorage.setStringList('ff_DictionaryDemo',
        _DictionaryDemo.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromDictionaryDemo(int index) {
    DictionaryDemo.removeAt(index);
    secureStorage.setStringList('ff_DictionaryDemo',
        _DictionaryDemo.map((x) => x.serialize()).toList());
  }

  void updateDictionaryDemoAtIndex(
    int index,
    DictionaryWordStruct Function(DictionaryWordStruct) updateFn,
  ) {
    DictionaryDemo[index] = updateFn(_DictionaryDemo[index]);
    secureStorage.setStringList('ff_DictionaryDemo',
        _DictionaryDemo.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInDictionaryDemo(int index, DictionaryWordStruct value) {
    DictionaryDemo.insert(index, value);
    secureStorage.setStringList('ff_DictionaryDemo',
        _DictionaryDemo.map((x) => x.serialize()).toList());
  }

  String _wordClicked = '';
  String get wordClicked => _wordClicked;
  set wordClicked(String value) {
    _wordClicked = value;
  }

  List<String> _Words = ['Meia', 'Chicola', 'Kudilonga'];
  List<String> get Words => _Words;
  set Words(List<String> value) {
    _Words = value;
    secureStorage.setStringList('ff_Words', value);
  }

  void deleteWords() {
    secureStorage.delete(key: 'ff_Words');
  }

  void addToWords(String value) {
    Words.add(value);
    secureStorage.setStringList('ff_Words', _Words);
  }

  void removeFromWords(String value) {
    Words.remove(value);
    secureStorage.setStringList('ff_Words', _Words);
  }

  void removeAtIndexFromWords(int index) {
    Words.removeAt(index);
    secureStorage.setStringList('ff_Words', _Words);
  }

  void updateWordsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    Words[index] = updateFn(_Words[index]);
    secureStorage.setStringList('ff_Words', _Words);
  }

  void insertAtIndexInWords(int index, String value) {
    Words.insert(index, value);
    secureStorage.setStringList('ff_Words', _Words);
  }

  bool _addMyOwnTranslationInVerify = false;
  bool get addMyOwnTranslationInVerify => _addMyOwnTranslationInVerify;
  set addMyOwnTranslationInVerify(bool value) {
    _addMyOwnTranslationInVerify = value;
  }

  DocumentReference? _DictionaryFirebase;
  DocumentReference? get DictionaryFirebase => _DictionaryFirebase;
  set DictionaryFirebase(DocumentReference? value) {
    _DictionaryFirebase = value;
    value != null
        ? secureStorage.setString('ff_DictionaryFirebase', value.path)
        : secureStorage.remove('ff_DictionaryFirebase');
  }

  void deleteDictionaryFirebase() {
    secureStorage.delete(key: 'ff_DictionaryFirebase');
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
