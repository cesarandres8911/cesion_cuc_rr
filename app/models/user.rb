class User < ApplicationRecord
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :location, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true

  after_create :assig_resource
  before_create :assig

  def assig_resource
    pp 'Hello world I am testing model callback'
    pp '*' * 100
  end

  def assig
    pp 'Hello world I am testing model callback before'
    pp 'bef ' * 100
  end
end
