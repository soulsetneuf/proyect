class FormAnatCitologicasController < ApplicationController
  before_action :set_form_anat_citologica, only: [:show, :edit, :update, :destroy]

  # GET /form_anat_citologicas
  # GET /form_anat_citologicas.json
  def index
    @form_anat_citologicas = FormAnatCitologica.all
    query = queryGrafico('form_anat_citologicas')
    #query = "SELECT date_trunc('month', created_at) as label, COUNT(*) AS value  FROM form_chagas where form_chagas.created_at>='2016-01-01 00:00:00' and form_chagas.created_at<='2016-12-12 24:00:00' GROUP BY 1 ORDER BY label ASC"
    @reporte_mensual_citologia = Paciente.find_by_sql(query)
    gon.query = query
    gon.reporte_mensual_citologia = @reporte_mensual_citologia
  end

  # GET /form_anat_citologicas/1
  # GET /form_anat_citologicas/1.json
  def show
    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => "file_name",
               :layout => 'pdf.html.erb',
               :page_size => 'Letter',
               :footer => {:right => '[page] de [topage]', :font_size => 7}
      end
    end
  end

  # GET /form_anat_citologicas/new
  def new
    @form_anat_citologica = FormAnatCitologica.new
  end

  # GET /form_anat_citologicas/1/edit
  def edit
  end

  # POST /form_anat_citologicas
  # POST /form_anat_citologicas.json
  def create
    @form_anat_citologica = FormAnatCitologica.new(form_anat_citologica_params)

    begin
      @paciente = Paciente.find(params[:form_anat_citologica][:paciente_id])
      @paciente.form_laboratorio_id=13
      @paciente.save
    rescue Exception => e

    end
    

    respond_to do |format|
      if @form_anat_citologica.save
        format.html { redirect_to @form_anat_citologica, notice: 'Form anat citologica was successfully created.' }
        format.json { render :show, status: :created, location: @form_anat_citologica }
      else
        format.html { render :new }
        format.json { render json: @form_anat_citologica.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /form_anat_citologicas/1
  # PATCH/PUT /form_anat_citologicas/1.json
  def update
    respond_to do |format|
      if @form_anat_citologica.update(form_anat_citologica_params)
        format.html { redirect_to @form_anat_citologica, notice: 'Form anat citologica was successfully updated.' }
        format.json { render :show, status: :ok, location: @form_anat_citologica }
      else
        format.html { render :edit }
        format.json { render json: @form_anat_citologica.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /form_anat_citologicas/1
  # DELETE /form_anat_citologicas/1.json
  def destroy
    @form_anat_citologica.destroy
    respond_to do |format|
      format.html { redirect_to form_anat_citologicas_url, notice: 'Form anat citologica was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_form_anat_citologica
      @form_anat_citologica = FormAnatCitologica.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def form_anat_citologica_params
      params.require(:form_anat_citologica).permit(:paciente_id, :hospital_id, :servicio, :cama, :diagnostico_clinico, :datos_anatomicos, :lugar_muestra, :diagnostico_operatorio, :pieza_quirurgica, :biopsia, :otros, :conservante, :fecha_entreg)
    end
end
