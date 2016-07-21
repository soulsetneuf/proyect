class FormCultivosController < ApplicationController
  before_action :set_form_cultivo, only: [:show, :edit, :update, :destroy]

  # GET /form_cultivos
  # GET /form_cultivos.json
  def index
    @form_cultivos = FormCultivo.all
    query = queryGrafico('form_cultivos')
    #query = "SELECT date_trunc('month', created_at) as label, COUNT(*) AS value  FROM form_chagas where form_chagas.created_at>='2016-01-01 00:00:00' and form_chagas.created_at<='2016-12-12 24:00:00' GROUP BY 1 ORDER BY label ASC"
    @reporte_mensual_cultivos = Paciente.find_by_sql(query)
    gon.query = query
    gon.reporte_mensual_cultivos = @reporte_mensual_cultivos
  end

  # GET /form_cultivos/1
  # GET /form_cultivos/1.json
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

  # GET /form_cultivos/new
  def new
    @form_cultivo = FormCultivo.new
  end

  # GET /form_cultivos/1/edit
  def edit
  end

  # POST /form_cultivos
  # POST /form_cultivos.json
  def create
    @form_cultivo = FormCultivo.new(form_cultivo_params)
    begin
      @paciente = Paciente.find(params[:form_cultivo][:paciente_id])
      @paciente.form_laboratorio_id=10
      @paciente.save
    rescue Exception => e

    end

    respond_to do |format|
      if @form_cultivo.save
        format.html { redirect_to @form_cultivo, notice: 'Form cultivo was successfully created.' }
        format.json { render :show, status: :created, location: @form_cultivo }
      else
        format.html { render :new }
        format.json { render json: @form_cultivo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /form_cultivos/1
  # PATCH/PUT /form_cultivos/1.json
  def update
    respond_to do |format|
      if @form_cultivo.update(form_cultivo_params)
        format.html { redirect_to @form_cultivo, notice: 'Form cultivo was successfully updated.' }
        format.json { render :show, status: :ok, location: @form_cultivo }
      else
        format.html { render :edit }
        format.json { render json: @form_cultivo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /form_cultivos/1
  # DELETE /form_cultivos/1.json
  def destroy
    @form_cultivo.destroy
    respond_to do |format|
      format.html { redirect_to form_cultivos_url, notice: 'Form cultivo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_form_cultivo
      @form_cultivo = FormCultivo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def form_cultivo_params
      params.require(:form_cultivo).permit(:paciente_id, :hospital_id, :fecha, :tipo_muestra, :medico, :periodo, :observaciones)
    end
end
