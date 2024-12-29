String formatLastContacted(DateTime? lastContacted) {
  if (lastContacted == null) {
    return 'Never Contacted';
  }

  final now = DateTime.now();

  if (lastContacted.isAfter(now)) {
    return 'Today'; // If in future, display as 'Today'.
  }

  final difference = now.difference(lastContacted);

  if (difference.inDays <= 13) {
    final days = difference.inDays;
    return '$days day${days == 1 ? '' : 's'} ago';
  } else if (difference.inDays <= 56) {
    final weeks = difference.inDays ~/ 7;
    return '$weeks week${weeks == 1 ? '' : 's'} ago';
  } else {
    final months = difference.inDays ~/ 30;
    return '$months month${months == 1 ? '' : 's'} ago';
  }
}
