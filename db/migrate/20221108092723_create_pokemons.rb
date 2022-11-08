class CreatePokemons < ActiveRecord::Migration[7.0]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.integer :base_experience
      # t.integer :stats_id
      # t.integer :types_id
      t.integer :weight

      t.timestamps
    end
  end
end
