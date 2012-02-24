module SessionsHelper
 def user_login(email,password)

 agent = Mechanize.new
 page=agent.get('https://wind.columbia.edu/login?destination=https%3A%2F%2Fcourseworks%2Ecolumbia%2Eedu%2Fcms%2Fwind%2Flogin%2Ecfm%3Fskinbutton=1')

 login_form = page.form('theform')

 login_form.username=email
 login_form.password=password


 file = agent.submit(login_form)
 if file.form_with(:action => "https://wind.columbia.edu/login")
   return nil
 else 
   text = file.body
   return text
 end

end 
 
    
 def parse_front_page(text)
   doc = Nokogiri::HTML(text)
   elements = doc.css('td.courselisting')
   i=0
   courses=[]
   #print i
   elements.each do |element|
   #print "#{i}:  "

     if i%3 == 0
      coursenumber = i/3
      courses[i/3]={}
      title = /[A-Z]{4}\s[A-Z](\d{4}).(\d{3}).(\d{4}).\d/.match(element.to_s)
      courses[i/3][:call_number]=title.to_s.strip
      link = /framesets.*syllabus./.match(element.to_s)
      courses[i/3][:link]=link.to_s.strip
     elsif i%3 == 1
      class_name = /([A-Z]+\S?\s?)+$/.match(element.to_s)

      courses[i/3][:name]=class_name.to_s.strip

     else

      prof= /[A-Z][a-z]*\s?[A-Z]?[a-z]*\S?\s\s[A-Z][a-z]*/.match(element.to_s)
      courses[i/3][:instructor]=prof.to_s.strip
      #need regex
     end
    i+=1
    end
  return courses
 end

end

