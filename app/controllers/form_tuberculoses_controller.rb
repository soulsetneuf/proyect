class FormTuberculosesController < ApplicationController
  before_action :set_form_tuberculose, only: [:show, :edit, :update, :destroy]

  # GET /form_tuberculoses
  # GET /form_tuberculoses.json
  def index
    @form_tuberculoses = FormTuberculosis.all
    query = queryGrafico('form_tuberculoses')
    #query = "SELECT date_trunc('month', created_at) as label, COUNT(*) AS value  FROM form_chagas where form_chagas.created_at>='2016-01-01 00:00:00' and form_chagas.created_at<='2016-12-12 24:00:00' GROUP BY 1 ORDER BY label ASC"
    @reporte_mensual_tuberculoses = Paciente.find_by_sql(query)
    gon.query = query
    gon.reporte_mensual_tuberculoses = @reporte_mensual_tuberculoses
  end

  # GET /form_tuberculoses/1
  # GET /form_tuberculoses/1.json
  def show
  end

  # GET /form_tuberculoses/new
  def new
    @form_tuberculose = FormTuberculosis.new
  end

  # GET /form_tuberculoses/1/edit
  def edit
  end

  # POST /form_tuberculoses
  # POST /form_tuberculoses.json
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

  def create
    @form_tuberculose = FormTuberculosis.new(form_tuberculose_params)

    respond_to do |format|
      if @form_tuberculose.save
        format.html { redirect_to @form_tuberculose, notice: 'Form tuberculosis was successfully created.' }
        format.json { render :show, status: :created, location: @form_tuberculose }
      else
        format.html { render :new }
        format.json { render json: @form_tuberculose.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /form_tuberculoses/1
  # PATCH/PUT /form_tuberculoses/1.json
  def update
    respond_to do |format|
      if @form_tuberculose.update(form_tuberculose_params)
        format.html { redirect_to @form_tuberculose, notice: 'Form tuberculosis was successfully updated.' }
        format.json { render :show, status: :ok, location: @form_tuberculose }
      else
        format.html { render :edit }
        format.json { render json: @form_tuberculose.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /form_tuberculoses/1
  # DELETE /form_tuberculoses/1.json
  def destroy
    @form_tuberculose.destroy
    respond_to do |format|
      format.html { redirect_to form_tuberculoses_url, notice: 'Form tuberculosis was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_form_tuberculose
      @form_tuberculose = FormTuberculosis.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def form_tuberculose_params
      params.require(:form_tuberculose).permit(:paciente_id, :hospital_id)
    end
end
