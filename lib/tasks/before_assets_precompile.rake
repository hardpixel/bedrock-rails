task :before_assets_precompile do
  assets = Rails.public_path.join('assets/admin')
  vendor = File.expand_path('../../assets/_vendor', File.dirname(__FILE__))

  FileUtils.mkdir_p(assets) unless File.directory?(assets)
  FileUtils.cp_r(File.join(vendor, 'ace'), assets)
  FileUtils.cp_r(File.join(vendor, 'tinymce', 'plugins'), assets)
  FileUtils.cp_r(File.join(vendor, 'tinymce', 'themes'), assets)
  FileUtils.cp_r(File.join(vendor, 'tinymce', 'skins'), assets)
end

Rake::Task['assets:precompile'].enhance ['before_assets_precompile']
