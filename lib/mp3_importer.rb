class MP3Importer
    attr_reader :path
    def initialize(file_path)
        @path = file_path
    end

    def files
        paths = Dir["#{@path}/*.mp3"]
        file_names = paths.map {|path| path.split('/')[-1]}
    end

    def import
        files = self.files
        files.each {|file| Song.new_by_filename(file)}
    end
end