# frozen_string_literal: true

class Types < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'hstore' unless extension_enabled?('hstore')
    create_table :types do |t|
      t.integer :slot
      t.hstore :type
      t.integer :pokemon_id
      t.timestamps
    end
  end
end
