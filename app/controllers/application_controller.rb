class ApplicationController < ActionController::Base
  require 'authlogic'
  protect_from_forgery
end
