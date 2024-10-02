import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RoutineRecord extends FirestoreRecord {
  RoutineRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "devices" field.
  List<DocumentReference>? _devices;
  List<DocumentReference> get devices => _devices ?? const [];
  bool hasDevices() => _devices != null;

  // "start_time" field.
  DateTime? _startTime;
  DateTime? get startTime => _startTime;
  bool hasStartTime() => _startTime != null;

  // "end_time" field.
  DateTime? _endTime;
  DateTime? get endTime => _endTime;
  bool hasEndTime() => _endTime != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _devices = getDataList(snapshotData['devices']);
    _startTime = snapshotData['start_time'] as DateTime?;
    _endTime = snapshotData['end_time'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('routine')
          : FirebaseFirestore.instance.collectionGroup('routine');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('routine').doc(id);

  static Stream<RoutineRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RoutineRecord.fromSnapshot(s));

  static Future<RoutineRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RoutineRecord.fromSnapshot(s));

  static RoutineRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RoutineRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RoutineRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RoutineRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RoutineRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RoutineRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRoutineRecordData({
  String? name,
  DateTime? startTime,
  DateTime? endTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'start_time': startTime,
      'end_time': endTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class RoutineRecordDocumentEquality implements Equality<RoutineRecord> {
  const RoutineRecordDocumentEquality();

  @override
  bool equals(RoutineRecord? e1, RoutineRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        listEquality.equals(e1?.devices, e2?.devices) &&
        e1?.startTime == e2?.startTime &&
        e1?.endTime == e2?.endTime;
  }

  @override
  int hash(RoutineRecord? e) => const ListEquality()
      .hash([e?.name, e?.devices, e?.startTime, e?.endTime]);

  @override
  bool isValidKey(Object? o) => o is RoutineRecord;
}
