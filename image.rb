require 'libui'
UI = LibUI
UI.init
require "mini_magick"

module Image
  def image_convert (path)
    image = MiniMagick::Image.open(path)
    image.path
    image.resize "300x100"
    image.format "png"
    image.write "output.png"
    puts "clickado"
    main_window = UI.new_window('hello world', 600, 300, 1)
    UI.msg_box(main_window, 'Information', " imagem convertida")

  end
end
