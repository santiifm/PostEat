class LogsController < ApplicationController
  def index
    @logs = Log.all.limit(10)
  end
end
