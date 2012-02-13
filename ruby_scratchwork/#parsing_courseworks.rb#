require 'nokogiri'
require 'rubygems'
require 'mechanize'
require 'pp'


agent = Mechanize.new
page=agent.get('https://wind.columbia.edu/login?destination=https%3A%2F%2Fcourseworks%2Ecolumbia%2Eedu%2Fcms%2Fwind%2Flogin%2Ecfm%3Fskinbutton=1')

login_form = page.form('theform')

login_form.username="clm2183"
login_form.password="aA5544991155"


page2 = agent.submit(login_form)

lines= page2.css('td.courselisting tr')

pp lines



