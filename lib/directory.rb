class Directory

  def self.files_and_folders(arr)
    directory = '/media/zeus/' + arr.join('/')
    folders, files = [], []
    Dir.chdir(directory)
    Dir['*'].each do |f|
      if File.directory?(f)
        folders << f
      else
        files << f
      end
    end
    [folders, files, arr]
  end

end