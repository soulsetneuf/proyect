class PacientesController < ApplicationController
  before_action :set_paciente, only: [:show, :edit, :update, :destroy]

  # GET /pacientes
  # GET /pacientes.json
  def index
    @pacientes = Paciente.all
    gon.datos = Paciente.all
    gon.cabeceras = ['nombres', 'apellidos']

    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => "file_name"   # Excluding ".pdf" extension.
      end
    end
  end

  # GET /pacientes/1
  # GET /pacientes/1.json
  def show
    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => "file_name",
               :layout => 'pdf.html.erb',
               :page_size => 'Letter',
               :footer => {:right => '[page] de [topage]', :font_size => 7}
      end

      # format.pdf do
      #   pdf = Prawn::Document.new(:page_size => "LETTER", :page_layout => :portrait)
      #
      #   pdf.stroke_color "A02A23"
      #   #cabecera
      #   pdf.stroke_rounded_rectangle [10, 580], 530, 200, 20
      #   pdf.stroke_rounded_rectangle [111, 694], 170, 12, 2
      #   pdf.stroke_rounded_rectangle [111, 674], 170, 12, 2
      #   pdf.stroke_rounded_rectangle [111, 655], 170, 12, 2
      #
      #   pdf.stroke_rounded_rectangle [111, 636], 50, 12, 2
      #   pdf.stroke_rounded_rectangle [230, 636], 50, 12, 2
      #
      #   pdf.stroke_rounded_rectangle [111, 617], 170, 12, 2
      #   pdf.stroke_rounded_rectangle [111, 598], 170, 12, 2
      #
      #   pdf.font("Courier")
      #   string = "HOSPITAL DANIEL BRACAMONTE"
      #   pdf.text_box string,
      #                :width => 250,
      #                :height => 50,
      #                :overflow => :truncate,
      #                :at => [300, 700],
      #                :align => :center,
      #                :size => 18
      #
      #
      #
      #   pdf.move_down 10
      #
      #   pdf.fill_color "000000"
      #   pdf.text_box "PACIENTES".force_encoding("UTF-8"), :at => [310, 625], :size => 8, :align => :center, :inline_format => true
      #   pdf.text_box "<u><b>CULTIVO  Y ANTIBIOGRAMA</b></u>".force_encoding("UTF-8"), :at => [300, 605], :size => 12, :align => :center, :inline_format => true
      #
      #   pdf.move_down 150
      #
      #   data = [["ANÁLISIS", "RESULTADOS", "UNIDAD", "VALORES DE REFERENCIA"]]
      #   pdf.table(data, :header => true, :column_widths => {0 => 150, 1 => 120, 2 =>100, 3 => 170}, :position => :right, :cell_style => {:inline_format => true, :overflow => :shrink_to_fit, :size => 8, :borders => [], :border_color => "E5A9A9", :padding => 2, :font => "Courier"}) do
      #
      #     row(0).borders = [:bottom, :top]
      #     row(0).border_width = 1
      #     row(0).border_color = "A02A23"
      #     row(0).font_style = :bold
      #     row(0).size =9
      #
      #     row(1..100).borders = [:bottom]
      #     row(1..100).border_width = 1
      #     row(1..100).border_lines = [:dotted, :solid, :solid, :solid]
      #
      #     columns(1).align = :center
      #     columns(1).font_style = :bold
      #     columns(1).size = 10
      #     columns(2).size = 10
      #   end
      #
      #   if pdf.cursor <=60
      #     pdf.start_new_page
      #   end
      #
      #   pdf.text_box "<b>OBSERVACIONES:</b>", :inline_format => true, :at => [20, 100]
      #   pdf.text_box "DR. RESPONSABLE".force_encoding("UTF-8"), :size => 11, :align => :right, :at => [20, 20]
      #
      #   pdf.stroke_color "A02A23"
      #   pdf.stroke_horizontal_line -5, 545, :at => -8
      #
      #
      #   pdf.encrypt_document(:owner_password => :random,
      #                        :permissions => {:print_document => true,
      #                                         :modify_contents => false,
      #                                         :copy_contents => false,
      #                                         :modify_annotations => false})
      #
      #   send_data pdf.render, type: "application/pdf", disposition: "inline"
      # end

    end
  end

  # GET /pacientes/new
  def new
    @paciente = Paciente.new
    @current_time = Time.now
  end

  # GET /pacientes/1/edit
  def edit
  end

  # POST /pacientes
  # POST /pacientes.json
  def create
    @paciente = Paciente.new(paciente_params)

    respond_to do |format|
      if @paciente.save
        format.html { redirect_to @paciente, notice: 'Paciente creado satisfactoriamente.' }
        format.json { render :show, status: :created, location: @paciente }
      else
        format.html { render :new }
        format.json { render json: @paciente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pacientes/1
  # PATCH/PUT /pacientes/1.json
  def update
    respond_to do |format|
      if @paciente.update(paciente_params)
        format.html { redirect_to @paciente, notice: 'Datos actulizados correctamente.' }
        format.json { render :show, status: :ok, location: @paciente }
      else
        format.html { render :edit }
        format.json { render json: @paciente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pacientes/1
  # DELETE /pacientes/1.json
  def destroy
    @paciente.destroy
    respond_to do |format|
      format.html { redirect_to pacientes_url, notice: 'Paciente eliminado.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_paciente
    @paciente = Paciente.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def paciente_params
    params.require(:paciente).permit(:form_laboratorio_id, :nombres, :apellidos, :fecha_nacimiento, :sexo, :direccion, :ciudad, :telefono, :tipo)
  end
end
