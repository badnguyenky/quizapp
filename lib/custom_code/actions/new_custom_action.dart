// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';
import 'dart:typed_data';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:path_provider/path_provider.dart';

Future<FFUploadedFile> newCustomAction(FFUploadedFile? videoFile) async {
  if (videoFile == null || videoFile.bytes == null) {
    throw Exception('No video file or file bytes provided');
  }

  try {
    // Get the temporary directory
    final tempDir = await getTemporaryDirectory();

    // Create a temporary video file from the provided bytes
    final videoFilePath = '${tempDir.path}/${videoFile.name}';
    final tempVideoFile = File(videoFilePath);
    await tempVideoFile.writeAsBytes(videoFile.bytes!);

    // Generate the thumbnail from the temporary video file
    final uint8list = await VideoThumbnail.thumbnailData(
      video: videoFilePath,
      imageFormat: ImageFormat.JPEG,
      maxWidth: 128, // Adjust the width of the thumbnail as needed
      quality: 75, // Adjust the quality as needed
    );

    // Create a path for the thumbnail
    final thumbnailPath =
        '${tempDir.path}/thumb_${DateTime.now().millisecondsSinceEpoch}.jpg';
    final file = File(thumbnailPath);
    await file.writeAsBytes(uint8list!);

    // Convert the thumbnail into an FFUploadedFile
    final FFUploadedFile thumbnailFile = FFUploadedFile(
      name: 'thumbnail_${videoFile.name}.jpg',
      bytes: uint8list,
    );

    // Return the generated thumbnail as an FFUploadedFile
    return thumbnailFile;
  } catch (e) {
    print('Error generating thumbnail: $e');
    throw Exception('Failed to generate thumbnail');
  }
}
