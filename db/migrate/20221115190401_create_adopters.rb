class CreateAdopters < ActiveRecord::Migration[7.0]
  def change
    create_table :adopters do |t|
      t.string      :first_name
      t.string      :last_name
    end
  end
end
