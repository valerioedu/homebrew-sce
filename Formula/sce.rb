class Sce < Formula
    desc "SCE - Simple Code Editor"
    homepage "https://github.com/valerioedu/SCE2"
    url "https://github.com/valerioedu/SCE2/archive/refs/tags/v1.1.0.tar.gz"
    sha256 "d5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed"
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
    
