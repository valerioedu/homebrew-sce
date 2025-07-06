class Sce < Formula
    desc "SCE - Simple Code Editor"
    homepage "https://github.com/valerioedu/SCE2"
    url "https://github.com/valerioedu/SCE2/archive/refs/tags/v1.0.0.tar.gz"
    sha256 "701354e42769b0db1a7d7f6eea36f2bd8619fdebf0659e0f7559eda7036ac40a"
    license "GPL-3.0"

    depends_on "cmake" => :build
    depends_on "pkg-config" => :build
    depends_on "ncurses"

    def install
        config_dir = Pathname.new(Dir.home)/".sceconfig"
        config_dir.mkpath

        cp ".sceconfig", config_dir
        
        mkdir "build" do
            system "cmake", "..", *std_cmake_args
            system "make"
            system "make", "install"
        end
    end

    test do
        system "#{bin}/SCE", "--version"
    end
end
    
