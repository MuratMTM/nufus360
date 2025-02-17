class EthnicGroup {
  final String name;
  final double percentage;
  final String countryCode;
  final String flag;

  const EthnicGroup({
    required this.name,
    required this.percentage,
    required this.countryCode,
    required this.flag,
  });
}

// Sample data for testing
final List<EthnicGroup> sampleGermanEthnicGroups = [
  const EthnicGroup(
    name: 'Alman',
    percentage: 87.2,
    countryCode: 'DE',
    flag: '🇩🇪',
  ),
  const EthnicGroup(
    name: 'Türk',
    percentage: 3.7,
    countryCode: 'TR',
    flag: '🇹🇷',
  ),
  const EthnicGroup(
    name: 'Polonyalı',
    percentage: 2.1,
    countryCode: 'PL',
    flag: '🇵🇱',
  ),
  const EthnicGroup(
    name: 'Rus',
    percentage: 1.4,
    countryCode: 'RU',
    flag: '🇷🇺',
  ),
  const EthnicGroup(
    name: 'Diğer',
    percentage: 5.6,
    countryCode: 'EU',
    flag: '🌍',
  ),
];
