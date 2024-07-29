class TextHelper {

  // format 3 so cach nhau 1 dau phay
  static String formatNumberByThousands(int number) {
    return number.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},'
    );
  }
}