import 'dart:convert';

DniResponse dniResponseFromJson(String str) => DniResponse.fromJson(json.decode(str));

String dniResponseToJson(DniResponse data) => json.encode(data.toJson());

class DniResponse {
    DniResponse({
        this.dni,
        this.name,
        this.firstName,
        this.lastName,
        this.cui,
    });

    String? dni;
    String? name;
    String? firstName;
    String? lastName;
    String? cui;

    factory DniResponse.fromJson(Map<String, dynamic> json) => DniResponse(
        dni: json["dni"],
        name: json["name"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        cui: json["cui"],
    );

    Map<String, dynamic> toJson() => {
        "dni": dni,
        "name": name,
        "first_name": firstName,
        "last_name": lastName,
        "cui": cui,
    };
}
