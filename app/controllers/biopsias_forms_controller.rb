class BiopsiasFormsController < ApplicationController
  before_action :set_biopsias_form, only: [:show, :edit, :update, :destroy]

  # GET /biopsias_forms
  # GET /biopsias_forms.json
  def index
    @biopsias_forms = BiopsiasForm.all
    query = queryGrafico('biopsias_forms')
    #query = "SELECT date_trunc('month', created_at) as label, COUNT(*) AS value  FROM form_chagas where form_chagas.created_at>='2016-01-01 00:00:00' and form_chagas.created_at<='2016-12-12 24:00:00' GROUP BY 1 ORDER BY label ASC"
    @reporte_mensual_biopsias = Paciente.find_by_sql(query)
    gon.query = query
    gon.reporte_mensual_biopsias = @reporte_mensual_biopsias
  end

  # GET /biopsias_forms/1
  # GET /biopsias_forms/1.json
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

  # GET /biopsias_forms/new
  def new
    @biopsias_form = BiopsiasForm.new
  end

  # GET /biopsias_forms/1/edit
  def edit
  end

  # POST /biopsias_forms
  # POST /biopsias_forms.json
  def create
    @biopsias_form = BiopsiasForm.new(biopsias_form_params)
    begin
       @paciente = Paciente.find(params[:biopsias_form][:paciente_id])
       @paciente.form_laboratorio_id=3
       @paciente.save
    rescue Exception => e

    end

    respond_to do |format|
      if @biopsias_form.save
        format.html { redirect_to @biopsias_form, notice: 'Biopsias form was successfully created.' }
        format.json { render :show, status: :created, location: @biopsias_form }
      else
        format.html { render :new }
        format.json { render json: @biopsias_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /biopsias_forms/1
  # PATCH/PUT /biopsias_forms/1.json
  def update
    respond_to do |format|
      if @biopsias_form.update(biopsias_form_params)
        format.html { redirect_to @biopsias_form, notice: 'Biopsias form was successfully updated.' }
        format.json { render :show, status: :ok, location: @biopsias_form }
      else
        format.html { render :edit }
        format.json { render json: @biopsias_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /biopsias_forms/1
  # DELETE /biopsias_forms/1.json
  def destroy
    @biopsias_form.destroy
    respond_to do |format|
      format.html { redirect_to biopsias_forms_url, notice: 'Biopsias form was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_biopsias_form
      @biopsias_form = BiopsiasForm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def biopsias_form_params
      params.require(:biopsias_form).permit(:paciente_id, :hospital_id, :servicio, :medico_solicitante, :diag_clinico, :datos_anatom, :datos_import, :macroscopico, :microscopico, :diagnostico, :dr, :patologo)
    end
end
