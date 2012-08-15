require 'test/unit'
require './ppmFileHandler'

class TestFileHandler < Test::Unit::TestCase
  def test_readFirstLineOfAFile
    ppmFileHandler = PPMFileHandler.new('ppm_examples/sean-connery.ppm')
    assert_equal(ppmFileHandler.ppm.magicIdentifier,'P3')
  end
  def test_writeFirstLineOfAFile
    skip('Somente utilizados para aprendizagem')
    ppmFileHandler = PPMFileHandler.new('ppm_examples/sean-connery.ppm')
    ppmFileHandler.writeTo('ppm_examples/teste.ppm')
    new_ppmFileHandler = PPMFileHandler.new('ppm_examples/teste.ppm')
    assert_equal(new_ppmFileHandler.ppm.magicIdentifier,'P3')
  end
   def test_readAllHeader
    ppmFileHandler = PPMFileHandler.new('ppm_examples/sean-connery.ppm')
    assert_equal(ppmFileHandler.ppm.magicIdentifier,'P3')
    assert_equal(ppmFileHandler.ppm.width,'85')
    assert_equal(ppmFileHandler.ppm.height,'108')
    assert_equal(ppmFileHandler.ppm.colorMaximumValue,'255')
    ppmFileHandler.writeTo('ppm_examples/teste1.ppm')
   end
   def test_readAllBodyLines
    ppmFileHandler = PPMFileHandler.new('ppm_examples/sean-connery.ppm')
    assert_equal(ppmFileHandler.ppm.colorLines.size,1305)
    ppmFileHandler.writeTo('ppm_examples/testeCinza.ppm')
   end
end
