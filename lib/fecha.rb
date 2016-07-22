class Fecha
    def dhms2sec(days,hrs=0,min=0,sec=0)
        days*86400 + hrs*3600 + min*60 + sec
    end
    def recuperarFecha(fecha)
        dato = fecha.split("-")
        return dato
    end
    def convertirArrayFecha(fecha)
        arrayFecha = recuperarFecha(fecha)
        return Time.local(arrayFecha[0],arrayFecha[1],arrayFecha[2])
    end
    def fechaActual()
        return Time.now
    end
    def restasDiasFechaActual(dias)
      return fechaActual-dhms2sec(dias)
    end
    def estaSemana()
        return restasDiasFechaActual(7)
    end
    def esteMes()
        return restasDiasFechaActual(30)
    end
    def esteAno()
        return restasDiasFechaActual(365)
    end
    def fechaInicial()
      return Time.local(1980,11,11,10,25)
    end
    def formatoFechaString(fecha,tiempo)
        return fecha.to_s.to_s[0,10]+ tiempo
    end
end