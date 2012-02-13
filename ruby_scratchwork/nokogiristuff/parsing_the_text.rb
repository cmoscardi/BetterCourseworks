require 'nokogiri'
require 'rubygems'

file = File.open("courseworks_raw_html","rb")
text = file.read

doc = Nokogiri::HTML(text)
elements = doc.css('td.courselisting')
i=0
courses=[]
#print i
elements.each do |element|
  print "#{i}:  "

  if i%3 == 0
    coursenumber = i/3
    courses[i/3]={:name => "", :instructor => ""}
    puts element
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




