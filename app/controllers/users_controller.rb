class UsersController < ApplicationController
  before_action :set_user, only: %i[listings]
  def bookings
    @bookings = current_user.bookings

  end

  def listings


  end

  private

  def set_user
    @user = current_user
  end
end
