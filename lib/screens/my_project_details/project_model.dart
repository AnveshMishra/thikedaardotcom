class Project {
  String? sId;
  String? name;
  String? image;
  String? price;
  String? descriptionOne;
  String? descriptionTwo;
  String? descriptionThree;
  dynamic approvalStatus;
  String? uploadUser;
  int? iV;

  Project({
    this.sId,
    this.name,
    this.image,
    this.price,
    this.descriptionOne,
    this.descriptionTwo,
    this.descriptionThree,
    this.approvalStatus,
    this.uploadUser,
    this.iV,
  });

  Project.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    image = json['image'];
    price = json['price'];
    descriptionOne = json['descriptionOne'];
    descriptionTwo = json['descriptionTwo'];
    descriptionThree = json['descriptionThree'];
    approvalStatus = json['approvalStatus'];
    uploadUser = json['uploadUser'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['_id'] = sId;
    data['name'] = name;
    data['image'] = image;
    data['price'] = price;
    data['descriptionOne'] = descriptionOne;
    data['descriptionTwo'] = descriptionTwo;
    data['descriptionThree'] = descriptionThree;
    data['approvalStatus'] = approvalStatus;
    data['uploadUser'] = uploadUser;
    data['__v'] = iV;
    return data;
  }
}
