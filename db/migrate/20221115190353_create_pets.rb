class CreatePets < ActiveRecord::Migration[7.0]
  def change
    create_table :pets do |t|
      t.string      :name
      t.integer     :age
      t.string      :species
      t.boolean     :adopted?

      # t.integer     :shelter_id
      # t.integer     :adopter_id
      t.belongs_to    :shelter
      t.belongs_to    :adopter
    end
  end
end
