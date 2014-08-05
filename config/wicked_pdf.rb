if Rails.env.staging? || Rails.env.production?
  exe_path = Rails.root.join('bin', 'wkhtmltopdf-amd64').to_s
else
  # exe_path = Rails.root.join('bin', 'wkhtmltopdf').to_s
  exe_path = '~/.rvm/gems/ruby-2.1.0/bin/wkhtmltopdf'
end
