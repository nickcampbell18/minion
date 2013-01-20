require 'singleton'
class Directory
  include Singleton

  attr_reader :dir

  SAFE_DIR = /^\/media\/zeus/ # Do not allow outside this folder

  def initialize
    @dir = navigate %w{media zeus}
  end

  def navigate(array)
    directory = '/' + array.join('/') # Build up a directory
    if directory =~ SAFE_DIR
      @dir = Dir.open(directory)
    else
      @dir = Dir.open('/media/zeus')
    end
  end

end