{
  xdg.mimeApps = {
    enable = true;

    defaultApplications = {
      # === Text & Code ===
      "text/plain" = "obsidian.desktop";
      "text/markdown" = "obsidian.desktop";
      "text/c" = "nvim.desktop";
      "text/cpp" = "nvim.desktop";
      "text/x-shellscript" = "nvim.desktop";
      "text/html" = "zen.desktop";
      "text/x-cmake" = "nvim.desktop";
      "text/x-yaml" = "nvim.desktop";

      # === Directories & Filesystem ===
      "inode/directory" = "yazi.desktop";

      # === Web & URI Handlers ===
      "x-scheme-handler/http" = "zen.desktop";
      "x-scheme-handler/https" = "zen.desktop";

      # === Web File Extensions ===
      "application/xhtml+xml" = "zen.desktop";
      "application/x-extension-htm" = "zen.desktop";
      "application/x-extension-html" = "zen.desktop";
      "application/x-extension-shtml" = "zen.desktop";
      "application/x-extension-xhtml" = "zen.desktop";
      "application/x-extension-xht" = "zen.desktop";

      # === Multimedia ===
      "video/mp4" = "mpv.desktop";
      "video/webm" = "mpv.desktop";
      "video/avi" = "mpv.desktop";
      "video/x-matroska" = "mpv.desktop";
      "video/mp2t" = "mpv.desktop";  # MPEG-TS streams
      "audio/mpeg" = "mpv.desktop";
      "audio/ogg" = "mpv.desktop";
      "audio/flac" = "mpv.desktop";
      "audio/wav" = "mpv.desktop";
      "audio/x-m4a" = "mpv.desktop";

      # === Images ===
      "image/png" = "imv.desktop";
      "image/jpeg" = "imv.desktop";
      "image/gif" = "imv.desktop";
      "image/webp" = "imv.desktop";
      "image/svg+xml" = "imv.desktop";
      "image/tiff" = "imv.desktop";
      "image/bmp" = "imv.desktop";
      "image/x-icon" = "imv.desktop";

      # === Documents ===
      "application/pdf" = "org.pwmt.zathura-pdf-mupdf.desktop";
      "application/msword" = "libreoffice-writer.desktop";
      "application/vnd.openxmlformats-officedocument.wordprocessingml.document" = "libreoffice-writer.desktop";
      "application/vnd.ms-excel" = "libreoffice-calc.desktop";
      "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" = "libreoffice-calc.desktop";
      "application/vnd.oasis.opendocument.text" = "libreoffice-writer.desktop";
      "application/vnd.oasis.opendocument.spreadsheet" = "libreoffice-calc.desktop";
      "application/epub+zip" = "zathura.desktop";

      # === Archives & Compressed Files ===
      "application/zip" = "ark.desktop";
      "application/x-tar" = "ark.desktop";
      "application/x-gzip" = "ark.desktop";
      "application/x-bzip" = "ark.desktop";
      "application/x-7z-compressed" = "ark.desktop";
      "application/x-rar" = "ark.desktop";

      # === Executables & Special Formats ===
      "application/x-executable" = "foot.desktop";
      "application/x-shellscript" = "foot.desktop";
      "application/x-iso9660-image" = "ark.desktop";

      # === Development & Config Files ===
      "application/toml" = "nvim.desktop";
      "application/x-yaml" = "nvim.desktop";
      "application/xml" = "zed.desktop";
      "text/x-diff" = "zed.desktop";
    };
  };
}
