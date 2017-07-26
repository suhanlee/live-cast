class FeedsController < ApplicationController
  def index
    @feeds = Room.all
  end
end
