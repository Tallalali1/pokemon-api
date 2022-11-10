require 'HTTParty'
class PokemonNetworkRequest
  include HTTParty
  base_uri 'https://pokeapi.co/api/v2/pokemon'
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def get_all
    res = self.class.get("/")
    res['results']
  end

  def get_pokemon_by_name
    res = self.class.get("/#{name}")
    {
      name: name,
      types: res["types"],
      stats: res["stats"],
      base_experience: res["base_experience"],
      weight: res["weight"]
    }
  end
end
