class Book < ApplicationRecord
  belongs_to :author
  
  validates :title, presence: true
  validates :content, presence: true
end
