class Client < ApplicationRecord
  belongs_to :tte_servicing_pharmacy
  belongs_to :state
end
