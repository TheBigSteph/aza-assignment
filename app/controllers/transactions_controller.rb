class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :update, :destroy]

  # GET /transactions
  def index
    @transactions = Transaction.all

    render json: @transactions
  end

  # GET /transactions/1
  def show
    #get_transaction = Transaction.find(@transaction)
    if @transaction.present?
      render json: @transaction
    else
      render json: {error: "this transaction don't exist"}
    end
  end

  # POST /transactions
  def create
    @transaction = Transaction.new(transaction_params)

    if @transaction.save
      render json: @transaction, status: :created, location: @transaction
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /transactions/1
  def update
    if @transaction.update(transaction_params)
      render json: @transaction
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end

  # DELETE /transactions/1
  def destroy
    @transaction.destroy
  end

  def get_transaction_by_customer
    customer = Customer.find(params[:customer_id])
    if customer.present?
      @transaction = Transaction.where(:customer_id => customer.id)
      render json: @transaction
    else
      render json: {error:  "This customer don't have transaction"}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def transaction_params
      params.require(:transaction).permit(:customer_id, :input_amount, :input_currency, :output_amount, :output_currency)
    end
end
