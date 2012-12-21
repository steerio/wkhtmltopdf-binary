require 'rubygems'
require 'rubygems/package_task'

spec = Gem::Specification.new do |s| 
  s.name = "wkhtmltopdf-binary"
  s.version = "0.10"
  s.author = "Research Information Systems, The University of Iowa"
  s.email = "vpr-ris-developers@iowa.uiowa.edu,mcollas@aconex.com"
  s.platform = Gem::Platform::RUBY
  s.summary = "Provides binaries for WKHTMLTOPDF project in an easily accessible package."
  s.description = <<-EOF
    Provides binaries and utilities of WKHTMLTOPDF.
    Also patches WickedPdf (if installed) to use provided binary
  EOF
  s.homepage = 'https://github.com/steerio/wkhtmltopdf-binary'
  s.files = FileList["{bin,libexec,lib}/*"].to_a
  s.has_rdoc = false
  s.rdoc_options += ['-x', 'libexec/.*']
  s.executables << "wkhtmltopdf" << 'wkhtmltopdf-path'
end

Gem::PackageTask.new(spec) do |pkg|
  pkg.need_tar = true
end

spec
