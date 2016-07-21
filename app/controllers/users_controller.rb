class UsersController < ApplicationController
  before_action :set_rol, only: [:show, :edit, :update]

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'Paciente registrado correctamente.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'Datos actualizados correctamente.' }
      else
        format.html { render :edit }
      end
    end
  end
   def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Se elimino al usuario correctamente"
    redirect_to users_url
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_rol
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit( :password, :email, :password_confirmation, :rol_id,:ci)
  end
end
