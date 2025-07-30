class Sce < Formula
    desc "SCE - Simple Code Editor"
    homepage "https://github.com/valerioedu/SCE2"
    url "https://github.com/valerioedu/SCE/archive/refs/tags/v1.1.1.tar.gz"
    sha256 "3e64de688b9e19166277f362c55ad8b3fbe5d084a9c0361414d7943fe530f8c5"
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
    
