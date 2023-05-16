class Deal < ApplicationRecord
  belongs_to :team, optional: true
  belongs_to :deal_stage, optional: true

  validates :name, :presence => true, :uniqueness => true
end
