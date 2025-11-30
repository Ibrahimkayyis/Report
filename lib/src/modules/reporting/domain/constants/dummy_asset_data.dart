class DummyAssetData {
  static const List<String> dataAssetOptions = [
    'Laptop Dell Latitude 5420',
    'Desktop HP ProDesk 400',
    'Printer Canon ImageClass',
    'Router Cisco 2960',
    'Server IBM X3650',
  ];

  static const Map<String, List<String>> serialNumberOptions = {
    'Laptop Dell Latitude 5420': ['SN-LAP-001', 'SN-LAP-002', 'SN-LAP-003'],
    'Desktop HP ProDesk 400': ['SN-DSK-001', 'SN-DSK-002', 'SN-DSK-003'],
    'Printer Canon ImageClass': ['SN-PRT-001', 'SN-PRT-002'],
    'Router Cisco 2960': [
      'SN-RTR-001',
      'SN-RTR-002',
      'SN-RTR-003',
      'SN-RTR-004',
    ],
    'Server IBM X3650': ['SN-SRV-001', 'SN-SRV-002'],
  };

  static const Map<String, Map<String, String>> assetDetails = {
    'Laptop Dell Latitude 5420': {
      'category': 'Hardware',
      'subcategory': 'Komputer',
      'type': 'Laptop',
    },
    'Desktop HP ProDesk 400': {
      'category': 'Hardware',
      'subcategory': 'Komputer',
      'type': 'Desktop',
    },
    'Printer Canon ImageClass': {
      'category': 'Hardware',
      'subcategory': 'Peripheral',
      'type': 'Printer',
    },
    'Router Cisco 2960': {
      'category': 'Hardware',
      'subcategory': 'Jaringan',
      'type': 'Router',
    },
    'Server IBM X3650': {
      'category': 'Hardware',
      'subcategory': 'Server',
      'type': 'Rack Server',
    },
  };
}