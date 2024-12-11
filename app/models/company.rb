class Company < ApplicationRecord
  belongs_to :state
  has_many :agencies, dependent: :destroy
end
