class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def welcome
  end

  def download_agent
    file_name = 'agent.rb'
    f = File.open(file_name, 'w')
    f.write("require 'usagewatch_ext'")
    f.write("\n")
    f.write("usw =  Usagewatch")
    f.write("\n")
    f.write('puts "#{usw.uw_diskused} Gigabytes Used"')
    f.write("\n")
    f.close
    send_file f.path
  end
end
