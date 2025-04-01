class Deal < ApplicationRecord
  # validates :dealname, :presence => true, :uniqueness => true
  validates :objectid, presence: true, db_uniqueness: true
  
  belongs_to :team, optional: true
  belongs_to :deal_stage, optional: true 
  has_many :events, dependent: :destroy

  has_many :deal_pipeline_activities, dependent: :destroy
  # has_many :pipeline_activities, through: :deal_pipeline_activities

  has_many :pipeline_activities, -> { distinct }, through: :deal_pipeline_activities

  def name
    dealname
  end

end
