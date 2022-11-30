class RandomJokesList{
  int id;
  String type, setup, punchline;

  RandomJokesList.fromJson(Map json) :
        id = json["id"],
        type = json["type"],
        setup = json["setup"],
        punchline = json["punchline"];
}