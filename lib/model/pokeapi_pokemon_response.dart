// To parse this JSON data, do
//
//     final pokeapiPokemonResponse = pokeapiPokemonResponseFromMap(jsonString);

import 'dart:convert';

class PokeapiPokemonResponse {
    PokeapiPokemonResponse({
        required this.abilities,
        required this.baseExperience,
        required this.forms,
        required this.gameIndices,
        required this.height,
        required this.heldItems,
        required this.id,
        required this.isDefault,
        required this.locationAreaEncounters,
        required this.moves,
        required this.name,
        required this.order,
        required this.pastTypes,
        required this.species,
        required this.sprites,
        required this.stats,
        required this.types,
        required this.weight,
    });

    List<Ability> abilities;
    int baseExperience;
    List<Species> forms;
    List<GameIndex> gameIndices;
    int height;
    List<dynamic> heldItems;
    int id;
    bool isDefault;
    String locationAreaEncounters;
    List<Move> moves;
    String name;
    int order;
    List<dynamic> pastTypes;
    Species species;
    Sprites sprites;
    List<Stat> stats;
    List<Type> types;
    int weight;

    factory PokeapiPokemonResponse.fromJson(String str) => PokeapiPokemonResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PokeapiPokemonResponse.fromMap(Map<String, dynamic> json) => PokeapiPokemonResponse(
        abilities: List<Ability>.from(json["abilities"].map((x) => Ability.fromMap(x))),
        baseExperience: json["base_experience"],
        forms: List<Species>.from(json["forms"].map((x) => Species.fromMap(x))),
        gameIndices: List<GameIndex>.from(json["game_indices"].map((x) => GameIndex.fromMap(x))),
        height: json["height"],
        heldItems: List<dynamic>.from(json["held_items"].map((x) => x)),
        id: json["id"],
        isDefault: json["is_default"],
        locationAreaEncounters: json["location_area_encounters"],
        moves: List<Move>.from(json["moves"].map((x) => Move.fromMap(x))),
        name: json["name"],
        order: json["order"],
        pastTypes: List<dynamic>.from(json["past_types"].map((x) => x)),
        species: Species.fromMap(json["species"]),
        sprites: Sprites.fromMap(json["sprites"]),
        stats: List<Stat>.from(json["stats"].map((x) => Stat.fromMap(x))),
        types: List<Type>.from(json["types"].map((x) => Type.fromMap(x))),
        weight: json["weight"],
    );

  Map<String, dynamic> toMap() => {
        "abilities": List<dynamic>.from(abilities.map((x) => x.toMap())),
        "base_experience": baseExperience,
        "forms": List<dynamic>.from(forms.map((x) => x.toMap())),
        "game_indices": List<dynamic>.from(gameIndices.map((x) => x)),
        "height": height,
        "held_items": List<dynamic>.from(heldItems.map((x) => x)),
        "id": id,
        "is_default": isDefault,
        "location_area_encounters": locationAreaEncounters,
        "moves": List<dynamic>.from(moves.map((x) => x.toMap())),
        "name": name,
        "order": order,
        "past_types": List<dynamic>.from(pastTypes.map((x) => x)),
        "species": species.toMap(),
        "sprites": sprites.toMap(),
        "stats": List<dynamic>.from(stats.map((x) => x.toMap())),
        "types": List<dynamic>.from(types.map((x) => x.toMap())),
        "weight": weight,
  };
}

class Ability {
    Ability({
        required this.ability,
        required this.isHidden,
        required this.slot,
    });

    Species ability;
    bool isHidden;
    int slot;

    factory Ability.fromJson(String str) => Ability.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Ability.fromMap(Map<String, dynamic> json) => Ability(
        ability: Species.fromMap(json["ability"]),
        isHidden: json["is_hidden"],
        slot: json["slot"],
    );

    Map<String, dynamic> toMap() => {
        "ability": ability.toMap(),
        "is_hidden": isHidden,
        "slot": slot,
    };
}

class Species {
    Species({
        required this.name,
        required this.url,
    });

    String name;
    String url;

    factory Species.fromJson(String str) => Species.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Species.fromMap(Map<String, dynamic> json) => Species(
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "url": url,
    };
}

class GameIndex {
    GameIndex({
        required this.gameIndex,
        required this.version,
    });

    int gameIndex;
    Species version;

    factory GameIndex.fromJson(String str) => GameIndex.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory GameIndex.fromMap(Map<String, dynamic> json) => GameIndex(
        gameIndex: json["game_index"],
        version: Species.fromMap(json["version"]),
    );

    Map<String, dynamic> toMap() => {
        "game_index": gameIndex,
        "version": version.toMap(),
    };
}

class Move {
    Move({
        required this.move,
        required this.versionGroupDetails,
    });

    Species move;
    List<VersionGroupDetail> versionGroupDetails;

    factory Move.fromJson(String str) => Move.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Move.fromMap(Map<String, dynamic> json) => Move(
        move: Species.fromMap(json["move"]),
        versionGroupDetails: List<VersionGroupDetail>.from(json["version_group_details"].map((x) => VersionGroupDetail.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "move": move.toMap(),
        "version_group_details": List<dynamic>.from(versionGroupDetails.map((x) => x.toMap())),
    };
}

class VersionGroupDetail {
    VersionGroupDetail({
        required this.levelLearnedAt,
        required this.moveLearnMethod,
        required this.versionGroup,
    });

    int levelLearnedAt;
    Species moveLearnMethod;
    Species versionGroup;

    factory VersionGroupDetail.fromJson(String str) => VersionGroupDetail.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory VersionGroupDetail.fromMap(Map<String, dynamic> json) => VersionGroupDetail(
        levelLearnedAt: json["level_learned_at"],
        moveLearnMethod: Species.fromMap(json["move_learn_method"]),
        versionGroup: Species.fromMap(json["version_group"]),
    );

    Map<String, dynamic> toMap() => {
        "level_learned_at": levelLearnedAt,
        "move_learn_method": moveLearnMethod.toMap(),
        "version_group": versionGroup.toMap(),
    };
}


class Sprites {
    Sprites({
        required this.backDefault,
        this.backFemale,
        required this.backShiny,
        this.backShinyFemale,
        required this.frontDefault,
        this.frontFemale,
        required this.frontShiny,
        this.frontShinyFemale,
        this.other,
        this.animated,
    });

    String backDefault;
    dynamic backFemale;
    String backShiny;
    dynamic backShinyFemale;
    String frontDefault;
    dynamic frontFemale;
    String frontShiny;
    dynamic frontShinyFemale;
    Other? other;
    Sprites? animated;

    factory Sprites.fromJson(String str) => Sprites.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Sprites.fromMap(Map<String, dynamic> json) => Sprites(
        backDefault: json["back_default"],
        backFemale: json["back_female"],
        backShiny: json["back_shiny"],
        backShinyFemale: json["back_shiny_female"],
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
        frontShiny: json["front_shiny"],
        frontShinyFemale: json["front_shiny_female"],
        other: json["other"] == null ? null : Other.fromMap(json["other"]),
        // animated: json["animated"] == null ? null : Sprites.fromMap(json["animated"]),
    );

    Map<String, dynamic> toMap() => {
        "back_default": backDefault,
        "back_female": backFemale,
        "back_shiny": backShiny,
        "back_shiny_female": backShinyFemale,
        "front_default": frontDefault,
        "front_female": frontFemale,
        "front_shiny": frontShiny,
        "front_shiny_female": frontShinyFemale,
        "other": other?.toMap(),
        "animated": animated?.toMap(),
    };
}


class OfficialArtwork {
    OfficialArtwork({
        required this.frontDefault,
        required this.frontShiny,
    });

    String frontDefault;
    String frontShiny;

    factory OfficialArtwork.fromJson(String str) => OfficialArtwork.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory OfficialArtwork.fromMap(Map<String, dynamic> json) => OfficialArtwork(
        frontDefault: json["front_default"],
        frontShiny: json["front_shiny"],
    );

    Map<String, dynamic> toMap() => {
        "front_default": frontDefault,
        "front_shiny": frontShiny,
    };
}

class Home {
    Home({
        required this.frontDefault,
        this.frontFemale,
        required this.frontShiny,
        this.frontShinyFemale,
    });

    String frontDefault;
    dynamic frontFemale;
    String frontShiny;
    dynamic frontShinyFemale;

    factory Home.fromJson(String str) => Home.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Home.fromMap(Map<String, dynamic> json) => Home(
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
        frontShiny: json["front_shiny"],
        frontShinyFemale: json["front_shiny_female"],
    );

    Map<String, dynamic> toMap() => {
        "front_default": frontDefault,
        "front_female": frontFemale,
        "front_shiny": frontShiny,
        "front_shiny_female": frontShinyFemale,
    };
}

class DreamWorld {
    DreamWorld({
        required this.frontDefault,
        this.frontFemale,
    });

    String frontDefault;
    dynamic frontFemale;

    factory DreamWorld.fromJson(String str) => DreamWorld.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory DreamWorld.fromMap(Map<String, dynamic> json) => DreamWorld(
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
    );

    Map<String, dynamic> toMap() => {
        "front_default": frontDefault,
        "front_female": frontFemale,
    };
}

class Other {
    Other({
        required this.dreamWorld,
        required this.home,
        required this.officialArtwork,
    });

    DreamWorld dreamWorld;
    Home home;
    OfficialArtwork officialArtwork;

    factory Other.fromJson(String str) => Other.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Other.fromMap(Map<String, dynamic> json) => Other(
        dreamWorld: DreamWorld.fromMap(json["dream_world"]),
        home: Home.fromMap(json["home"]),
        officialArtwork: OfficialArtwork.fromMap(json["official-artwork"]),
    );

    Map<String, dynamic> toMap() => {
        "dream_world": dreamWorld.toMap(),
        "home": home.toMap(),
        "official-artwork": officialArtwork.toMap(),
    };
}

class Stat {
    Stat({
        required this.baseStat,
        required this.effort,
        required this.stat,
    });

    int baseStat;
    int effort;
    Species stat;

    factory Stat.fromJson(String str) => Stat.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Stat.fromMap(Map<String, dynamic> json) => Stat(
        baseStat: json["base_stat"],
        effort: json["effort"],
        stat: Species.fromMap(json["stat"]),
    );

    Map<String, dynamic> toMap() => {
        "base_stat": baseStat,
        "effort": effort,
        "stat": stat.toMap(),
    };
}

class Type {
    Type({
        required this.slot,
        required this.type,
    });

    int slot;
    Species type;

    factory Type.fromJson(String str) => Type.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Type.fromMap(Map<String, dynamic> json) => Type(
        slot: json["slot"],
        type: Species.fromMap(json["type"]),
    );

    Map<String, dynamic> toMap() => {
        "slot": slot,
        "type": type.toMap(),
    };
}
