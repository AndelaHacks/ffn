class User < ApplicationRecord
    has_many :ffnis, dependent: :destroy
    has_many :comments, dependent: :destroy
end
