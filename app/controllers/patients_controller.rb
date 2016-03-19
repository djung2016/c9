class PatientsController < ApplicationController
  skip_before_action :authenticate, only: :show

  def index
    @patients = Patient.all
  end
  
  def show
    @patient = Patient.find_by(id: params[:id])  
  end


  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    # PatientIlness.create(patient_id: @patient.id, illnes_id: params[:patient][:illness_id])
    # FamilRelationship.create(patient_id: @patient.id, user_id: params[:patient][:user_id])
    # CareproRelationship.create(patient_id: @patient.id, user_id: params[:patient][:user_id])
    upload_image 
    @patient.save
    if @patient.valid?
      redirect_to patients_url, notice: "Patient added."
    else
      render "new"
    end
  end
  # add illness_id dropdown on views
  
  def edit
    @patient = Patient.find_by(id: params[:id])
  end

  def update
    @patient = Patient.find_by(id: params[:id])
    @patient.update(patient_params)
    @patient.save
    redirect_to patients_url
  end
  
  def destroy
    @patient = Patient.find_by(id: params[:id])
    @patient.destroy
    redirect_to patients_url
  end

  def upload_image
    # read the uploaded file
    file = params[:patient][:image]
    if file.present?
      @patient.image = Base64.encode64(params[:patient][:image].read)
    end
  end
  
 def patient_params
   params.require(:patient).permit(:name, :age, :gender, :image, :phone_no, :address, :email, :password, :about)
 end
end
