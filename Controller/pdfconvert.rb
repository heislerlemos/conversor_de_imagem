require 'pdftoimage'

module Pdftoimg

  def imgtopdf(caminho)
    images = PDFToImage.open(caminho)
    images.each do |page|
      page.resize('50%').save("/home/heisler/code/visa_application_registar/image_converted/PDF_PARA_JPEG/ficheiro#{page.page}.jpg")
    end
  end
end
