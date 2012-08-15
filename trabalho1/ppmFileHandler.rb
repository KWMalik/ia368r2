require './ppm'
require './rgbToGreyFormatter'
class PPMFileHandler

  def initialize(filename)
    @ppm = readPPMFile(filename)
  end

  def ppm
    @ppm
  end

  def writeTo(filename)
    aFile = File.new(filename, "w")
    createFileHeader(aFile)
    createGreyBody(aFile)
    aFile.close
  end

  private

  def createGreyBody(aFile)
    @ppm.colorLines.each { |s| aFile.puts s}
  end


  def createFileHeader(aFile)
    aFile.puts @ppm.magicIdentifier
    aFile.puts "#{@ppm.width} #{@ppm.height}"
    aFile.puts "#{@ppm.colorMaximumValue}"
  end

  def readPPMFile(filename)
    #tratar arquivo invalido e outros formatos
    file = File.new(filename, "r")
    readHeader(file)
    readBody(file)
    file.close
    @ppm
  end

  def readBody(file)
    file.each_line{ |s|
      if(s!= nil)
        @ppm.addColorLines(s)
      end
    }
  end

  def readHeader(file)
     #header = [file.gets.chomp, file.gets.chomp, file.gets.chomp]
    magicIdentifier = file.gets.chomp
    while(magicIdentifier.include? '#')
      magicIdentifier = file.gets.chomp
    end
    widthAndHeight = file.gets.chomp
    while(widthAndHeight.include? '#')
      widthAndHeight = file.gets.chomp
    end

    widthAndHeight = widthAndHeight.split(' ')
    width = widthAndHeight.first
    height = widthAndHeight[1]

    colorMaximumValue = file.gets.chomp
    while(colorMaximumValue.include? '#')
      colorMaximumValue = file.gets.chomp
    end
    @ppm = PPM.new(magicIdentifier,width,height,colorMaximumValue)

  end

end


