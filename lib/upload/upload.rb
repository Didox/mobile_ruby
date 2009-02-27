class Uploadfile
  #inicializa objetos da classe
  #def initialize
  #  @@directory = "public/data"
  #end
  
  #variavel interna usar 
  ROOT_DIRECTORY = "public/data"
  ROOT_DIRECTORY_WEB = "/data"

  #get directory
  attr_accessor :directory

  #get set variaveis
  #attr accessor varia

  #in rails para objtos usar
  #cattr accessor objeto

  def self.save(upload, directory)
    #debugger
    name =  upload.original_filename
    dir = ROOT_DIRECTORY + directory
    dir_web = ROOT_DIRECTORY_WEB + directory
    unless File.directory? dir
      Dir.mkdir(dir, 0777)
    end
    
    # create the file path
    path = File.join(dir, name)
    # write the file
    File.open(path, "wb") { |f| f.write(upload.read) }

    path = File.join(dir_web, name)
    path
  end

  def self.createdir(dir_name)
    #debugger
    begin
      full_dir = "#{ROOT_DIRECTORY + @directory}/#{dir_name}"
      if File.directory? full_dir
        Dir.mkdir(full_dir, 7)
        return true
      end
      false
    rescue
      false
    end
    #Dir.chdir(full_dir)

    #Dir.glob("file_*.rb").empty?
    ##=> false

    #Dir.glob("file_*.rb").size>0
    ##=> true

    #Dir.glob("file_*.rb")
    ##=> ["file_1.rb", "file_2.rb", "file_3.rb"]

    #File.exist? "file_1.rb"
    ##=> true

    #File.exist? "file_2.rb"
    ##=> true

    #File.exist? "file_4.rb"

  end

  def self.removedir(dir_name)
    #debugger
#    begin
      full_dir = "#{ROOT_DIRECTORY}/#{dir_name}"
      if File.directory? full_dir
        FileUtils.rm_rf(full_dir)
        #Dir.rmdir(full_dir)
        return true
      end
#      false
#    rescue SystemCallError
#      false
#    end
  end

  def self.delete(upload)    
    full_path = "#{ROOT_DIRECTORY}/#{upload}"
    if File.exists?(full_path)
      File.delete(full_path)
      return true
    end
    
    false
  end

  def self.listdirs
    #write open files
    #aFile = File.new("/var/www/tutorialspoint/ruby/test", "r")
    #if aFile
    #   aFile.syswrite("ABCDEF")
    #   aFile.each_byte {|ch| putc ch; putc ?. }
    #else
    #   puts "Unable to open file!"
    #end




    #Dir.entries('.').detect {|f| f.match /^file_/}
    #list = Dir.entries(@@directory)
    #list.each do |i|
    #    i.delete
    #  end
    #end
    #Dir.entries(@@directory) # return all files
    #Dir.entries(@@directory).select{|f| File.file? f }.sort_by { |f| File.mtime(f) }.reverse[0..9]
    Dir.entries(ROOT_DIRECTORY).select {|f| File.directory? "#{ROOT_DIRECTORY}/#{f}" }

  end

  def self.listfiles
    #Dir.entries('.').detect {|f| f.match /^file_/}
    #list = Dir.entries(@@directory)
    #list.each do |i|
    #  unless i.index(".") == nil
    #    i.delete
    #  end
    #end
    Dir.entries(ROOT_DIRECTORY).select {|f| File.file? "#{ROOT_DIRECTORY}/#{f}" }
    #Dir.entries(".").select{|f| File.file? f }.sort_by { |f| File.mtime(f) }.reverse[0..9]
    #Dir.glob("*.jpg").sort.reverse[0..9]

  end
end