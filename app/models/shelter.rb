class Shelter < ActiveRecord::Base

    has_many :pets
    has_many :adopters, through: :pets

    def current_pets

        self.pets.filter { |pet| !pet['adopted?'] }

        # self.pets.where(adopted?: false)
    end

    def adopted_pets
        self.pets.filter { |pet| pet['adopted?'] }

        # self.pets.where(adopted?: true)
    end
end
