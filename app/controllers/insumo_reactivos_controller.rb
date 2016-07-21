class InsumoReactivosController < ApplicationController
  before_action :set_insumo_reactivo, only: [:show, :edit, :update, :destroy]

  # GET /insumo_reactivos
  # GET /insumo_reactivos.json
  def index
    @insumo_reactivos = InsumoReactivo.order_name_tipo
  end

  # GET /insumo_reactivos/1
  # GET /insumo_reactivos/1.json
  def show
    @registro_insumos_reactivos = RegistroInsumosReactivo.where(:insumo_reactivo_id => @insumo_reactivo.id)
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

# GET /insumo_reactivos/new
  def new
    @insumo_reactivo = InsumoReactivo.new
  end

# GET /insumo_reactivos/1/edit
  def edit
  end

# POST /insumo_reactivos
# POST /insumo_reactivos.json
  def create
    @insumo_reactivo = InsumoReactivo.new(insumo_reactivo_params)

    respond_to do |format|
      if @insumo_reactivo.save
        format.html { redirect_to @insumo_reactivo, notice: 'Insumo reactivo was successfully created.' }
        format.json { render :show, status: :created, location: @insumo_reactivo }
      else
        format.html { render :new }
        format.json { render json: @insumo_reactivo.errors, status: :unprocessable_entity }
      end
    end
  end

# PATCH/PUT /insumo_reactivos/1
# PATCH/PUT /insumo_reactivos/1.json
  def update
    respond_to do |format|
      if @insumo_reactivo.update(insumo_reactivo_params)
        format.html { redirect_to @insumo_reactivo, notice: 'Insumo reactivo was successfully updated.' }
        format.json { render :show, status: :ok, location: @insumo_reactivo }
      else
        format.html { render :edit }
        format.json { render json: @insumo_reactivo.errors, status: :unprocessable_entity }
      end
    end
  end

# DELETE /insumo_reactivos/1
# DELETE /insumo_reactivos/1.json
  def destroy
    @insumo_reactivo.destroy
    respond_to do |format|
      format.html { redirect_to insumo_reactivos_url, notice: 'Insumo reactivo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
# Use callbacks to share common setup or constraints between actions.
  def set_insumo_reactivo
    @insumo_reactivo = InsumoReactivo.find(params[:id])
  end

# Never trust parameters from the scary internet, only allow the white list through.
  def insumo_reactivo_params
    params.require(:insumo_reactivo).permit(:form_laboratorio_id, :tipo, :nombre, :unidad_medida, :cantidad, :costo_unitario, :costo_total, :partida, :descripcion)
  end

end
