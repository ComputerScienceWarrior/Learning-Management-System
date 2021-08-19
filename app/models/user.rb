class User < ApplicationRecord
    extend FriendlyId
    friendly_id :username, use: :slugged

    def full_name
        self.first_name + " " + self.last_name
    end
end
