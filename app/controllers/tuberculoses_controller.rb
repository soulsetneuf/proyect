class TuberculosesController < ApplicationController
  before_action :set_tuberculose, only: [:show, :edit, :update, :destroy]

  # GET /tuberculoses
  # GET /tuberculoses.json
  def index
    @tuberculoses = Tuberculose.all
  end

  # GET /tuberculoses/1
  # GET /tuberculoses/1.json
  def show
  end

  # GET /tuberculoses/new
  def new
    @tuberculose = Tuberculose.new
  end

  # GET /tuberculoses/1/edit
  def edit
  end

  # POST /tuberculoses
  # POST /tuberculoses.json
  def create
    @tuberculose = Tuberculose.new(tuberculose_params)
    begin
      @paciente = Paciente.find(params[:tuberculose][:paciente_id])
      @paciente.form_laboratorio_id=8
      @paciente.save
    rescue Exception => e

    end

    respond_to do |format|
      if @tuberculose.save
        format.html { redirect_to @tuberculose, notice: 'Tuberculose was successfully created.' }
        format.json { render :show, status: :created, location: @tuberculose }
      else
        format.html { render :new }
        format.json { render json: @tuberculose.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tuberculoses/1
  # PATCH/PUT /tuberculoses/1.json
  def update
    respond_to do |format|
      if @tuberculose.update(tuberculose_params)
        format.html { redirect_to @tuberculose, notice: 'Tuberculose was successfully updated.' }
        format.json { render :show, status: :ok, location: @tuberculose }
      else
        format.html { render :edit }
        format.json { render json: @tuberculose.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tuberculoses/1
  # DELETE /tuberculoses/1.json
  def destroy
    @tuberculose.destroy
    respond_to do |format|
      format.html { redirect_to tuberculoses_url, notice: 'Tuberculose was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tuberculose
      @tuberculose = Tuberculose.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tuberculose_params
      params.require(:tuberculose).permit(:form_laboratorio_id, :paciente_id, :tipo_de_muestra, :razon, :string, :mendico, :centro_de_salud, :observaciones)
    end
end
