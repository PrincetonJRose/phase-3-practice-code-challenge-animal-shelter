class Adopter < ActiveRecord::Base

    has_many :pets
    has_many :shelters, through: :pets

    def full_name
        "#{ self.first_name } #{ self.last_name }"
    end

    def adopt pet
        if pet.adopted?
            "I already have a home! But thanks for the consideration! 🐶"
        else
            # pet['adopted?'] = true
            # pet.adopter = self
            # pet.save

            pet.update( adopted?: true, adopter: self )
        end
    end

    def fav_pet
        if self.pets.any?
            self.pets.max_by { |pet| pet.species }.species
            # self.pets.order(:species).last.species
        else
            nil
        end
    end
end
