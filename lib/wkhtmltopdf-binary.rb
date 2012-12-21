module WkHtmlToPdfBinary
  def self.binary_path
    arch = case RUBY_PLATFORM
           when /64.*linux/
             'linux-amd64'
           when /linux/
             'linux-x86'
           when /darwin/
             'darwin-x86'
           else
             raise NotImplementedError, "Invalid platform. Must be running linux or intel-based Mac OS."
           end

    File.expand_path("#{File.dirname(__FILE__)}/../libexec/wkhtmltopdf-#{arch}")
  end
end

begin
  require 'wicked_pdf'
  WickedPdf.config[:exe_path] ||= WkHtmlToPdfBinary.binary_path
rescue LoadError, NotImplementedError
end unless Object.const_defined?(:NO_WICKEDPDF_PATCH)
