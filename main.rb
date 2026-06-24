require 'libui'
UI = LibUI
UI.init
require 'glimmer-dsl-libui'
require "mini_magick"
include Glimmer

window('Programa de conversão de visto de angoa', 600 , 400) {
    ficheiro_requisito = File.read("/home/heisler/code/visa_application_registar/requisitos.txt")
    margined true

    vertical_box {

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
          #image = MiniMagick::Image.open("/home/heisler/code/visa_application_registar/test.jpeg")
          image = MiniMagick::Image.open(@caminho.text)
          image.path
          image.resize "300x100"
          image.format "png"
          image.write "output.png"
          puts "clickado"
          main_window = UI.new_window('hello world', 600, 300, 1)
          UI.msg_box(main_window, 'Information', " imagem convertida")
        end

      }
      area {
        
    image(File.expand_path('logo.png', __dir__), height: 100) # width is automatically calculated from height while preserving original aspect ratio
      }

=begin
Check this later 
    area {
      text {
        default_font family: 'Helvetica', size: 12, weight: :normal, italic: :normal, stretch: :normal
        nome = "heisler"
        string(nome) {
          font size: 20, weight: :bold, italic: :normal, stretch: :normal
          color r: 128, g: 0, b: 0, a: 1
        } 
      }
    }
=end
  } 
}.show

