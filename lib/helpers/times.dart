String TimesGreeting() {
  var hour = DateTime.now().hour;
  if (hour > 2 && hour < 11) {
    return 'Pagi';
  }
  if (hour > 11 && hour < 15) {
    return 'Siang';
  }
  if (hour > 15 && hour < 18) {
    return 'Sore';
  }
  return 'Malam';
}