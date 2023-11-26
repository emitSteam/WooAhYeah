import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._(); // DBHelper의 싱글톤 객체 생성
  static Database? _database; // 데이터베이스 인스턴스를 저장하는 변수

  DBHelper._(); // DBHelper 생성자(private)

  factory DBHelper() => _instance; // DBHelper 인스턴스 반환 메소드

  // 데이터베이스 인스턴스를 가져오는 메소드
  Future<Database> get database async {
    if (_database != null) {
      // 인스턴스가 이미 존재한다면
      return _database!; // 저장된 데이터베이스 인스턴스를 반환
    }
    _database = await _initDB(); // 데이터베이스 초기화
    return _database!; // 초기화된 데이터베이스 인스턴스 반환
  }

  // 데이터베이스 초기화 메소드
  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath(); // 데이터베이스 경로 가져오기
    final path = join(dbPath, 'woo_ah_yeah.db'); // 데이터베이스 파일 경로 생성
    return await openDatabase(
      path, // 데이터베이스 파일 경로
      version: 1, // 데이터베이스 버전
      onCreate: (db, version) async {
        await db.execute(
          // SQL 쿼리를 실행하여 데이터베이스 테이블 생성
          'CREATE TABLE example(id INTEGER PRIMARY KEY, name TEXT, birthday INTEGER)',
        );
      },
    );
  }

  // 데이터 추가 메소드
  Future<void> insertData(String name, int value) async {
    final db = await database; // 데이터베이스 인스턴스 가져오기
    await db.insert(
      'example', // 데이터를 추가할 테이블 이름
      {
        'name': name,
        'value': value,
      }, // 추가할 데이터
      conflictAlgorithm: ConflictAlgorithm.replace, // 중복 데이터 처리 방법 설정
    );
  }

  // 데이터 조회 메소드
  Future<List<Map<String, dynamic>>> selectData() async {
    final db = await database; // 데이터베이스 인스턴스 가져오기
    return await db.query('example'); // 데이터베이스에서 모든 데이터 조회
  }

  // 데이터 수정 메소드
  Future<void> updateData(int id, String name, int value) async {
    final db = await database; // 데이터베이스 인스턴스 가져오기
    await db.update(
      'example', // 수정할 테이블 이름
      {
        'name': name,
        'value': value,
      }, // 수정할 데이터
      where: 'id = ?', // 수정할 데이터의 조건 설정
      whereArgs: [id], // 수정할 데이터의 조건 값
    );
  }
  // 데이터 삭제 메소드
  Future<void> deleteData(int id) async {
    final db = await database; // 데이터베이스 인스턴스 가져오기
    await db.delete(
      'example', // 삭제할 테이블 이름
      where: 'id = ?', // 삭제할 데이터의 조건 설정
      whereArgs: [id], // 삭제할 데이터의 조건 값
    );
  }
}