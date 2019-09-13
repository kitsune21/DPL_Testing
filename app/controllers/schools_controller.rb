class SchoolsController < ApplicationController
  before_action :set_school, only: [:show, :edit, :update, :destroy]
  # GET /schools
  def index
    @schools = School.all
  end

  # GET /schools/1
  def show
  end

  # GET /schools/new
  def new
    @school = School.new
  end

  def create
    @school = School.new(school_params)
    if @school.save
      redirect_to @school
    else
      render :new
    end
  end

  # GET /schools/edit
  def edit
  end

  def update
    if @school.update(school_params)
      redirect_to @school, notice: 'School is updated'
    else
      render :edit
    end
  end 

  # POST /schools

  # DELETE /schools
  def destroy
    @school.destroy
    redirect_to @school, notice: "School is gone"
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_school
      @school = School.find(params[:school_id])
    end
    def school_params
      params.require(:school).permit(:name, :address, :principal, :capicity, :private_school)
    end
    # Only allow a trusted parameter "white list" through.

end
