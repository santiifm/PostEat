class Log < ApplicationRecord
  belongs_to :user
  belongs_to :loggable, polymorphic: true
end
