import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:oreum_fe/core/utils/custom_logger.dart';
import 'package:oreum_fe/core/widgets/email_error_dialog.dart';

class EmailSander {

  void sendEmail(BuildContext context) async {
    final Email email = Email(
      body: await _getEmailBody(),
      subject: '📩 오름오름 고객센터 문의 및 피드백',
      recipients: ['zzarit.kr@gmail.com'],
      cc: [],
      bcc: [],
      attachmentPaths: [],
      isHTML: false,
    );

    try {
      await FlutterEmailSender.send(email);
    } catch (e) {
      showDialog(context: context, builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          content: EmailErrorDialog(),
        );
      });
    }
  }

  Future<String> _getEmailBody() async {
    Map<String, dynamic>? deviceInfo = await _getDeviceInfo();
    String os = deviceInfo?['os'] ?? '알 수 없음';
    String model = deviceInfo?['model'] ?? '알 수 없음';

    String body = '';

    body += '📱 기기 및 앱 정보\n';
    body += '사용 기기: $model\n';
    body += 'OS 버전: $os\n\n';
    body += '📝 문의 내용\n';
    body += '문의 유형: (예: 로그인 문제 / 신고 / 어플 버그 제보 / 기타)\n';
    body += '상세 내용:\n\n';
    body += '🚨 [신고 문의 시 필수 기재]\n';
    body += '신고 사유:\n';
    body += '관련 스크린샷(선택):\n\n';
    body += '🐞 [어플 버그 제보 시 필수 기재]\n';
    body += '발생 상황: (어떤 화면/어떤 동작에서 발생했는지):\n';
    body += '오류 메시지: (있다면 작성)\n';
    body += '스크린샷/영상 첨부: (선택)';

    return body;
  }

  Future<Map<String, dynamic>?> _getDeviceInfo() async {
    final deviceInfoPlugin = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
      logger.i('OS 버전: ${androidInfo.version.release}');
      logger.i('SDK 버전: ${androidInfo.version.sdkInt}');
      logger.i('제조사: ${androidInfo.manufacturer}');
      logger.i('모델명: ${androidInfo.model}');

      return { 'os': androidInfo.version.release, 'model': androidInfo.model};

    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
      logger.i('OS 버전: ${iosInfo.systemVersion}');
      logger.i('기기명: ${iosInfo.name}');
      logger.i('모델명: ${iosInfo.model}');
      logger.i('기기 식별자: ${iosInfo.identifierForVendor}');

      return { 'os': iosInfo.systemVersion, 'model': iosInfo.model};
    } else {
      return null;
    }
  }
}