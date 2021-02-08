class List < ApplicationRecord
    belongs_to :user
    belongs_to :topic
    accepts_nested_attributes_for :topic, reject_if: proc { |attributes| attributes['name'].blank? }
end
