class Sce < Formula
    desc "SCE - Simple Code Editor"
    homepage "https://github.com/valerioedu/SCE2"
    url "https://github.com/valerioedu/SCE2/archive/refs/tags/v1.0.0.tar.gz"
    sha256 "8d1d9c42cecc47089b0f94c036a1f050cfe71b05301e6c98e8b12c3780ade515"
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
    
