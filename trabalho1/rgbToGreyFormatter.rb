class RGBToGreyFormatter
  def self.format

  end
  def self.stringRGBToGrey(line)
    vectorLine = line.split(' ')
    greyVector = ''
    vectorLine.length.times do |i|
      if i % 3 == 0
        greyColor = ((vectorLine[i].to_i + vectorLine[i+1].to_i + vectorLine[i+2].to_i)/3)
        greyVector  = "#{greyVector} +    {#greyColor.to_s}"
      else
         greyVector  = "#{greyVector} +    {#greyColor.to_s}"
      end
    end
    puts greyVector
  end
end
