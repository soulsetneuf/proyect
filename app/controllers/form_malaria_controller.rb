class FormMalariaController < ApplicationController
  before_action :set_form_malarium, only: [:show, :edit, :update, :destroy]

  # GET /form_malaria
  # GET /form_malaria.json
  def index
    @form_malaria = FormMalarium.all
    query = "SELECT date_trunc('month', created_at) as label, COUNT(*) AS value  FROM form_malaria where form_malaria.created_at>='2016-01-01 00:00:00' and form_malaria.created_at<='2016-12-12 24:00:00' GROUP BY 1 ORDER BY label asc"
    @reporte_mensual_malaria = Paciente.find_by_sql(query)
    gon.query = query
    gon.reporte_mensual_malaria = @reporte_mensual_malaria
  end

  # GET /form_malaria/1
  # GET /form_malaria/1.json
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

  # GET /form_malaria/new
  def new
    @form_malarium = FormMalarium.new
  end

  # GET /form_malaria/1/edit
  def edit
  end

  # POST /form_malaria
  # POST /form_malaria.json
  def create
    @form_malarium = FormMalarium.new(form_malarium_params)
    @paciente = Paciente.find(params[:form_malarium][:paciente_id])
    @paciente.form_laboratorio_id=6
    @paciente.save

    respond_to do |format|
      if @form_malarium.save
        format.html { redirect_to @form_malarium, notice: 'Form malarium was successfully created.' }
        format.json { render :show, status: :created, location: @form_malarium }
      else
        format.html { render :new }
        format.json { render json: @form_malarium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /form_malaria/1
  # PATCH/PUT /form_malaria/1.json
  def update
    respond_to do |format|
      if @form_malarium.update(form_malarium_params)
        format.html { redirect_to @form_malarium, notice: 'Form malarium was successfully updated.' }
        format.json { render :show, status: :ok, location: @form_malarium }
      else
        format.html { render :edit }
        format.json { render json: @form_malarium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /form_malaria/1
  # DELETE /form_malaria/1.json
  def destroy
    @form_malarium.destroy
    respond_to do |format|
      format.html { redirect_to form_malaria_url, notice: 'Form malarium was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_form_malarium
      @form_malarium = FormMalarium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def form_malarium_params
      params.require(:form_malarium).permit(:paciente_id, :hospital_id, :tiene_malar_trat_antimalarico, :diagnostico, :tratami, :compl_trat, :lugar_tratado, :lug_hace_sema, :ocupacion, :tipo_caso, :inicio_sint, :tipo, :prueba, :resultado, :densidad_paras, :peso, :trat_superv, :req_trat_mal_grave, :persis_sintom, :fecha_control, :firma)
    end
end
