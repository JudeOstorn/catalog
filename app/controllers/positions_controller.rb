class PositionsController < ApplicationController
  before_action :set_position, only: [:show, :edit, :update, :destroy]


  def index
    @positions = Position.paginate(page: params[:page], per_page: 10)
  end

  def show
  end

  def new
    @position = Position.new
  end

  def edit
  end

  def create
    @position = Position.new(position_params)

    respond_to do |format|
      if @position.save
        format.html { redirect_to @position, notice: 'Position was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @position.update(position_params)
        format.html { redirect_to @position, notice: 'Position was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @position.destroy
    respond_to do |format|
      format.html { redirect_to positions_url, notice: 'Position was successfully destroyed.' }
    end
  end

  private
    def set_position
      @position = Position.find(params[:id])
    end

    def position_params
      params.require(:position).permit(:title)
    end
end
