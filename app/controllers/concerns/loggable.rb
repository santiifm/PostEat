module Loggable
  extend ActiveSupport::Concern

  def included(base)
    base.after_action :create_log, only: %i[ show edit update destroy ]
  end

  def create_log
    self.logs.create(user_id: current_user.id, action: action_name)
  end
end