class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  # rescue_from CanCan::AccessDenied do |exception|
  #   redirect_to root_url, :alert => exception.message
  # end
  def getListaTabla
    return ['form_cultivos','baciloscopia_forms','biopsias_forms','form_liquidos','form_chagas','form_malaria','form_leishmaniases','Tuberculosis','form_cancer_uterinos','form_anat_citologicas','Tuberculosis']
  end
  def getIndiceTabla(tabla)
    lista_tablas = {'form_cultivos' => 'Cultivos', 'baciloscopia_forms' => 'Baciloscopia', 'biopsias_forms' => 'Biopsias', 'form_liquidos' => 'Liquidos','form_chagas' => 'Chagas','form_malaria' => 'Malaria','form_leishmaniases' => 'Leishmaniasis','Tuberculosis' => 'Tuberculosis','form_cancer_uterinos'=>'Cancer uterino','form_anat_citologicas'=>'Citologia'}
    nombre_tabla = lista_tablas[tabla]
    return nombre_tabla
  end
  def reporteGeneralHospital(hospital_id,laboratorio_nombre,fecha_inicial,fecha_final)
    query="
    select h.nombre as hospital,fl.nombre as laboratorio,date_trunc('month', hp.created_at) as label,COUNT(*) AS value 
    from historial_paciente as hp join form_laboratorios as fl
    on hp.form_laboratorio_id=fl.id
    join hospitals as h
    on h.id=hp.hospital_id
    where cast(h.id as varchar) like '%"+hospital_id+"%'
    and fl.nombre like '%"+laboratorio_nombre+"%'
    and hp.created_at>='"+fecha_inicial+"' 
    and hp.created_at<='"+fecha_final+"' 
    group by 1,2,3"
    return query
  end
  def reporteGeneralInsumosReactivosEstados(fecha_inicial,fecha_final,id_insumo_reacctivo="",estado="")
      query = "
      select ir.unidad_medida as unidad_medida,
      date_trunc('month', rir.created_at) as label, 
      SUM(rir.cantidad) AS value,rir.estado,ir.nombre 
      from registro_insumos_reactivos as rir join insumo_reactivos ir
      on rir.insumo_reactivo_id=ir.id 
      where rir.created_at>='"+fecha_inicial+"' 
      and rir.created_at<='"+fecha_final+"' 
      and rir.estado like '%"+estado+"%'
      and cast(rir.insumo_reactivo_id as varchar) like '%"+id_insumo_reacctivo+"%' 
      GROUP BY 1,2,rir.estado,ir.nombre ORDER BY ir.nombre,label DESC;"
      return query
  end
  def queryGrafico(tabla)
  	 query = "SELECT date_trunc('month', created_at) as label, COUNT(*) AS value  FROM "+tabla+" where created_at>='2016-01-01 00:00:00' and created_at<='2016-12-12 24:00:00' GROUP BY 1 ORDER BY label asc"
  	 return query
  end
  def queryGrafico2(tabla,fecha_inicial,fecha_final)
    nombre_tabla = getNombreTabla(tabla)
    query = "SELECT '"+getIndiceTabla(nombre_tabla.to_s())+"' as laboratorio,date_trunc('month', "+nombre_tabla+".created_at) as label, COUNT(*) AS value FROM pacientes join "+nombre_tabla.to_s()+" on pacientes.id="+nombre_tabla.to_s()+".paciente_id where "+nombre_tabla.to_s()+".created_at>='"+fecha_inicial.to_s()+"' and "+nombre_tabla.to_s()+".created_at<='"+fecha_final.to_s()+"' GROUP BY 1,2 ORDER BY label DESC;"
    return query
  end
 def reporteGeneralPacientes(fecha_inicial,fecha_final)
    lista_tablas=getListaTabla
    query =""
    dimension = lista_tablas.length
    j=1
    lista_tablas.each do |i|
      query = query + " (SELECT '"+getIndiceTabla(i.to_s())+"' as laboratorio,date_trunc('month', "+i+".created_at) as label, COUNT(*) AS value FROM pacientes join "+i.to_s()+" on pacientes.id="+i.to_s()+".paciente_id where "+i.to_s()+".created_at>='"+fecha_inicial.to_s()+"' and "+i.to_s()+".created_at<='"+fecha_final.to_s()+"' GROUP BY 1,2 ORDER BY label DESC) "
      if j<dimension
        query = query + " union "
      end
      j=j+1
    end
     return query+" order by laboratorio"
  end
  def reporteGeneralInzumoReacctivosPacientes(fecha_inicial,fecha_final,id_insumo_reacctivo)
    lista_tablas=getListaTabla
    query =""
    dimension = lista_tablas.length
    j=1
    lista_tablas.each do |i|
      query = query + 
      "
      (select 
      (select unidad_medida from insumo_reactivos where id="+id_insumo_reacctivo+") as unidad_medida,
      date_trunc('month', registro_insumos_reactivos.created_at) as label,
      round((sum(cantidad)/(select count(*) from "+i.to_s()+" where created_at>='"+fecha_inicial+"' and created_at<='"+fecha_final+"'))) as value,
      (sum(cantidad)/(select count(*) from "+i.to_s()+" where created_at>='"+fecha_inicial+"' and created_at<='"+fecha_final+"')) as value2,
      (select count(*) from "+i.to_s()+" where created_at>='"+fecha_inicial+"' and created_at<='"+fecha_final+"') as total_pacientes,
      sum(cantidad) as total_insumos,
      '"+getIndiceTabla(i.to_s())+"' as Laboratorio 
      from 
      registro_insumos_reactivos join "+i.to_s()+" 
      on registro_insumos_reactivos.form_laboratorio_id="+i.to_s()+".id 
      where registro_insumos_reactivos.created_at>='"+fecha_inicial+"' 
      and registro_insumos_reactivos.created_at<='"+fecha_final+"' 
      and registro_insumos_reactivos.insumo_reactivo_id="+id_insumo_reacctivo+" 
      GROUP BY 1,2,Laboratorio ORDER BY label DESC)"

      if j<dimension
        query = query + " union "
      end
      j=j+1
    end
    return query+" order by Laboratorio"
  end

  def reporteGeneralInzumoReacctivosPacientes3(fecha_inicial,fecha_final,id_laboratorio,id_insumo_reacctivo)
    query="
          select date_trunc('month', tabla_final.fecha_historial_paciente) as label,
                 fl.nombre as laboratorio, 
                 ir.nombre as insumo_reactivo, 
                 tabla_final.form_laboratorio_id,
                 tabla_final.insumo_reactivo_id,
                 ir.unidad_medida,
                 suma_insumos_reactivos,
                 cantidad_pacientes_laboratorio,
                 round (suma_insumos_reactivos/cantidad_pacientes_laboratorio) as value,
                 (suma_insumos_reactivos/cantidad_pacientes_laboratorio) as value2 
          from
          (select distinct(t1.created_at,t2.created_at,t1.form_laboratorio_id,cantidad_pacientes_laboratorio,tabla_suma_insumos_reactivos.insumo_reactivo_id,tabla_suma_insumos_reactivos.suma_insumos_reactivos),
          t1.created_at as fecha_historial_paciente,t2.created_at as fecha_insumo_reactivo,t1.form_laboratorio_id,cantidad_pacientes_laboratorio,tabla_suma_insumos_reactivos.insumo_reactivo_id,tabla_suma_insumos_reactivos.suma_insumos_reactivos 
          from 
           (
             select hp.paciente_id,hp.hospital_id,hp.form_laboratorio_id,hp.created_at 
             from historial_paciente as hp
             join form_laboratorios as fl
             on hp.form_laboratorio_id=fl.id
             where hp.created_at>='"+fecha_inicial+"' 
             and hp.created_at<='"+fecha_final+"'
           ) as t1 
          join 
          (
             select rir.insumo_reactivo_id,rir.cantidad,rir.created_at,rir.form_laboratorio_id 
             from registro_insumos_reactivos as rir
             where rir.created_at>='"+fecha_inicial+"' 
             and rir.created_at<='"+fecha_final+"'
             and rir.estado='Salida'
           ) as t2
           on t1.form_laboratorio_id=t2.form_laboratorio_id
           join
          (
             select hp.form_laboratorio_id,count(*) as cantidad_pacientes_laboratorio
             from historial_paciente as hp
             where hp.created_at>='"+fecha_inicial+"' 
             and hp.created_at<='"+fecha_final+"'
             group by 1
           ) as tabla_cantidad_pacientes_laboratorio
           on tabla_cantidad_pacientes_laboratorio.form_laboratorio_id=t1.form_laboratorio_id
           join
           (
             select rir.form_laboratorio_id,rir.insumo_reactivo_id,sum(rir.cantidad) as suma_insumos_reactivos 
             from registro_insumos_reactivos as rir
             where rir.created_at>='"+fecha_inicial+"' 
             and rir.created_at<='"+fecha_final+"'
             and rir.estado='Salida'
             group by 1,2
           ) as tabla_suma_insumos_reactivos
           on tabla_suma_insumos_reactivos.form_laboratorio_id=tabla_cantidad_pacientes_laboratorio.form_laboratorio_id
           where cast(t1.form_laboratorio_id as varchar(50)) like '%"+id_laboratorio+"%'
           and cast(tabla_suma_insumos_reactivos.insumo_reactivo_id as varchar(50)) like '%"+id_insumo_reacctivo+"%' 
           ) as tabla_final
           join form_laboratorios as fl 
           on fl.id=tabla_final.form_laboratorio_id 
           join insumo_reactivos as ir 
           on ir.id=tabla_final.insumo_reactivo_id 
           group by 1,2,3,4,5,6,7,8
    "
    return query
  end

  def reporteGeneralInzumoReacctivosPacientes2(fecha_inicial,fecha_final,nombre_laboratorio,id_insumo_reacctivo)
    query ="select ir.unidad_medida,
       date_trunc('month', rir.created_at) as label,
       fl.nombre as laboratorio,
       ir.nombre as insumo_reactivo,
       rir.form_laboratorio_id,
       rir.insumo_reactivo_id,   
       sum(rir.cantidad) as total_insumos,
       (
         select count(*) 
         from historial_paciente 
         where form_laboratorio_id=rir.form_laboratorio_id 
         and created_at>='"+fecha_inicial+"' 
         and created_at<='"+fecha_final+"'
        ) as total_pacientes,
       round
       (
         sum(rir.cantidad)/(
                             select count(*) 
                             from historial_paciente 
                             where form_laboratorio_id=rir.form_laboratorio_id 
                             and created_at>='"+fecha_inicial+"' 
                             and created_at<='"+fecha_final+"'
                            )
       ) as value,
       sum(rir.cantidad)/(
                           select count(*) 
                           from historial_paciente 
                           where form_laboratorio_id=rir.form_laboratorio_id 
                           and created_at>='"+fecha_inicial+"' 
                           and created_at<='"+fecha_final+"'
                         ) as value2       
        from registro_insumos_reactivos as rir join historial_paciente as hp
        on rir.form_laboratorio_id=hp.form_laboratorio_id
           join form_laboratorios as fl
        on fl.id=rir.form_laboratorio_id
           join insumo_reactivos as ir
        on ir.id=rir.insumo_reactivo_id
        where fl.nombre like '%"+nombre_laboratorio+"%' 
        and cast(ir.id as varchar) like '%"+id_insumo_reacctivo+"%'
        and rir.created_at>='"+fecha_inicial+"' 
        and rir.created_at<='"+fecha_final+"' 
        group by ir.unidad_medida,2,laboratorio,ir.nombre,rir.form_laboratorio_id,rir.insumo_reactivo_id;"
        return query
  end


  def queryGraficoInsumoPacientes(tabla,tabla2,id_insumo_reacctivo,fecha_inicial,fecha_final)
    nombre_tabla = tabla
    nombre_tabla2 = getNombreTabla(tabla2)
    query = "select (select unidad_medida from insumo_reactivos where id="+id_insumo_reacctivo+") as unidad_medida,date_trunc('month', "+nombre_tabla+".created_at) as label,
    round((sum(cantidad)/(select count(*) from "+nombre_tabla2+" where created_at>='"+fecha_inicial+"' and created_at<='"+fecha_final+"'))) as value,(sum(cantidad)/(select count(*) from "+nombre_tabla2+" where created_at>='"+fecha_inicial+"' and created_at<='"+fecha_final+"')) as value2,(select count(*) from "+nombre_tabla2+" where created_at>='"+fecha_inicial+"' and created_at<='"+fecha_final+"') as total_pacientes,sum(cantidad) as total_insumos from "+nombre_tabla+" join "+nombre_tabla2+" on "+nombre_tabla+".form_laboratorio_id="+nombre_tabla2+".id where "+nombre_tabla+".created_at>='"+fecha_inicial+"' and registro_insumos_reactivos.created_at<='"+fecha_final+"' and registro_insumos_reactivos.insumo_reactivo_id="+id_insumo_reacctivo+" GROUP BY 1,2 ORDER BY label DESC;"
    return query
  end
  def queryGraficoHospitales(tabla,tabla2,id_hospital,fecha_inicial,fecha_final)
    nombre_tabla = tabla
    nombre_tabla2 = getNombreTabla(tabla2)
    query = "select date_trunc('month', t.created_at) as label, COUNT(*) AS value from "+nombre_tabla2+" as t join "+nombre_tabla+" as h on t.hospital_id=h.id where h.id="+id_hospital+" and t.created_at>='"+fecha_inicial+"' and t.created_at<='"+fecha_final+"' GROUP BY 1 ORDER BY label DESC;"
    return query
  end
  def queryGraficoSexo(tabla,fecha_inicial,fecha_final)
    nombre_tabla = getNombreTabla(tabla)
    query = "select sexo as label,count(*) as value from pacientes join "+nombre_tabla+" on pacientes.id="+nombre_tabla+".paciente_id where "+nombre_tabla+".created_at>='"+fecha_inicial+"' and "+nombre_tabla+".created_at<='"+fecha_final+"' group by label;"
    return query
  end
  def getNombreTabla(tabla)
    lista_tablas = {'Cultivos' => 'form_cultivos', 'Baciloscopia' => 'baciloscopia_forms', 'Biopsias' => 'biopsias_forms', 'Liquidos' => 'form_liquidos','Chagas' => 'form_chagas','Malaria' => 'form_malaria','Leishmaniasis' => 'form_leishmaniases','Tuberculosis' => 'form_tuberculoses','Cancer uterino'=>'form_cancer_uterinos','Citologia'=>'form_anat_citologicas','Tuberculosis'=>'Tuberculosis'}
    nombre_tabla = lista_tablas[tabla]
    return nombre_tabla
  end
end
