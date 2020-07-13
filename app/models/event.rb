class Event < ActiveRecord::Base
    belongs_to :user
    validates :title, :date, :description, presence: true
end 