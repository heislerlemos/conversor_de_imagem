
require "mini_magick"

module Image

  def imgpassaporte (path)
    image = MiniMagick::Image.open(path)
    image.path
    image.colorspace "gray"
    image.size 70000
    image.format "jpeg"
    image.write "./image_converted/passaporte_convertido.jpeg"
  end

  def vacina (path)
    image = MiniMagick::Image.open(path)
    image.path
    image.colorspace "gray"
    image.format "jpeg"
    image.write "./image_converted/vacina_convertido.jpeg"
  end

  def fotografia (path)
    image = MiniMagick::Image.open(path)
    image.path
    image.colorspace "gray"
    image.format "jpeg"
    image.write "./image_converted/fotografia_convertido.jpeg"
  end

  def bilhete (path)
    image = MiniMagick::Image.open(path)
    image.path
    image.colorspace "gray"
    image.format "jpeg"
    image.write "./image_converted/bilhete_convertido.jpeg"
  end


  # add a condition , when testing on windows machine

  def diropen      
      system("xdg-open", "/home/heisler/code/visa_application_registar/image_converted/")

  end
end
