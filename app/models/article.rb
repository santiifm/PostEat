class Article < ApplicationRecord
  has_one_attached :photo
  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :comments #, reject_if: ->(attributes){ attributes['name'].blank? }, allow_destroy: true
end
