class SessionsController < ApplicationController
  include SessionsHelper
  def new
    render root_path
  end

  def create
    uni = params[:session][:uni]
    password = params[:session][:password]
    puts uni
    puts password
    
    if User.find_by_uni(uni).nil?
      front_page = user_login(uni,password)
      course_data = parse_front_page(front_page)
      if front_page.nil? 
        flash.now[:error]="Something has gone horribly wrong"
        render root_path
      else
        @user = User.create!(:uni => uni)
        course_data.each do |course|
          if Course.find_by_title(course[:call_number]).nil?
            course.create!(:user_id => @user[:id], :name => course[:name], :title => course[:call_number], :professor => course[:professor])
          else
          #fix
          end
        end
        redirect_to @user
      end
   else
      @user = User.find_by_uni(uni)
   end
  end

end
