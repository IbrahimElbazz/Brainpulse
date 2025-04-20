import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:brain_pulse/features/history/data/model/get_all_patients_response.dart';

class HiveService {
  static const String patientBoxName = 'patientBox';

  static Future<void> init() async {
    await Hive.initFlutter();
    HiveAdapters.registerAdapters();
    await Hive.openBox<List<GetAllPatientsResponse>>(patientBoxName);
  }

  static Future<void> cacheData(List<GetAllPatientsResponse> data) async {
    final box = Hive.box<List<GetAllPatientsResponse>>(patientBoxName);
    await box.put('cacheData', data);
  }

  static List<GetAllPatientsResponse>? getCacheData() {
    final box = Hive.box<List<GetAllPatientsResponse>>(patientBoxName);
    return box.get('cacheData');
  }
}

class HiveAdapters {
  static void registerAdapters() {
    Hive.registerAdapter(GetAllPatientsResponseAdapter());
    Hive.registerAdapter(HistoryAdapter());
  }
}
