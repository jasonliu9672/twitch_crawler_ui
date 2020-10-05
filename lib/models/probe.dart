class Probe {
  final String id;
  final String name;
  final String createdOn;
  final String language;
  final String serverId;
  final String country;
  final String state;

  Probe(
      {this.id,
      this.name,
      this.createdOn,
      this.language,
      this.serverId,
      this.country,
      this.state});

  factory Probe.fromJson(Map<String, dynamic> json) {
    return Probe(
        id: json['id'],
        name: json['name'],
        createdOn: json['createdOn'],
        language: json['language'],
        serverId: json['serverId'],
        country: json['country'],
        state: json['state']);
  }
}

// List<Probe> probeExamples = [
//   Probe(
//       id: 'UE4E06F',
//       name: 'probe-UE4E06F',
//       isActive: true,
//       createdOn: '2020/9/22 15:34',
//       language: 'zh',
//       country: 'Australia'),
//   Probe(
//     id: 'UE6E06F',
//     name: 'probe-UE6E06F',
//     isActive: true,
//     createdOn: '2020/9/22 15:34',
//     language: 'zh',
//     country: 'Australia',
//   ),
// ];
