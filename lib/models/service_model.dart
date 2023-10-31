class ServicePetshop {
  final String serviceName;
  final double servicePrice;

  ServicePetshop({
    required this.serviceName,
    required this.servicePrice,
  });

  // Convert ServicePetshop to a JSON Map
  Map<String, dynamic> toJson() {
    return {
      'serviceName': serviceName,
      'servicePrice': servicePrice,
    };
  }

  // Create a ServicePetshop from a JSON Map
  factory ServicePetshop.fromJson(Map<String, dynamic> json) {
    return ServicePetshop(
      serviceName: json['serviceName'],
      servicePrice: json['servicePrice'],
    );
  }
}
