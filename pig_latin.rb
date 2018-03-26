# http://www.snowcrest.net/donnelly/piglatin.html
class PigLatin

  ESTANDAR_VOCALES_INGLES = 'AEIOUaeiou'.freeze
  ESTANDAR_VOCALES_INGLES_Y = 'AEIOUaeiouYy'.freeze
  PREFIJO_ADJUNTO_FINAL_SUFIJO = 'ay'.freeze

  def self.translate(palabra)
    primeraLetra = palabra[0]
    sufijo = ''

    if existeLaLetraDentroDeLaPalabra(primeraLetra, ESTANDAR_VOCALES_INGLES)
      sufijo = PREFIJO_ADJUNTO_FINAL_SUFIJO

    else

      totalCaracteres = palabra.size
      while (totalCaracteres -= 1) != 0
        sufijo += primeraLetra
        ultimaLetra = primeraLetra
        palabra = palabra[1, palabra.size]
        primeraLetra = palabra[0]

        next unless existeLaLetraDentroDeLaPalabra(primeraLetra, ESTANDAR_VOCALES_INGLES_Y)
        break unless esLaPalabraQU(primeraLetra, ultimaLetra)

      end
      sufijo += PREFIJO_ADJUNTO_FINAL_SUFIJO

    end
    palabra += sufijo

  end

  def self.existeLaLetraDentroDeLaPalabra(primeraLetra, palabra)
    palabra.count(primeraLetra) == 1
  end

  def self.esLaPalabraQU(primeraLetra, ultimaLetra)
    (ultimaLetra == 'q' || ultimaLetra == 'Q') && (primeraLetra == 'u' || primeraLetra == 'U')
  end

end
