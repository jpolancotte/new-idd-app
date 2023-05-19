class Deal < ApplicationRecord
  belongs_to :team, optional: true
  belongs_to :deal_stage, optional: true

  validates :dealname, :presence => true, :uniqueness => true

  def name
    dealname
  end

end
