class WorkersController < ApplicationController
  before_action :set_worker, only: [:show, :edit, :update, :destroy]

  def index
    @workers = Worker.paginate(page: params[:page], per_page: 10)
  end

  def show
    no_secret_action
  end

  def new
    @worker = Worker.new
  end

  def edit
  end

  def create
    @worker = Worker.new(worker_params)

    respond_to do |format|
      if @worker.save
        format.html { redirect_to @worker, notice: 'Worker was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @worker.update(worker_params)
        format.html { redirect_to @worker, notice: 'Worker was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @worker.destroy
    respond_to do |format|
      format.html { redirect_to workers_url, notice: 'Worker was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_worker
      @worker = Worker.find(params[:id])
    end

    def worker_params
      params.require(:worker).permit(:first_name, :last_name, :patronymic_name, :position_id, :birthdate)
    end

    def no_secret_action
      if @worker.position.title.downcase == "god"
        render file: "#{Rails.root}/public/404.html", layout: false, status: 404
      elsif @worker.position.title.downcase == "batman"
        render file: "#{Rails.root}/public/500.html", layout: false, status: 500
      end
    end
end
