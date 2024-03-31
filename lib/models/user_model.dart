class User {
  int? _id;
  String? _username;
  String? _password;
  late List<Roles> _roles;
  late List<CharacterModel> _characters;
  late List<Authorities> _authorities;

  List<CharacterModel> get characters => _characters;

  User(
      {required id,
        required username,
        required password,
        required roles,
        required characters,
        required authorities}) {
      _id = id;
      _username = username;
      _password = password;
      _roles = roles;
      _characters = characters;
      _authorities = authorities;
  }

  User.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _username = json['username'];
    _password = json['password'];
    if (json['roles'] != null) {
      _roles = <Roles>[];
      json['roles'].forEach((v) {
        _roles!.add(Roles.fromJson(v));
      });
    }
    if (json['characters'] != null) {
      _characters = <CharacterModel>[];
      json['characters'].forEach((v) {
        _characters!.add(CharacterModel.fromJson(v));
      });
    }
    if (json['authorities'] != null) {
      _authorities = <Authorities>[];
      json['authorities'].forEach((v) {
        _authorities!.add(Authorities.fromJson(v));
      });
    }
  }
}

class Roles {
  int? id;
  String? name;

  Roles({this.id, this.name});

  Roles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}

class CharacterModel {
  int? id;
  String? name;
  String? race;
  String? nameClass;
  String? img;
  int? speed;
  int? initiative;
  bool? inspiration;
  int? proficiency;
  int? realHP;
  int? maxHP;
  int? bonusHP;
  int? strength;
  int? dexterity;
  int? constitution;
  int? intelligence;
  int? wisdom;
  int? charisma;
  bool? strengthSav;
  bool? dexteritySav;
  bool? constitutionSav;
  bool? intelligenceSav;
  bool? wisdomSav;
  bool? charismaSav;
  bool? acrobatics;
  bool? animalHandling;
  bool? arcana;
  bool? athletics;
  bool? deception;
  bool? history;
  bool? insight;
  bool? intimidation;
  bool? investigation;
  bool? medicine;
  bool? nature;
  bool? perception;
  bool? performance;
  bool? persuasion;
  bool? religion;
  bool? sleightOfHand;
  bool? stealth;
  bool? survival;
  String? attacksAndSpells;
  String? skillsAndAbilities;
  String? spellCharacteristic;
  String? spell1L;
  String? spell2L;
  String? spell3L;
  String? spell4L;
  String? spell5L;
  String? spell6L;
  String? spell7L;
  String? spell8L;
  String? spell9L;
  String? additionalAbilities;
  int? gold;
  String? equipment;
  String? treasures;
  String? additionalProficiencyAndLanguages;
  String? background;
  String? personality;
  String? notes1;
  String? notes2;
  String? notes3;
  String? notes4;
  String? notes5;
  int? xp;
  int? ac;

  CharacterModel(
      {this.id,
        this.name,
        this.race,
        this.nameClass,
        this.img,
        this.speed,
        this.initiative,
        this.inspiration,
        this.proficiency,
        this.realHP,
        this.maxHP,
        this.bonusHP,
        this.strength,
        this.dexterity,
        this.constitution,
        this.intelligence,
        this.wisdom,
        this.charisma,
        this.strengthSav,
        this.dexteritySav,
        this.constitutionSav,
        this.intelligenceSav,
        this.wisdomSav,
        this.charismaSav,
        this.acrobatics,
        this.animalHandling,
        this.arcana,
        this.athletics,
        this.deception,
        this.history,
        this.insight,
        this.intimidation,
        this.investigation,
        this.medicine,
        this.nature,
        this.perception,
        this.performance,
        this.persuasion,
        this.religion,
        this.sleightOfHand,
        this.stealth,
        this.survival,
        this.attacksAndSpells,
        this.skillsAndAbilities,
        this.spellCharacteristic,
        this.spell1L,
        this.spell2L,
        this.spell3L,
        this.spell4L,
        this.spell5L,
        this.spell6L,
        this.spell7L,
        this.spell8L,
        this.spell9L,
        this.additionalAbilities,
        this.gold,
        this.equipment,
        this.treasures,
        this.additionalProficiencyAndLanguages,
        this.background,
        this.personality,
        this.notes1,
        this.notes2,
        this.notes3,
        this.notes4,
        this.notes5,
        this.xp,
        this.ac});

  CharacterModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    race = json['race'];
    nameClass = json['nameClass'];
    img = json['img'];
    speed = json['speed'];
    initiative = json['initiative'];
    inspiration = json['inspiration'];
    proficiency = json['proficiency'];
    realHP = json['realHP'];
    maxHP = json['maxHP'];
    bonusHP = json['bonusHP'];
    strength = json['strength'];
    dexterity = json['dexterity'];
    constitution = json['constitution'];
    intelligence = json['intelligence'];
    wisdom = json['wisdom'];
    charisma = json['charisma'];
    strengthSav = json['strengthSav'];
    dexteritySav = json['dexteritySav'];
    constitutionSav = json['constitutionSav'];
    intelligenceSav = json['intelligenceSav'];
    wisdomSav = json['wisdomSav'];
    charismaSav = json['charismaSav'];
    acrobatics = json['acrobatics'];
    animalHandling = json['animalHandling'];
    arcana = json['arcana'];
    athletics = json['athletics'];
    deception = json['deception'];
    history = json['history'];
    insight = json['insight'];
    intimidation = json['intimidation'];
    investigation = json['investigation'];
    medicine = json['medicine'];
    nature = json['nature'];
    perception = json['perception'];
    performance = json['performance'];
    persuasion = json['persuasion'];
    religion = json['religion'];
    sleightOfHand = json['sleightOfHand'];
    stealth = json['stealth'];
    survival = json['survival'];
    attacksAndSpells = json['attacksAndSpells'];
    skillsAndAbilities = json['skillsAndAbilities'];
    spellCharacteristic = json['spellCharacteristic'];
    spell1L = json['spell_1L'];
    spell2L = json['spell_2L'];
    spell3L = json['spell_3L'];
    spell4L = json['spell_4L'];
    spell5L = json['spell_5L'];
    spell6L = json['spell_6L'];
    spell7L = json['spell_7L'];
    spell8L = json['spell_8L'];
    spell9L = json['spell_9L'];
    additionalAbilities = json['additionalAbilities'];
    gold = json['gold'];
    equipment = json['equipment'];
    treasures = json['treasures'];
    additionalProficiencyAndLanguages =
    json['additionalProficiencyAndLanguages'];
    background = json['background'];
    personality = json['personality'];
    notes1 = json['notes_1'];
    notes2 = json['notes_2'];
    notes3 = json['notes_3'];
    notes4 = json['notes_4'];
    notes5 = json['notes_5'];
    xp = json['xp'];
    ac = json['ac'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['race'] = this.race;
    data['nameClass'] = this.nameClass;
    data['img'] = this.img;
    data['speed'] = this.speed;
    data['initiative'] = this.initiative;
    data['inspiration'] = this.inspiration;
    data['proficiency'] = this.proficiency;
    data['realHP'] = this.realHP;
    data['maxHP'] = this.maxHP;
    data['bonusHP'] = this.bonusHP;
    data['strength'] = this.strength;
    data['dexterity'] = this.dexterity;
    data['constitution'] = this.constitution;
    data['intelligence'] = this.intelligence;
    data['wisdom'] = this.wisdom;
    data['charisma'] = this.charisma;
    data['strengthSav'] = this.strengthSav;
    data['dexteritySav'] = this.dexteritySav;
    data['constitutionSav'] = this.constitutionSav;
    data['intelligenceSav'] = this.intelligenceSav;
    data['wisdomSav'] = this.wisdomSav;
    data['charismaSav'] = this.charismaSav;
    data['acrobatics'] = this.acrobatics;
    data['animalHandling'] = this.animalHandling;
    data['arcana'] = this.arcana;
    data['athletics'] = this.athletics;
    data['deception'] = this.deception;
    data['history'] = this.history;
    data['insight'] = this.insight;
    data['intimidation'] = this.intimidation;
    data['investigation'] = this.investigation;
    data['medicine'] = this.medicine;
    data['nature'] = this.nature;
    data['perception'] = this.perception;
    data['performance'] = this.performance;
    data['persuasion'] = this.persuasion;
    data['religion'] = this.religion;
    data['sleightOfHand'] = this.sleightOfHand;
    data['stealth'] = this.stealth;
    data['survival'] = this.survival;
    data['attacksAndSpells'] = this.attacksAndSpells;
    data['skillsAndAbilities'] = this.skillsAndAbilities;
    data['spellCharacteristic'] = this.spellCharacteristic;
    data['spell_1L'] = this.spell1L;
    data['spell_2L'] = this.spell2L;
    data['spell_3L'] = this.spell3L;
    data['spell_4L'] = this.spell4L;
    data['spell_5L'] = this.spell5L;
    data['spell_6L'] = this.spell6L;
    data['spell_7L'] = this.spell7L;
    data['spell_8L'] = this.spell8L;
    data['spell_9L'] = this.spell9L;
    data['additionalAbilities'] = this.additionalAbilities;
    data['gold'] = this.gold;
    data['equipment'] = this.equipment;
    data['treasures'] = this.treasures;
    data['additionalProficiencyAndLanguages'] =
        this.additionalProficiencyAndLanguages;
    data['background'] = this.background;
    data['personality'] = this.personality;
    data['notes_1'] = this.notes1;
    data['notes_2'] = this.notes2;
    data['notes_3'] = this.notes3;
    data['notes_4'] = this.notes4;
    data['notes_5'] = this.notes5;
    data['xp'] = this.xp;
    data['ac'] = this.ac;
    return data;
  }
}

class Authorities {
  String? authority;

  Authorities({this.authority});

  Authorities.fromJson(Map<String, dynamic> json) {
    authority = json['authority'];
  }
}