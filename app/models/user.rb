class User < ApplicationRecord
    has_many :ffnis, dependent: :destroy
end
