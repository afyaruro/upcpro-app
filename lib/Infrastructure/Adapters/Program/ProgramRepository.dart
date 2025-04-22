import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:upcpro_app/Domain/Ports/Program/IProgramRepository.dart';
import 'package:upcpro_app/Domain/Responses/Response.dart';
import 'package:upcpro_app/Infrastructure/DataSource/Program/LocalDB/GetProgramDataSourceHive.dart';
import 'package:upcpro_app/Infrastructure/DataSource/Program/LocalDB/SaveProgramDatasourceHive.dart';
import 'package:upcpro_app/Infrastructure/DataSource/Program/Peticiones/GetProgramDataSourceDio.dart';
import 'package:upcpro_app/Infrastructure/Models/Program/ProgramModel.dart';

class ProgramRepository implements IProgramRepository {
  final Dio dio;

  ProgramRepository({required this.dio});

  @override
  Future<ResponseEntity<ProgramModel>> getProgramDio() async {
    return await GetProgramDataSourceDio(
      dio: dio,
    ).gePrograms(page: 0, size: 0);
  }

  @override
  Future<ResponseEntity<ProgramModel>> getProgramsHive(Box box) async {
    return await GetProgramDataSourceHive().getPrograms(box);
  }

  @override
  Future<bool> saveProgramsHive(
    List<ProgramModel> programs,
    Box box,
  ) async {
    return await SaveProgramDataSourceHive().savePrograms(programs, box);
  }
}
