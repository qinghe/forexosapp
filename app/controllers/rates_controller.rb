class RatesController < ApplicationController
  before_filter :authorize
  before_action :set_rate, only: [:show, :edit, :update]

  def index
    @rates = Rate.all
  end

  def show
  end

  def new
    @rate = Rate.new
    @ccy_pair_iso
  end

  def edit
  end

  def create
    @rate = Rate.new(rate_params)
    if @rate.save
      redirect_to currency_pairs_path, notice: 'Rate was successfully created.'
    else
      render :new
    end
  end

  def update
    if @rate.update(rate_params)
      redirect_to @rate, notice: 'Rate was successfully updated.'
    else
      render :edit
    end
  end

  private
    def set_rate
      @rate = Rate.find(params[:id])
    end

    def rate_params
      params.require(:rate).permit(:rate, :currency_pair_id)
    end
end
