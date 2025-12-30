import 'package:flutter/foundation.dart';
import 'package:login_page/model/notification_model.dart';
import 'package:login_page/views/widgets/notification_data.dart';

class NotificationProvider extends ChangeNotifier {
  List<NotificationModel> _notifications = [];
  String _filter = 'all';

  NotificationProvider() {
    _loadNotifications();
  }
  
  List<NotificationModel> get notifications => _notifications;
  String get filter => _filter;

  int get unreadCount => _notifications.where((n) => !n.read).length;

  List<NotificationModel> get filteredNotifications {
    return _filter == 'unread'
        ? _notifications.where((n) => !n.read).toList()
        : _notifications;
  }

  void _loadNotifications() {
    _notifications = NotificationData.getNotifications();
    notifyListeners();
  }

  void setFilter(String newFilter) {
    _filter = newFilter;
    notifyListeners();
  }

  void markAsRead(int id) {
    final index = _notifications.indexWhere((n) => n.id == id);
    if (index != -1) {
      _notifications[index].read = true;
      notifyListeners();
    }
  }

  void deleteNotification(int id) {
    _notifications.removeWhere((n) => n.id == id);
    notifyListeners();
  }

  void markAllAsRead() {
    for (var notification in _notifications) {
      notification.read = true;
    }
    notifyListeners();
  }
}