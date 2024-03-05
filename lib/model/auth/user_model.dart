class UserModel {
  String? givenName;
  String? locale;
  String? familyName;
  String? picture;
  String? id;
  String? name;
  String? email;
  bool? verifiedEmail;
  String? grantedScopes;

  UserModel(
      {this.givenName,
      this.locale,
      this.familyName,
      this.picture,
      this.id,
      this.name,
      this.email,
      this.verifiedEmail,
      this.grantedScopes});

  UserModel.fromJson(Map<String, dynamic> json) {
    givenName = json['given_name'];
    locale = json['locale'];
    familyName = json['family_name'];
    picture = json['picture'];
    id = json['id'];
    name = json['name'];
    email = json['email'];
    verifiedEmail = json['verified_email'];
    grantedScopes = json['granted_scopes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['given_name'] = this.givenName;
    data['locale'] = this.locale;
    data['family_name'] = this.familyName;
    data['picture'] = this.picture;
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['verified_email'] = this.verifiedEmail;
    data['granted_scopes'] = this.grantedScopes;
    return data;
  }
}
