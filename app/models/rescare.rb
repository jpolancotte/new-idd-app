class Rescare < ApplicationRecord
    def get_address
        [address, city, state, zip].compact.join(', ')
    end
end
