class RegistroInsumosReactivosController < ApplicationController
  #before_action :set_registro_insumos_reactivo, only: [:show, :edit, :update, :destroy]
  include CurrentCart
  before_action :set_cart, only: [:index2, :new, :create]

  def index2
    gon.personas = Persona.all
    gon.laboratorios = Laboratorio.all
  end

  # GET /registro_insumos_reactivos
  # GET /registro_insumos_reactivos.json
  def index
    @registro_insumos_reactivos = RegistroInsumosReactivo.all
  end

  # GET /registro_insumos_reactivos/1
  # GET /registro_insumos_reactivos/1.json
  def show
  end

  # GET /registro_insumos_reactivos/new
  def new
    if @cart.line_items.empty?
      redirect_to registro_insumos_reactivos_index2_path, notice: "Seleccione al menos un insumo o reactivo"
      return
    end
    @registro_insumos_reactivo = RegistroInsumosReactivo.new
  end

  # GET /registro_insumos_reactivos/1/edit
  def edit
  end

  # POST /registro_insumos_reactivos
  # POST /registro_insumos_reactivos.json
  def create
    @registro_insumos_reactivo = RegistroInsumosReactivo.new(registro_insumos_reactivo_params)

    respond_to do |format|
      # if @registro_insumos_reactivo.save
      # verificar_tipo_de_registro(@registro_insumos_reactivo)
      #verificar_datos_validos = verify_registro_insumo_reactivo
      #if verificar_datos_validos.empty?
      save_registro_insumo_reactivo
      Cart.destroy(session[:cart_id])
      session[:cart_id]= nil

      format.html { redirect_to registro_insumos_reactivos_index2_path, notice: 'Registro insumos o reactivo creado' }
      format.json { render :show, status: :created, location: @registro_insumos_reactivo }
       #else
         #format.html { render :new }
         #format.json { render json: verificar_datos_validos, status: :unprocessable_entity }
       #end

    end
  end

  def save_registro_insumo_reactivo
    @cart.line_items.each do |item|
      @registro_insumos_reactivo = RegistroInsumosReactivo.new(registro_insumos_reactivo_params)
      @registro_insumos_reactivo.insumo_reactivo_id = item.insumo_reactivo_id
      #@registro_insumos_reactivo.cantidad = (item.quantity / 2) -1
      @registro_insumos_reactivo.cantidad = item.quantity
      # @registro_insumos_reactivo.estado = estado
      @registro_insumos_reactivo.save
    end
  end

  def verify_registro_insumo_reactivo
    errores = []
    @cart.line_items.each do |item|
      @registro_insumos_reactivo = RegistroInsumosReactivo.new(registro_insumos_reactivo_params)
      @registro_insumos_reactivo.insumo_reactivo_id = item.insumo_reactivo_id
      @registro_insumos_reactivo.cantidad = item.quantity
      # @registro_insumos_reactivo.estado = estado
      if @registro_insumos_reactivo.valid?
        puts "NNN#{@registro_insumos_reactivo.errors.full_messages}"

      else

        errores.push(@registro_insumos_reactivo.errors)
      end
    end
    puts "XXXXXXXXX>>>:#{@registro_insumos_reactivo.errors}"
    puts ">>>#{@registro_insumos_reactivo.errors.full_messages}"
     errores
  end

  def verificar_tipo_de_registro(reg_ins_reac)
    if reg_ins_reac.insumo_reactivo_id.present?
      insumo_reactivo = InsumoReactivo.find(reg_ins_reac.insumo_reactivo_id)

      insumo_reactivo.cantidad =
          if reg_ins_reac.estado == 'Entrada'
            insumo_reactivo.cantidad.to_i + reg_ins_reac.cantidad.to_i
          elsif reg_ins_reac.estado == 'Salida'
            insumo_reactivo.cantidad = insumo_reactivo.cantidad.to_i - reg_ins_reac.cantidad.to_i
          end

      insumo_reactivo.save
    end
  end

  # PATCH/PUT /registro_insumos_reactivos/1
  # PATCH/PUT /registro_insumos_reactivos/1.json
  def update
    respond_to do |format|
      if @registro_insumos_reactivo.update(registro_insumos_reactivo_params)
        format.html { redirect_to @registro_insumos_reactivo, notice: 'Registro insumos reactivo was successfully updated.' }
        format.json { render :show, status: :ok, location: @registro_insumos_reactivo }
      else
        format.html { render :edit }
        format.json { render json: @registro_insumos_reactivo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registro_insumos_reactivos/1
  # DELETE /registro_insumos_reactivos/1.json
  def destroy
    @registro_insumos_reactivo.destroy
    respond_to do |format|
      format.html { redirect_to registro_insumos_reactivos_url, notice: 'Registro insumos reactivo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_registro_insumos_reactivo
    @registro_insumos_reactivo = RegistroInsumosReactivo.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def registro_insumos_reactivo_params
    params.require(:registro_insumos_reactivo).permit(:estado, :insumo_reactivo_id, :form_laboratorio_id, :cantidad, :personal_entregante, :pesonal_receptor, :observaciones)
  end
end
