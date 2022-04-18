class RailsTutorialsController < ApplicationController
  before_action :set_rails_tutorial, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]
  # GET /rails_tutorials or /rails_tutorials.json
  def index
    @rails_tutorials = RailsTutorial.all
  end

  # GET /rails_tutorials/1 or /rails_tutorials/1.json
  def show
  end

  # GET /rails_tutorials/new
  def new
    #@rails_tutorial = RailsTutorial.new
    @rails_tutorial = current_user.rails_tutorial.build
  end

  # GET /rails_tutorials/1/edit
  def edit
  end

  # POST /rails_tutorials or /rails_tutorials.json
  def create
    #@rails_tutorial = RailsTutorial.new(rails_tutorial_params)
    @rails_tutorial = current_user.rails_tutorial.build(rails_tutorial_params)

    respond_to do |format|
      if @rails_tutorial.save
        format.html { redirect_to rails_tutorial_url(@rails_tutorial), notice: "Rails tutorial was successfully created." }
        format.json { render :show, status: :created, location: @rails_tutorial }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @rails_tutorial.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rails_tutorials/1 or /rails_tutorials/1.json
  def update
    respond_to do |format|
      if @rails_tutorial.update(rails_tutorial_params)
        format.html { redirect_to rails_tutorial_url(@rails_tutorial), notice: "Rails tutorial was successfully updated." }
        format.json { render :show, status: :ok, location: @rails_tutorial }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @rails_tutorial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rails_tutorials/1 or /rails_tutorials/1.json
  def destroy
    @rails_tutorial.destroy

    respond_to do |format|
      format.html { redirect_to rails_tutorials_url, notice: "Rails tutorial was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @rails_tutorial = current_user.rails_tutorial.find_by(id: params[:id])
    redirect_to rails_tutorials_path, notice: "Log in as correct user" if @rails_tutorial.nil?
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rails_tutorial
      @rails_tutorial = RailsTutorial.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rails_tutorial_params
      params.require(:rails_tutorial).permit(:first_name, :last_name, :email, :phone, :twitter, :user_id)
    end
end
