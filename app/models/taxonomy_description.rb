class TaxonomyDescription < ApplicationRecord
    validates :name, :presence => true, :uniqueness => true
end
