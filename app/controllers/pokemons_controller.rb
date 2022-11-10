# frozen_string_literal: true

# Controller to view Pokemons
class PokemonsController < ApplicationController
  before_action :set_pokemon, only: %i[show destroy]
  def index
    @pokemons = Pokemon.all

    render json: @pokemons, except: %i[created_at updated_at], include: %i[types stats]
  end

  def show
    if !@pokemon
      create_pokemon(params[:id])
    elsif @pokemon.name != params[:id]
      create_pokemon(params[:id])
    end
    render json: @pokemon, except: %i[created_at updated_at], include: %i[types stats]
  end

  def destroy
    @pokemon.destroy
  end

  private

  def create_pokemon(name)
    @pokemon = PokemonNetworkRequest.new(name).get_pokemon_by_name
    @pokemon = Pokemon.create(name: @pokemon[:name],
                              base_experience: @pokemon[:base_experience],
                              weight: @pokemon[:weight], stats_attributes: @pokemon[:stats],
                              types_attributes: @pokemon[:types])
  end

  def set_pokemon
    @pokemon = Pokemon.find_by(name: params[:id])
  end

  def pokemon_params
    params.require(:pokemon).permit(:name, :base_experience, :stats, :types, :weight)
  end
end
