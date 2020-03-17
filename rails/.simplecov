SimpleCov.profiles.define 'halo_cov' do
  add_filter '/spec/'
  add_filter '/config/'

  add_group 'Controllers', 'app/controllers'
  add_group 'Models',      'app/models'
  add_group 'Routes',      'config/routes'
end

