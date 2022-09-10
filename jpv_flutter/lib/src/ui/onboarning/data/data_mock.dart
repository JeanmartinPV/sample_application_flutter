class DataMock {
  DataMock({
    required this.image,
    required this.title,
    required this.message,
  });
  final String image;
  final String title;
  final String message;

  static List<DataMock> list = [
    DataMock(
      image: 'assets/onboarning/001.webp',
      title: 'The Baseline',
      message: 'Conceptzilla uses their trademark framework'
          'to get to know you and your idea, and make'
          'the right design decision at first attempt',
    ),
    DataMock(
      image: 'assets/onboarning/002.webp',
      title: 'The Kick-Off',
      message: '''Once Conceptzilla knows exactly what
      to do, it will bill you \$1500 or so per concept
      and start the work''',
    ),
    DataMock(
      image: 'assets/onboarning/003.webp',
      title: 'The Design',
      message: '''The concept will be constructed within
      the next day or two. It requires you to stay
      in touch with Conceptzilla during that time''',
    ),
  ];
}
