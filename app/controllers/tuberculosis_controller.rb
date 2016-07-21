class TuberculosisController < ApplicationController
  before_action :set_tuberculosi, only: [:show, :edit, :update, :destroy]

  # GET /tuberculosis
  # GET /tuberculosis.json
  def index
    @tuberculosis = Tuberculosi.all

    query = queryGrafico('tuberculosis')
    #query = "SELECT date_trunc('month', created_at) as label, COUNT(*) AS value  FROM form_chagas where form_chagas.created_at>='2016-01-01 00:00:00' and form_chagas.created_at<='2016-12-12 24:00:00' GROUP BY 1 ORDER BY label ASC"
    @reporte_mensual_tuberculosis = Paciente.find_by_sql(query)
    gon.query = query
    gon.reporte_mensual_tuberculosis = @reporte_mensual_tuberculosis

   respond_to do |format|
      format.html
      format.pdf do
        render :pdf => "file_name"   # Excluding ".pdf" extension.
      end
    end
  end

  # GET /tuberculosis/1
  # GET /tuberculosis/1.json
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





  # GET /tuberculosis/new
  def new
    @tuberculosi = Tuberculosi.new
  end

  # GET /tuberculosis/1/edit
  def edit
  end

  # POST /tuberculosis
  # POST /tuberculosis.json
  def create
    @tuberculosi = Tuberculosi.new(tuberculosi_params)
    begin
      @paciente = Paciente.find(params[:tuberculosi][:paciente_id])
      @paciente.form_laboratorio_id=8
      @paciente.save
    rescue Exception => e

    end
    respond_to do |format|
      if @tuberculosi.save
        format.html { redirect_to @tuberculosi, notice: 'Tuberculosi was successfully created.' }
        format.json { render :show, status: :created, location: @tuberculosi }
      else
        format.html { render :new }
        format.json { render json: @tuberculosi.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tuberculosis/1
  # PATCH/PUT /tuberculosis/1.json
  def update
    respond_to do |format|
      if @tuberculosi.update(tuberculosi_params)
        format.html { redirect_to @tuberculosi, notice: 'Tuberculosi was successfully updated.' }
        format.json { render :show, status: :ok, location: @tuberculosi }
      else
        format.html { render :edit }
        format.json { render json: @tuberculosi.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tuberculosis/1
  # DELETE /tuberculosis/1.json
  def destroy
    @tuberculosi.destroy
    respond_to do |format|
      format.html { redirect_to tuberculosis_url, notice: 'Tuberculosi was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tuberculosi
      @tuberculosi = Tuberculosi.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tuberculosi_params
      params.require(:tuberculosi).permit(:form_laboratorio_id, :paciente_id, :tipo_de_muestra, :razon, :medico, :centro_de_salud, :observaciones)
    end
end
