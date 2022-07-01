class Product < ApplicationRecord
    validates :name , presence:true
    validates :descripton , presence:true
    validates :price , presence:true
    has_one_attached :image
    belongs_to :user

end
