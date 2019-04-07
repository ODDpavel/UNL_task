class Project < ApplicationRecord
  has_many :tasks
  validates :name, :summary, presence: true
end
