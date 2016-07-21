class FormLiquidosController < ApplicationController
  before_action :set_form_liquido, only: [:show, :edit, :update, :destroy]

  # GET /form_liquidos
  # GET /form_liquidos.json
  def index
    @form_liquidos = FormLiquido.all
    
    query = queryGrafico('form_liquidos')
    #query = "SELECT date_trunc('month', created_at) as label, COUNT(*) AS value  FROM form_chagas where form_chagas.created_at>='2016-01-01 00:00:00' and form_chagas.created_at<='2016-12-12 24:00:00' GROUP BY 1 ORDER BY label ASC"
    @reporte_mensual_liquidos = Paciente.find_by_sql(query)
    gon.query = query
    gon.reporte_mensual_liquidos = @reporte_mensual_liquidos

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

  # GET /form_liquidos/1
  # GET /form_liquidos/1.json
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

  # GET /form_liquidos/new
  def new
    @form_liquido = FormLiquido.new
  end

  # GET /form_liquidos/1/edit
  def edit
  end

  # POST /form_liquidos
  # POST /form_liquidos.json
  def create
    @form_liquido = FormLiquido.new(form_liquido_params)
    begin
       @paciente = Paciente.find(params[:form_liquido][:paciente_id])
       @paciente.form_laboratorio_id=4
       @paciente.save
    rescue Exception => e

    end
    

    respond_to do |format|
      if @form_liquido.save
        format.html { redirect_to @form_liquido, notice: 'Form liquido was successfully created.' }
        format.json { render :show, status: :created, location: @form_liquido }
      else
        format.html { render :new }
        format.json { render json: @form_liquido.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /form_liquidos/1
  # PATCH/PUT /form_liquidos/1.json
  def update
    respond_to do |format|
      if @form_liquido.update(form_liquido_params)
        format.html { redirect_to @form_liquido, notice: 'Form liquido was successfully updated.' }
        format.json { render :show, status: :ok, location: @form_liquido }
      else
        format.html { render :edit }
        format.json { render json: @form_liquido.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /form_liquidos/1
  # DELETE /form_liquidos/1.json
  def destroy
    @form_liquido.destroy
    respond_to do |format|
      format.html { redirect_to form_liquidos_url, notice: 'Form liquido was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_form_liquido
    @form_liquido = FormLiquido.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def form_liquido_params
    params.require(:form_liquido).permit(:paciente_id, :hospital_id, :servicio, :medico_solicitante, :diag_clinico, :datos_impot, :fun, :fup, :hormonoterapia, :radioterapia, :conclusion, :dr, :citologo)
  end
end
