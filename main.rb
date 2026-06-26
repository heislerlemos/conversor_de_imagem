require 'glimmer-dsl-libui'
require "mini_magick"
require_relative 'image'
include Glimmer
include Image

window('Programa de conversão de visto de angola', 900 , 400) {
  ficheiro_requisito = File.read("/home/heisler/code/visa_application_registar/requisitos.txt")
  margined true

  vertical_box {


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

    button('Verificar requisitos do visto de angola') do
      stretchy false
      on_clicked do
        msg_box('Requisitos', ficheiro_requisito)
      end
    end

    form {
      stretchy false

      @caminho = entry { 
        label 'insira o caminho da imagem do passport'
      }
    }

    button('Converter imagem') {
      stretchy false
      on_clicked do
        Image::image_convert(@caminho.text)
      end
    }
  } 
}.show

