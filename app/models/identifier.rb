class Identifier < ApplicationRecord
  belongs_to :npi_company

  def name
    desc
  end

end
