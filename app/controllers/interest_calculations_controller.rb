class InterestCalculationsController < ApplicationController
  helper_method :sort_column, :sort_direction
  before_action :set_interest_calculation, only: [:show, :edit, :update, :destroy]

  def index
    @interest_calculations = InterestCalculation.order(sort_column + ' ' + sort_direction)
  end

  def show
  end

  def new
    @interest_calculation = InterestCalculation.new
  end

  def edit
  end

  def create
    calculate_amount(params)
    @interest_calculation = InterestCalculation.new(interest_calculation_params)
    respond_to do |format|
      if @interest_calculation.save
        format.html { redirect_to @interest_calculation, notice: 'Interest calculation was successfully created.' }
        format.json { render :show, status: :created, location: @interest_calculation }
      else
        format.html { render :new }
        format.json { render json: @interest_calculation.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @interest_calculation.update(interest_calculation_params)
        calculate_amount(params)
        @interest_calculation.update(interest_calculation_params)
        format.html { redirect_to @interest_calculation, notice: 'Interest calculation was successfully updated.' }
        format.json { render :show, status: :ok, location: @interest_calculation }
      else
        format.html { render :edit }
        format.json { render json: @interest_calculation.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @interest_calculation.destroy
    respond_to do |format|
      format.html { redirect_to interest_calculations_url, notice: 'Interest calculation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_interest_calculation
      @interest_calculation = InterestCalculation.find(params[:id])
    end

    def interest_calculation_params
      params.require(:interest_calculation).permit(:principal_amount, :interest_rate, :duration, :frequency, :final_amount)
    end

    def calculate_amount(params)
      principal_amount  = params[:interest_calculation][:principal_amount].to_d
      interest_rate     = params[:interest_calculation][:interest_rate].to_d/100
      time              = params[:interest_calculation][:duration].to_i
      frequency         = params[:interest_calculation][:frequency].to_i
  
      result = InterestCalculation.compound_interest(principal_amount, interest_rate, time, frequency)
      amount = { 'final_amount' => result.to_d.truncate(10) }
      params[:interest_calculation].merge!(amount)
    end

    def sort_column
      InterestCalculation.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
    end
end
