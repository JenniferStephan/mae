class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]

  def edit
  end

  def update
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:invoice).permit(:first_name, :last_name, :email, :username, :siret, :tax_rate, :address, :vat)
  end

end

