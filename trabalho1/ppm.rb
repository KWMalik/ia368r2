class PPM
  def initialize(magicIdentifier, width, height,colorMaximumValue)
    @magicIdentifier = magicIdentifier
    @width = width
    @height = height
    @colorMaximumValue = colorMaximumValue
    @colorLines = []
  end

  def colorLines
    @colorLines
  end

  def addColorLines(line)
    @colorLines.push(line)
  end

  def width
    @width
  end

  def height
    @height
  end

  def colorMaximumValue
    @colorMaximumValue
  end

  def magicIdentifier
    @magicIdentifier
  end
end
