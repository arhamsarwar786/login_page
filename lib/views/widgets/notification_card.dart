
import 'package:flutter/material.dart';
import 'package:login_page/model/notification_model.dart';
import 'package:login_page/utils/app_color.dart';

class NotificationCard extends StatelessWidget {
  final NotificationModel notification;
  final VoidCallback onMarkAsRead;
  final VoidCallback onDelete;

  const NotificationCard({
    super.key,
    required this.notification,
    required this.onMarkAsRead,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColor.dark1blue,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: notification.read
              ? Colors.transparent
              : AppColor.clrGradient1,
          width: 2,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildIcon(),
          const SizedBox(width: 16),
          Expanded(child: _buildContent(context)),
          if (!notification.read) _buildUnreadIndicator(),
        ],
      ),
    );
  }

  Widget _buildIcon() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: notification.color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(
        notification.icon,
        color: AppColor.white,
        size: 24,
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                notification.title,
                style: const TextStyle(
                  fontFamily: "hel",
                  color: AppColor.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.close, color: AppColor.grey, size: 20),
              onPressed: onDelete,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          notification.message,
          style: const TextStyle(
            fontFamily: "hel",
            color: AppColor.greysmall,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              notification.time,
              style: const TextStyle(
                fontFamily: "hel",
                color: AppColor.greylight,
                fontSize: 12,
              ),
            ),
            if (!notification.read)
              GestureDetector(
                onTap: onMarkAsRead,
                child:  Text(
                  'Mark as read',
                  style: TextStyle(
                    fontFamily: "hel",
                    color: AppColor.purple,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }

  Widget _buildUnreadIndicator() {
    return Padding(
      padding: const EdgeInsets.only(left: 8, top: 8),
      child: Container(
        width: 10,
        height: 10,
        decoration: const BoxDecoration(
          color: Color(0xFFA855F7),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}