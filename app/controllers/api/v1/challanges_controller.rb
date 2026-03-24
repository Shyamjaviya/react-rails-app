class Api::V1::ChallangesController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_challange, only: [:show, :edit, :update, :destroy]

  def index
    @challanges = Challange.all
    render json: @challanges
  end

  def create
    @challange = Challange.new(challange_params)
    if @challange.save
      render json: @challange, status: :created
    else
      render json: @challange.errors, status: :unprocessable_entity
    end
  end

  def edit
  end

  def show
    render json: @challange
  end

  def update
    if @challange.update(challange_params)
      render json: @challange, status: :ok
    else
      render json: @challange.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @challange.destroy
    head :no_content
  end

  private

  def set_challange
    @challange = Challange.find(params[:id])
  end

  def challange_params
    params.require(:challange).permit(:title, :description, :start_date, :end_date)
  end
end
