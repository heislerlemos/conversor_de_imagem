require 'glimmer-dsl-libui'

include Glimmer

window('Basic Image', 96, 96) {
  area {
    image(File.expand_path('logo.png', __dir__), height: 96) # width is automatically calculated from height while preserving original aspect ratio
#     image(File.expand_path('icons/glimmer.png', __dir__), width: 96, height: 96) # you can specify both width and height options
#     image(File.expand_path('icons/glimmer.png', __dir__), 96, 96) # you can specify width, height as args
#     image(File.expand_path('../icons/glimmer.png', __dir__), 0, 0, 96, 96) # you can specify x, y, width, height args as alternative
#     image(File.expand_path('../icons/glimmer.png', __dir__), x: 0, y: 0, width: 96, height: 96) # you can specify x, y, width, height options as alternative
  }
}.show
