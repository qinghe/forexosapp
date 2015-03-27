class TransactionsController < ApplicationController
  before_filter :authorize
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]

  def index
    @customer = Customer.find(params[:customer_id])
    @transactions = Transaction.all
  end

  def show
    @customer = Customer.find(params[:customer_id])
    @transaction = @customer.transactions.find(params[:id])
  end

  def new
    @customer = Customer.find(params[:customer_id])
    @transaction = @customer.transactions.new
    @currency_pairs = CurrencyPair.all
    @rates = Rate.all
  end

  def edit
    @customer = Customer.find(params[:customer_id])
    @transaction = @customer.transactions.find(params[:id])
  end

  def create
    @customer = Customer.find(params[:customer_id])
    @transaction = @customer.transactions.new(transaction_params)
    id = @transaction
    @transaction.rate_value = "#{Rate.find_by_id(id.rate_id).rate}"
    if @transaction.save
      redirect_to customer_transactions_path, notice: 'Transaction was successfully created.'
    else
      render :new
    end
  end

  def update
    if @transaction.update(transaction_params)
      redirect_to customer_transaction_path(params[:customer_id], @transaction), notice: 'Transaction was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @transaction.destroy
    redirect_to transactions_url, notice: 'Transaction was successfully destroyed.'
  end

  private

    def set_transaction
      @transaction = Transaction.find(params[:id])
    end


    def transaction_params
      params.require(:transaction).permit(:currency_pair_id, :rate_id, :fr_amount, :to_amount, :customer_id)
    end
end
