class Deal < ApplicationRecord
  # validates :dealname, :presence => true, :uniqueness => true
  validates :objectid, :presence => true, :uniqueness => true
  belongs_to :team, optional: true
  belongs_to :deal_stage, optional: true 
  has_many :events, dependent: :destroy

  def name
    dealname
  end

end
