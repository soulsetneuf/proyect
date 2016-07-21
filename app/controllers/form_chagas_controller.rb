class FormChagasController < ApplicationController
  before_action :set_form_chaga, only: [:show, :edit, :update, :destroy]

  # GET /form_chagas
  # GET /form_chagas.json
  def index
    @form_chagas = FormChaga.all
    query = queryGrafico('form_chagas')
    #query = "SELECT date_trunc('month', created_at) as label, COUNT(*) AS value  FROM form_chagas where form_chagas.created_at>='2016-01-01 00:00:00' and form_chagas.created_at<='2016-12-12 24:00:00' GROUP BY 1 ORDER BY label ASC"
    @reporte_mensual_chagas = Paciente.find_by_sql(query)
    gon.query = query
    gon.reporte_mensual_chagas = @reporte_mensual_chagas
  end

  # GET /form_chagas/1
  # GET /form_chagas/1.json
  def show
    query = "SELECT date_trunc('month', created_at) as label, COUNT(*) AS value  FROM form_chagas where form_chagas.created_at>='2016-01-01 00:00:00' and form_chagas.created_at<='2016-12-12 24:00:00' GROUP BY 1 ORDER BY label ASC"
    @reporte_mensual_chagas = Paciente.find_by_sql(query)
    gon.query = query
    gon.reporte_mensual_chagas = @reporte_mensual_chagas
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

  # GET /form_chagas/new
  def new
    @form_chaga = FormChaga.new
  end

  # GET /form_chagas/1/edit
  def edit
  end

  # POST /form_chagas
  # POST /form_chagas.json
  def create
    @form_chaga = FormChaga.new(form_chaga_params)

    begin
      @paciente = Paciente.find(params[:form_chaga][:paciente_id])
      @paciente.form_laboratorio_id=5
      @paciente.save
    rescue Exception => e

    end

    respond_to do |format|
      if @form_chaga.save
        format.html { redirect_to @form_chaga, notice: 'Form chaga was successfully created.' }
        format.json { render :show, status: :created, location: @form_chaga }
      else
        format.html { render :new }
        format.json { render json: @form_chaga.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /form_chagas/1
  # PATCH/PUT /form_chagas/1.json
  def update
    respond_to do |format|
      if @form_chaga.update(form_chaga_params)
        format.html { redirect_to @form_chaga, notice: 'Form chaga was successfully updated.' }
        format.json { render :show, status: :ok, location: @form_chaga }
      else
        format.html { render :edit }
        format.json { render json: @form_chaga.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /form_chagas/1
  # DELETE /form_chagas/1.json
  def destroy
    @form_chaga.destroy
    respond_to do |format|
      format.html { redirect_to form_chagas_url, notice: 'Form chaga was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_form_chaga
      @form_chaga = FormChaga.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def form_chaga_params
      params.require(:form_chaga).permit(:paciente_id, :hospital_id, :muestra, :diag_serologico, :conclucion_diag, :diag_confir, :conclu_pueb_confir, :observaciones, :firma)
    end
end
