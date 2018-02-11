class Size < ApplicationRecord
    validates :name, presence: true
    has_many :dogs, dependent: :nullify
end
