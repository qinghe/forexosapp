class CurrenciesController < ApplicationController
  before_filter :authorize_admin
  before_action :set_currency, only: [:show, :edit, :update]

  def index
    @currencies = Currency.all
  end

  def show
  end

  def new
    @currency = Currency.new
  end

  def edit
  end

  def create
    @currency = Currency.new(currency_params)
    if @currency.save
      redirect_to @currency, notice: 'Currency was successfully created.' 
    else
      render :new 
    end
  end

  def update
    if @currency.update(currency_params)
      redirect_to @currency, notice: 'Currency was successfully updated.' 
    else
      render :edit 
    end
  end

  private

    def set_currency
      @currency = Currency.find(params[:id])
    end


    def currency_params
      params.require(:currency).permit(:name, :iso)
    end
end
