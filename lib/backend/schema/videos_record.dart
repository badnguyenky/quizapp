import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VideosRecord extends FirestoreRecord {
  VideosRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "videoUrl" field.
  String? _videoUrl;
  String get videoUrl => _videoUrl ?? '';
  bool hasVideoUrl() => _videoUrl != null;

  // "likedBy" field.
  List<DocumentReference>? _likedBy;
  List<DocumentReference> get likedBy => _likedBy ?? const [];
  bool hasLikedBy() => _likedBy != null;

  // "dislikedBy" field.
  List<DocumentReference>? _dislikedBy;
  List<DocumentReference> get dislikedBy => _dislikedBy ?? const [];
  bool hasDislikedBy() => _dislikedBy != null;

  // "uploadedAt" field.
  DateTime? _uploadedAt;
  DateTime? get uploadedAt => _uploadedAt;
  bool hasUploadedAt() => _uploadedAt != null;

  // "tags" field.
  List<String>? _tags;
  List<String> get tags => _tags ?? const [];
  bool hasTags() => _tags != null;

  // "totalView" field.
  int? _totalView;
  int get totalView => _totalView ?? 0;
  bool hasTotalView() => _totalView != null;

  // "thumbnail" field.
  String? _thumbnail;
  String get thumbnail => _thumbnail ?? '';
  bool hasThumbnail() => _thumbnail != null;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _videoUrl = snapshotData['videoUrl'] as String?;
    _likedBy = getDataList(snapshotData['likedBy']);
    _dislikedBy = getDataList(snapshotData['dislikedBy']);
    _uploadedAt = snapshotData['uploadedAt'] as DateTime?;
    _tags = getDataList(snapshotData['tags']);
    _totalView = castToType<int>(snapshotData['totalView']);
    _thumbnail = snapshotData['thumbnail'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('videos');

  static Stream<VideosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VideosRecord.fromSnapshot(s));

  static Future<VideosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VideosRecord.fromSnapshot(s));

  static VideosRecord fromSnapshot(DocumentSnapshot snapshot) => VideosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VideosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VideosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VideosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VideosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVideosRecordData({
  DocumentReference? userRef,
  String? title,
  String? description,
  String? videoUrl,
  DateTime? uploadedAt,
  int? totalView,
  String? thumbnail,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'title': title,
      'description': description,
      'videoUrl': videoUrl,
      'uploadedAt': uploadedAt,
      'totalView': totalView,
      'thumbnail': thumbnail,
    }.withoutNulls,
  );

  return firestoreData;
}

class VideosRecordDocumentEquality implements Equality<VideosRecord> {
  const VideosRecordDocumentEquality();

  @override
  bool equals(VideosRecord? e1, VideosRecord? e2) {
    const listEquality = ListEquality();
    return e1?.userRef == e2?.userRef &&
        e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.videoUrl == e2?.videoUrl &&
        listEquality.equals(e1?.likedBy, e2?.likedBy) &&
        listEquality.equals(e1?.dislikedBy, e2?.dislikedBy) &&
        e1?.uploadedAt == e2?.uploadedAt &&
        listEquality.equals(e1?.tags, e2?.tags) &&
        e1?.totalView == e2?.totalView &&
        e1?.thumbnail == e2?.thumbnail;
  }

  @override
  int hash(VideosRecord? e) => const ListEquality().hash([
        e?.userRef,
        e?.title,
        e?.description,
        e?.videoUrl,
        e?.likedBy,
        e?.dislikedBy,
        e?.uploadedAt,
        e?.tags,
        e?.totalView,
        e?.thumbnail
      ]);

  @override
  bool isValidKey(Object? o) => o is VideosRecord;
}
