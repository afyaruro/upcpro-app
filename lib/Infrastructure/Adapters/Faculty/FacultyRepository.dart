import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:upcpro_app/Domain/Ports/Faculty/IFacultyRepository.dart';
import 'package:upcpro_app/Domain/Responses/Response.dart';
import 'package:upcpro_app/Infrastructure/DataSource/Faculty/LocalDB/GetFacultyDataSourceHive.dart';
import 'package:upcpro_app/Infrastructure/DataSource/Faculty/LocalDB/SaveFacultyDatasourceHive.dart';
import 'package:upcpro_app/Infrastructure/DataSource/Faculty/Peticiones/GetFacultyDataSourceDio.dart';
import 'package:upcpro_app/Infrastructure/Models/Faculty/FacultyModel.dart';

class FacultyRepository implements IFacultyRepository {
  final Dio dio;

  FacultyRepository({required this.dio});

  @override
  Future<ResponseEntity<FacultyModel>> getFacultyDio() async {
    return await GetFacultyDataSourceDio(
      dio: dio,
    ).getFacultys(page: 0, size: 0);
  }

  @override
  Future<ResponseEntity<FacultyModel>> getFacultiesHive(Box box) async {
    return await GetFacultyDataSourceHive().getFacultys(box);
  }

  @override
  Future<bool> saveFacultiesHive(
    List<FacultyModel> faculties,
    Box box,
  ) async {
    return await SaveFacultyDataSourceHive().saveFaculties(faculties, box);
  }
}
