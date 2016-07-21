class FormLaboratoriosController < ApplicationController
  before_action :set_form_laboratorio, only: [:show, :edit, :update, :destroy]

  # GET /form_laboratorios
  # GET /form_laboratorios.json
  def index
    @form_laboratorios = FormLaboratorio.all
  end

  # GET /form_laboratorios/1
  # GET /form_laboratorios/1.json
  def show
  end

  # GET /form_laboratorios/new
  def new
    @form_laboratorio = FormLaboratorio.new
  end

  # GET /form_laboratorios/1/edit
  def edit
  end

  # POST /form_laboratorios
  # POST /form_laboratorios.json
  def create
    @form_laboratorio = FormLaboratorio.new(form_laboratorio_params)

    respond_to do |format|
      if @form_laboratorio.save
        format.html { redirect_to @form_laboratorio, notice: 'Form laboratorio was successfully created.' }
        format.json { render :show, status: :created, location: @form_laboratorio }
      else
        format.html { render :new }
        format.json { render json: @form_laboratorio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /form_laboratorios/1
  # PATCH/PUT /form_laboratorios/1.json
  def update
    respond_to do |format|
      if @form_laboratorio.update(form_laboratorio_params)
        format.html { redirect_to @form_laboratorio, notice: 'Form laboratorio was successfully updated.' }
        format.json { render :show, status: :ok, location: @form_laboratorio }
      else
        format.html { render :edit }
        format.json { render json: @form_laboratorio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /form_laboratorios/1
  # DELETE /form_laboratorios/1.json
  def destroy
    @form_laboratorio.destroy
    respond_to do |format|
      format.html { redirect_to form_laboratorios_url, notice: 'Form laboratorio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_form_laboratorio
      @form_laboratorio = FormLaboratorio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def form_laboratorio_params
      params.require(:form_laboratorio).permit(:nombre, :paciente_id, :usuario_id, :hospital_id, :fecha_toma_muestra, :fecha_entrega)
    end
end
