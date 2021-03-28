class GroupedPaymentsController < ApplicationController
  before_action :set_grouped_payment, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # GET /grouped_payments or /grouped_payments.json
  def index
    @grouped_payments = GroupedPayment.all
  end

  # GET /grouped_payments/1 or /grouped_payments/1.json
  def show; end

  # GET /grouped_payments/new
  def new
    @grouped_payment = GroupedPayment.new
  end

  # GET /grouped_payments/1/edit
  def edit; end

  # POST /grouped_payments or /grouped_payments.json
  def create
    @grouped_payment = GroupedPayment.new(grouped_payment_params)
    @payment = Payment.find(@grouped_payment.payment_id)

    respond_to do |format|
      if @grouped_payment.save
        format.html { redirect_to @payment, notice: 'Grouped payment was successfully created.' }
        format.json { render :show, status: :created, location: @grouped_payment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @grouped_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /grouped_payments/1 or /grouped_payments/1.json
  def update
    respond_to do |format|
      if @grouped_payment.update(grouped_payment_params)
        format.html { redirect_to @grouped_payment, notice: 'Grouped payment was successfully updated.' }
        format.json { render :show, status: :ok, location: @grouped_payment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @grouped_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grouped_payments/1 or /grouped_payments/1.json
  def destroy
    @payment = Payment.find(@grouped_payment.payment_id)
    @grouped_payment.destroy
    respond_to do |format|
      format.html { redirect_to @payment, notice: 'Grouped payment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_grouped_payment
    @grouped_payment = GroupedPayment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def grouped_payment_params
    params.required(:grouped_payment).permit(:group_id, :payment_id)
  end
end
