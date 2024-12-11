class Agency < ApplicationRecord
  belongs_to :company
  belongs_to :state
end
