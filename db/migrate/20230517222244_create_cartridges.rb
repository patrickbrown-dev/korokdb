class CreateCartridges < ActiveRecord::Migration[7.0]
  def change
    create_table :cartridges do |t|
      t.references :game, null: false, foreign_key: true
      t.string :code
      t.string :build
      t.string :revision
      t.string :region
      t.string :game_version

      t.timestamps
    end
  end
end
