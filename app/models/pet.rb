class Pet < ActiveRecord::Base

    belongs_to :adopter
    belongs_to :shelter

    def self.oldest
        # self.all.max_by { |pet| pet.age }

        order(:age).last
    end

    def self.average_age
        average(:age).to_int
    end

    def in_dog_years
        self.species.downcase == 'dog' ? self.age * 5 : 'Not a dog.'
    end
end
