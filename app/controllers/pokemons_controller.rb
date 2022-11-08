class PokemonsController < ApplicationController
  before_action :set_pokemon, only: %i[ show update destroy ]

  def index
    @pokemons = Pokemon.all

    render json: @pokemons
  end

  def show
    render json: @pokemon
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)

    if @pokemon.save
      render json: @pokemon, status: :created, location: @pokemon
    else
      render json: @pokemon.errors, status: :unprocessable_entity
    end
  end

  def update
    if @pokemon.update(pokemon_params)
      render json: @pokemon
    else
      render json: @pokemon.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @pokemon.destroy
  end

  private
    def set_pokemon
      @pokemon = Pokemon.find(params[:id])
    end

    def pokemon_params
      params.require(:pokemon).permit(:name, :base_experience, :stats, :types, :weight)
    end
end
