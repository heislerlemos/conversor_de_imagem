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
      text {
        default_font family: 'Helvetica', size: 12, weight: :normal, italic: :normal, stretch: :normal
        string("Introduza imagem para elaborar conversão das imagens e modificar o tamanho para que seja aceita no consulado de angola") {
          font size: 20, weight: :bold, italic: :normal, stretch: :normal
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
        label 'insira o caminho da imagem'
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

