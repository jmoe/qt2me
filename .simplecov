if Rails.env.test?
  SimpleCov.start do

    load_adapter 'test_frameworks'

    add_filter '/config/'
    add_filter '/db/'
    add_filter 'vendor'
    add_filter 'app/controllers/admin'

    add_group 'Controllers', 'app/controllers'
    add_group 'Models', 'app/models'
    add_group 'Jobs', 'app/jobs'
    add_group 'Helpers', 'app/helpers'
    add_group 'Libraries', '/lib'
    add_group 'Sweepers', 'app/sweepers'

  end
end