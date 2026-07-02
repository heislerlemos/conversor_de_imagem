require 'glimmer-dsl-libui'
require "mini_magick"
require_relative 'image'
require 'libui'
UI = LibUI
UI.init
include Glimmer
include Image

window('Conversão de Imagem para visto de angola', 900 , 500, true) {
  #borderless true
  resizable false # //  depois verifica o porque que não esta a funcionar  
  ficheiro_requisito = File.read("/home/heisler/code/visa_application_registar/requisitos.txt")
  margined true


  vertical_box {
    button('Verificar requisitos do visto de angola') do
      stretchy false
      on_clicked do
        msg_box('Requisitos', ficheiro_requisito)
      end
    end



    area {
      path {
        square(0, 0, 890)
        fill r: 82, g: 32, b: 129, a: 1.0
      }

      path { 
        rectangle(0, 100, 200, 200)
        rectangle(100, 0, 650, 150)
        fill x0: 10, y0: 10, x1: 350, y1: 350, stops: [{pos: 0.25, r: 204, g: 102, b: 204}, {pos: 0.75, r: 102, g: 102, b: 204}]
      }

      text(100, 100, 700) {
        default_font family: 'Helvetica', size: 12, weight: :normal, italic: :normal, stretch: :normal
        string("Introduza imagem para elaborar conversão das imagens e modificar o tamanho para que seja aceita no consulado de angola") {
          font family: 'Ubuntu', size: 20, weight: :bold, italic: :normal, stretch: :normal
          color r: 255, g: 255, b: 255, a: 1
        } 
      }
    }

    form {
      stretchy false

      @passaporte = entry { 
        label 'PASSAPORTE COM 6 MESES DE VALIDADE:'
      }

      @vacina = entry {
        label 'CERTIFICADO DE VACINA:'
      }

      @fotografia = entry {
        label 'FOTOGRAFIA COM FUNDO BRANCO:'
      }

      @bilhete_de_passagem = entry {
        label 'BILHETE DE VIAGEM MARCADO:'
      }

    }

    button('Submeter') {
      stretchy false
      on_clicked do 
        Image::imgpassaporte(@passaporte.text)
        Image::vacina(@vacina.text)
        Image::fotografia(@fotografia.text) 
        Image::bilhete(@bilhete_de_passagem.text)
        main_window = UI.new_window('conversao feita', 800, 600, 1)
        Image::diropen
        UI.msg_box(main_window, 'Information', " As imagens foram convertidas pode encontrar no seguinte directorio : ") 
      end
    }
  } 
}.show

