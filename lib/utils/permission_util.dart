import 'dart:io';

import 'package:auto/core/singletons/storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class DownloadUtil {
  Future<bool> download(
      TargetPlatform? platform, String url, String filename) async {
    var downloaded = false;
    final permissionReady = await checkPermission(platform);
    if (permissionReady) {
      final localPath = await prepareSaveDir(platform);
      final savePath = '$localPath/$filename';
      try {
        await Dio().download(url, savePath);
        await StorageRepository.putBool(key: url, value: true);
        downloaded = true;
      } catch (e) {
        downloaded = false;
      }
    }
    return downloaded;
  }

  Future<bool> checkPermission(TargetPlatform? platform) async {
    if (platform == TargetPlatform.android) {
      final status = await Permission.storage.status;
      if (status != PermissionStatus.granted) {
        final result = await Permission.storage.request();
        if (result == PermissionStatus.granted) {
          return true;
        }
      } else {
        return true;
      }
    } else {
      return true;
    }
    return false;
  }

  Future<String> prepareSaveDir(TargetPlatform? platform) async {
    final localPath = (await _findLocalPath(platform))!;

    final savedDir = Directory(localPath);
    // ignore: avoid_slow_async_io
    final hasExisted = await savedDir.exists();
    if (!hasExisted) {
      await savedDir.create();
    }
    return localPath;
  }

  Future<String?> _findLocalPath(TargetPlatform? platform) async {
    if (platform == TargetPlatform.android) {
      return '/storage/emulated/0/Download/';
    } else {
      final directory = await getApplicationDocumentsDirectory();
      return '${directory.path}${Platform.pathSeparator}Download';
    }
  }
}
