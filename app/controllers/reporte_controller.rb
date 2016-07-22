class ReporteController < ApplicationController
  @fecha_inicio
  @fecha_inicio
  @fecha_fin
  @fecha_fin
  @laboratorio
  def index
  end
  def getParemtros(params)
    @fecha_inicio = params[:fecha_inicio]
    @fecha_inicio = @fecha_inicio.to_s() + " 00:00:00"
    @fecha_fin = params[:fecha_fin]
    @fecha_fin = @fecha_fin.to_s() + " 24:00:00"
    @laboratorio = params[:nombre]
    @laboratorio = @laboratorio[:id]
  end
  def pacientes
  	@lista_pacientes = Paciente.all
    getParemtros(params)
    @nombre_laboratorio = @laboratorio
    f = Fecha.new
    @grafico=true
    query=""

    if params[:tiempo] == "Hoy"
      @fecha_inicio = f.formatoFechaString(f.fechaActual()," 00:00:00")
      @fecha_fin = f.formatoFechaString(f.fechaActual()," 24:00:00")
    end
    if params[:tiempo] == "Esta semana"
      @fecha_inicio = f.formatoFechaString(f.estaSemana()," 00:00:00")
      @fecha_fin = f.formatoFechaString(f.fechaActual()," 24:00:00")
    end
    if params[:tiempo] == "Este mes"
      @fecha_inicio = f.formatoFechaString(f.esteMes()," 00:00:00")
      @fecha_fin = f.formatoFechaString(f.fechaActual()," 24:00:00")
    end
    if params[:tiempo] == "Este año"
      @fecha_inicio = f.formatoFechaString(f.esteAno()," 00:00:00")
      @fecha_fin = f.formatoFechaString(f.fechaActual()," 24:00:00")
    end 
    if params[:tiempo] == "Todos"
      @fecha_inicio = f.formatoFechaString(f.fechaInicial()," 00:00:00")
      @fecha_fin = f.formatoFechaString(f.fechaActual()," 24:00:00")
    end


    if @nombre_laboratorio == "Todos"
      query = reporteGeneralPacientes(@fecha_inicio,@fecha_fin)
      @reporte_mensual_pacientes = Paciente.find_by_sql(query)
      gon.reporte_mensual_pacientes = @reporte_mensual_pacientes
      @grafico=false
    else
      query = queryGraficoSexo(@laboratorio,@fecha_inicio,@fecha_fin)
      query2 = queryGrafico2(@laboratorio,@fecha_inicio,@fecha_fin)
      @lista_pacientes = Paciente.find_by_sql(query)
      @reporte_mensual_pacientes = Paciente.find_by_sql(query2)
      gon.query = query
      gon.lista_pacientes = @lista_pacientes
      gon.reporte_mensual_pacientes = @reporte_mensual_pacientes
    end
    gon.laboratorio=@nombre_laboratorio
    gon.fecha_inicio=@fecha_inicio
    gon.fecha_fin=@fecha_fin
    gon.fecha_fin=@fecha_fin
    gon.query = query
  end

  def detalle_insumos_reactivos
  	fecha_inicio = params[:fecha_inicio]
  	fecha_inicio = fecha_inicio.to_s() + " 00:00:00"
  	fecha_fin = params[:fecha_fin]
  	fecha_fin = fecha_fin.to_s() + " 24:00:00"
  	
  	nombre = params[:nombre]
  	id_insumo_reacctivo =nombre[:id].to_s()
    @nombre_insumo_reactivo = InsumoReactivo.find(id_insumo_reacctivo)

  	estado = params[:estado]
    query=""
    @estado_insumo_reactivo=estado
    @grafico=true
    if @estado_insumo_reactivo == "Todos"
      estado=""
      @grafico=false
    end
    if id_insumo_reacctivo == "9999"
      id_insumo_reacctivo=""
      @grafico=false
    end
    query = reporteGeneralInsumosReactivosEstados(fecha_inicio,fecha_fin,id_insumo_reacctivo,estado)
  	@detalle_insumos_reactivos = Paciente.find_by_sql(query)
  	gon.query = query
  	gon.detalle_insumos_reactivos = @detalle_insumos_reactivos
    gon.nombre_insumo_reactivos = @nombre_insumo_reactivo
    gon.estado = estado
  end
  def insumo_reactivos_pacientes
    fecha_inicio = params[:fecha_inicio]
    fecha_inicio = fecha_inicio.to_s() + " 00:00:00"
    fecha_fin = params[:fecha_fin]
    fecha_fin = fecha_fin.to_s() + " 24:00:00"
    
    laboratorio = params[:nombre]
    laboratorio = laboratorio[:id]

    @nombre_laboratorio = laboratorio


    id_insumo = params[:nombre_insumo]
    begin  
      id_insumo = id_insumo[:id]
    rescue 
      id_insumo = 89
    end  
    id_insumo=id_insumo.to_s()
    @nombre_insumo_reactivo = InsumoReactivo.find(id_insumo)

   #if laboratorio == "Todos"
    #query = reporteGeneralInzumoReacctivosPacientes2(fecha_inicio,fecha_fin,"",id_insumo)
    #reporteGeneralInzumoReacctivosPacientes(fecha_inicio,fecha_fin,id_insumo)
   #else
    #query = queryGraficoInsumoPacientes('registro_insumos_reactivos',laboratorio,id_insumo.to_s() ,fecha_inicio,fecha_fin)  
   #end
   @grafico=true
   if laboratorio == "9999"
    laboratorio=""
    @grafico=false
   end
   if id_insumo=="9999"
     id_insumo=""
     @grafico=false
   end
   query = reporteGeneralInzumoReacctivosPacientes3(fecha_inicio,fecha_fin,laboratorio,id_insumo)
   @reporte_mensual_pacientes = Paciente.find_by_sql(query)
   gon.query = query
   gon.detalle_insumos_reactivos = @reporte_mensual_pacientes
  end

  def hospital
    fecha_inicio = params[:fecha_inicio]
    fecha_inicio = fecha_inicio.to_s() + " 00:00:00"
    fecha_fin = params[:fecha_fin]
    fecha_fin = fecha_fin.to_s() + " 24:00:00"
    
    hospital_id = params[:hospital]
    hospital_id = hospital_id[:id]
    array_hospital = Hospital.find(hospital_id.to_i)
    laboratorio_nombre = params[:laboratorio]
    laboratorio_nombre = laboratorio_nombre[:nombre]
    @nombre_laboratorio = laboratorio_nombre

    gon.hospital_nombre=array_hospital.nombre
    gon.laboratorio_nombre=laboratorio_nombre
    @grafico=true
    if array_hospital.nombre == "Todos"
      hospital_id=""
      @grafico=false
    end
    if laboratorio_nombre == "Todos"
      laboratorio_nombre=""
      @grafico=false
    end

    query = reporteGeneralHospital(hospital_id,laboratorio_nombre,fecha_inicio,fecha_fin)
    @reporte_mensual_hospitales = Paciente.find_by_sql(query)
    gon.reporte_mensual_hospitales = @reporte_mensual_hospitales
    gon.mensaje=@nombre_laboratorio2 
    gon.query=query 

  end
end
