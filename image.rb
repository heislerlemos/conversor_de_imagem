
require "mini_magick"

module Image

  def imgpassaporte (path)
    image = MiniMagick::Image.open(path)
    image.path
    image.resize "300x100"
    image.format "png"
    image.write "./image_converted/passaporte_convertido.png"
    main_window = UI.new_window('hello world', 600, 300, 1)
  end

  def vacina (path)
    image = MiniMagick::Image.open(path)
    image.path
    image.resize "300x100"
    image.format "png"
    image.write "./image_converted/vacina_convertido.png"
  end

  def fotografia (path)
    image = MiniMagick::Image.open(path)
    image.path
    image.resize "300x100"
    image.format "png"
    image.write "./image_converted/fotografia_convertido.png"
  end

  def bilhete (path)
    image = MiniMagick::Image.open(path)
    image.path
    image.resize "300x100"
    image.format "png"
    image.write "./image_converted/bilhete_convertido.png"
  end
end
