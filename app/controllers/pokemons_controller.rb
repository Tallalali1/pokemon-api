# frozen_string_literal: true

# Controller to view Pokemons
class PokemonsController < ApplicationController
  before_action :set_pokemon, only: %i[show destroy]
  def index
    pokemons = Pokemon.all
    render json: pokemons, except: %i[created_at updated_at], include: %i[types stats]
  end

  def show
    create_pokemon(params[:id]) unless @pokemon
    create_pokemon(params[:id]) unless @pokemon.name == params[:id]
    render json: @pokemon, except: %i[created_at updated_at], include: %i[types stats]
  end

  def destroy
    if @pokemon.destroy
      render @pokemon, status: :ok
    else
      render @pokemon.errors, status: :unprocessable_entity
    end
  end

  private

  def create_pokemon(name)
    pokemon_by_name = PokemonNetworkRequest.new(name).fetch_pokemon_by_name
    @pokemon = Pokemon.create(pokemon_params(pokemon_by_name))
  end

  def set_pokemon
    @pokemon = Pokemon.find_by(name: params[:id])
  end

  def pokemon_params(pokemon_by_name)
    {
      name: pokemon_by_name[:name], base_experience: pokemon_by_name[:base_experience],
      weight: pokemon_by_name[:weight], stats_attributes: pokemon_by_name[:stats],
      types_attributes: pokemon_by_name[:types]
    }
  end
end
