class PagesController < ApplicationController
skip_before_action :authenticate_user!, only: [:discover]

  def home
    @invoices = Invoice.all
    @clients = Client.all
    @income_per_month = current_user.total_paid_ht_per_month

    @income_months = @income_per_month.map { |income| I18n.localize(Date.new(2019, income.month), format: '%B') }
    @income_values = @income_per_month.map { |income| income.total }

    @income_per_quarter = current_user.total_paid_ht_per_quarter
    @income_per_current_quarter = current_user.total_paid_for_current_quarter
    @income_per_current_quarter_to_pay = current_user.total_paid_for_current_quarter * current_user.tax_rate
  end


  def discover
  end
end
