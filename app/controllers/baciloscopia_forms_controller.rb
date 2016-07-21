class BaciloscopiaFormsController < ApplicationController
  before_action :set_baciloscopia_form, only: [:show, :edit, :update, :destroy]

  # GET /baciloscopia_forms
  # GET /baciloscopia_forms.json
  def index
    @baciloscopia_forms = BaciloscopiaForm.all
    query = queryGrafico('baciloscopia_forms')
    #query = "SELECT date_trunc('month', created_at) as label, COUNT(*) AS value  FROM form_chagas where form_chagas.created_at>='2016-01-01 00:00:00' and form_chagas.created_at<='2016-12-12 24:00:00' GROUP BY 1 ORDER BY label ASC"
    @reporte_mensual_baciloscopia = Paciente.find_by_sql(query)
    gon.reporte_mensual_baciloscopia = @reporte_mensual_baciloscopia
  end

  # GET /baciloscopia_forms/1
  # GET /baciloscopia_forms/1.json
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

  # GET /baciloscopia_forms/new
  def new
    @baciloscopia_form = BaciloscopiaForm.new
  end

  # GET /baciloscopia_forms/1/edit
  def edit
  end

  # POST /baciloscopia_forms
  # POST /baciloscopia_forms.json
  def create
    @baciloscopia_form = BaciloscopiaForm.new(baciloscopia_form_params)
    begin
      @paciente = Paciente.find(params[:baciloscopia_form][:paciente_id])
      @paciente.form_laboratorio_id=9
      @paciente.save
    rescue Exception => e

    end
    
    respond_to do |format|
      if @baciloscopia_form.save
        format.html { redirect_to @baciloscopia_form, notice: 'Baciloscopia form was successfully created.' }
        format.json { render :show, status: :created, location: @baciloscopia_form }
      else
        format.html { render :new }
        format.json { render json: @baciloscopia_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /baciloscopia_forms/1
  # PATCH/PUT /baciloscopia_forms/1.json
  def update
    respond_to do |format|
      if @baciloscopia_form.update(baciloscopia_form_params)
        format.html { redirect_to @baciloscopia_form, notice: 'Baciloscopia form was successfully updated.' }
        format.json { render :show, status: :ok, location: @baciloscopia_form }
      else
        format.html { render :edit }
        format.json { render json: @baciloscopia_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /baciloscopia_forms/1
  # DELETE /baciloscopia_forms/1.json
  def destroy
    @baciloscopia_form.destroy
    respond_to do |format|
      format.html { redirect_to baciloscopia_forms_url, notice: 'Baciloscopia form was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_baciloscopia_form
      @baciloscopia_form = BaciloscopiaForm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def baciloscopia_form_params
      params.require(:baciloscopia_form).permit(:paciente_id, :hospital_id, :fecha, :tipo_muestra, :razon_solicitud, :l_j, :s_t, :periodo)
    end
end
