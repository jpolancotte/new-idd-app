class Deal < ApplicationRecord
  belongs_to :team
  belongs_to :deal_stage

  validates :name, :presence => true, :uniqueness => true
end
