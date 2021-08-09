class User < ApplicationRecord
    has_secure_password
    extend FriendlyId
    friendly_id :username, use: :slugged

    def full_name
        self.first_name + " " + self.last_name
    end
end
