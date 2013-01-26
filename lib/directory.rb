class Directory

  VID_FILETYPES = /avi|mkv|mp4|mp3|3gp|ogv|flv|mov/

  def self.files_and_folders(arr)
    directory = '/media/zeus/' + arr.join('/')
    folders, files = [], []
    Dir.chdir(directory)
    Dir['*'].each do |f|
      if File.directory?(f)
        folders << f
      else
        files << f if f =~ VID_FILETYPES
      end
    end
    [folders, files, arr]
  end

end