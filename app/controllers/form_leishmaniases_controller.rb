class FormLeishmaniasesController < ApplicationController
  before_action :set_form_leishmaniase, only: [:show, :edit, :update, :destroy]

  # GET /form_leishmaniases
  # GET /form_leishmaniases.json
  def index
    @form_leishmaniases = FormLeishmaniasis.all
    query = queryGrafico('form_leishmaniases')
    @reporte_mensual_leishmaniases = Paciente.find_by_sql(query)
    gon.query = query
    gon.reporte_mensual_leishmaniases = @reporte_mensual_leishmaniases
  end

  # GET /form_leishmaniases/1
  # GET /form_leishmaniases/1.json
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

  # GET /form_leishmaniases/new
  def new
    @form_leishmaniase = FormLeishmaniasis.new
  end

  # GET /form_leishmaniases/1/edit
  def edit
  end

  # POST /form_leishmaniases
  # POST /form_leishmaniases.json
  def create
    @form_leishmaniase = FormLeishmaniasis.new(form_leishmaniase_params)

    begin
      @paciente = Paciente.find(params[:form_leishmaniasis][:paciente_id])
      @paciente.form_laboratorio_id=7
      @paciente.save
    rescue Exception => e

    end

    respond_to do |format|
      if @form_leishmaniase.save
        format.html { redirect_to @form_leishmaniase, notice: 'Form leishmaniasis was successfully created.' }
        format.json { render :show, status: :created, location: @form_leishmaniase }
      else
        format.html { render :new }
        format.json { render json: @form_leishmaniase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /form_leishmaniases/1
  # PATCH/PUT /form_leishmaniases/1.json
  def update
    respond_to do |format|
      if @form_leishmaniase.update(form_leishmaniase_params)
        format.html { redirect_to @form_leishmaniase, notice: 'Form leishmaniasis was successfully updated.' }
        format.json { render :show, status: :ok, location: @form_leishmaniase }
      else
        format.html { render :edit }
        format.json { render json: @form_leishmaniase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /form_leishmaniases/1
  # DELETE /form_leishmaniases/1.json
  def destroy
    @form_leishmaniase.destroy
    respond_to do |format|
      format.html { redirect_to form_leishmaniases_url, notice: 'Form leishmaniasis was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_form_leishmaniase
      @form_leishmaniase = FormLeishmaniasis.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def form_leishmaniase_params
      params.require(:form_leishmaniasis).permit(:paciente_id, :hospital_id, :lug_prob_infeccion, :tipo_lesion, :ubicacion_lesion, :tiempo_evol_lesion, :n_muestras_tom, :post_tratam, :epd, :idrm, :cultivo, :pcr, :otro, :medico_solicitante, :firma)
    end
end
