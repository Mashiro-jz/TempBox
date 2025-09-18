// lib\presentation\pages\routing\message_routes.dart
import 'package:go_router/go_router.dart';
import '../message/mailbox_page.dart';
import '../message/message_detail_page.dart';
import 'app_router.dart';

class MessageRoutes {
  static List<GoRoute> routes = [
    GoRoute(
      path: RouteNames.mailBox,
      name: "home",
      builder: (context, state) => const MailboxPage(),
    ),
    GoRoute(
      path: "${RouteNames.messageDetail}/:id",
      name: "messageDetails",
      builder: (context, state) {
        return MessageDetailPage(messageId: state.pathParameters["id"]!);
      },
    ),
  ];
}
