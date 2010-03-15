if Rails.env == 'test'
  if defined? Spec
    require 'shoulda/rspec'
  else
    require 'shoulda/rails'
  end
end
