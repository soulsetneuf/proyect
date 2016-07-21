class FormCancerUterinosController < ApplicationController
  before_action :set_form_cancer_uterino, only: [:show, :edit, :update, :destroy]

  # GET /form_cancer_uterinos
  # GET /form_cancer_uterinos.json
  def index
    @form_cancer_uterinos = FormCancerUterino.all
    query = queryGrafico('form_cancer_uterinos')
    #query = "SELECT date_trunc('month', created_at) as label, COUNT(*) AS value  FROM form_chagas where form_chagas.created_at>='2016-01-01 00:00:00' and form_chagas.created_at<='2016-12-12 24:00:00' GROUP BY 1 ORDER BY label ASC"
    @reporte_mensual_cancer = Paciente.find_by_sql(query)
    gon.query = query
    gon.reporte_mensual_cancer = @reporte_mensual_cancer
  end

  # GET /form_cancer_uterinos/1
  # GET /form_cancer_uterinos/1.json
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

  # GET /form_cancer_uterinos/new
  def new
    @form_cancer_uterino = FormCancerUterino.new
  end

  # GET /form_cancer_uterinos/1/edit
  def edit
  end

  # POST /form_cancer_uterinos
  # POST /form_cancer_uterinos.json
  def create
    @form_cancer_uterino = FormCancerUterino.new(form_cancer_uterino_params)
    begin
      @paciente = Paciente.find(params[:form_cancer_uterino][:paciente_id])  
    rescue Exception => e
      @paciente = Paciente.find(6)
    end
    
    @paciente.form_laboratorio_id=12
    @paciente.save

    fecha_ult_menstruacion = params[:form_cancer_uterino][:fecha_ult_menstruacion]
    fecha_ult_parto = params[:form_cancer_uterino][:fecha_ult_parto]
    fecha_aborto = params[:form_cancer_uterino][:fecha_aborto]


    respond_to do |format|
      if @form_cancer_uterino.save
        format.html { redirect_to @form_cancer_uterino, notice: 'Form cancer uterino was successfully created.' }
        format.json { render :show, status: :created, location: @form_cancer_uterino }
      else
        format.html { render :new }
        format.json { render json: @form_cancer_uterino.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /form_cancer_uterinos/1
  # PATCH/PUT /form_cancer_uterinos/1.json
  def update
    respond_to do |format|
      if @form_cancer_uterino.update(form_cancer_uterino_params)
        format.html { redirect_to @form_cancer_uterino, notice: 'Form cancer uterino was successfully updated.' }
        format.json { render :show, status: :ok, location: @form_cancer_uterino }
      else
        format.html { render :edit }
        format.json { render json: @form_cancer_uterino.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /form_cancer_uterinos/1
  # DELETE /form_cancer_uterinos/1.json
  def destroy
    @form_cancer_uterino.destroy
    respond_to do |format|
      format.html { redirect_to form_cancer_uterinos_url, notice: 'Form cancer uterino was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_form_cancer_uterino
    @form_cancer_uterino = FormCancerUterino.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def form_cancer_uterino_params
    params.require(:form_cancer_uterino).permit(:paciente_id, :hospital_id, :edad_menarquia, :fecha_ult_menstruacion, :fecha_ult_parto, :fecha_aborto, :nivel_social, :n_emabarazos, :n_abortos, :n_cesareas, :estado_lactancia, :menopausia, :embarazo, :planificacion_familiar, :tratamiento, :ligadura_trompas, :aspecto_cuello, :flujo_vaginal, :lugar_de_muestra, :informacion_toma_muestra, :control, :fecha_entrega, :distrito_id)
  end
end
