class IllnessesController < ApplicationController
  skip_before_action :authenticate, only: :show

  def index
    @illness = Illness.all
  end
  
  def show
    @illness = Illness.find_by(id: params[:id])  
  end


  def new
    @illness = Illness.new
  end

  def create
    @illness = Illness.new(illness_params)
    @illness.save
    if @patient.valid?
      redirect_to illnesss_url, notice: "Illness added."
    else
      render "new"
    end
  end
  # add illness_id dropdown on views
  
  def edit
    @illness = Illness.find_by(id: params[:id])
  end

  def update
    @illness = Illness.find_by(id: params[:id])
    @illness.update(illness_params)
    redirect_to illnesss_url
  end
  
  def destroy
    @illness = Illness.find_by(id: params[:id])
    @illness.destroy
    redirect_to illnesss_url
  end

  def illness_params
    params.require(:illness).permit(:name)
  end
end

