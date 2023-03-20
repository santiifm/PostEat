class Comment < ApplicationRecord
  belongs_to :article
  has_many :logs, as: :loggable
end