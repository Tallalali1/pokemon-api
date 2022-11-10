# frozen_string_literal: true

class Stats < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'hstore' unless extension_enabled?('hstore')
    create_table :stats do |t|
      t.integer :base_stat
      t.integer :effort
      t.integer :pokemon_id
      t.hstore :stat
      t.timestamps
    end
  end
end
