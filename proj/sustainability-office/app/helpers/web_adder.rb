module WebAdder
  require 'rubygems'
  require 'mechanize'
  require 'open-uri'
  require 'nokogiri'

  #require 'mechanize'

  def self.load_events
    @agent = Mechanize.new
    page=@agent.get('http://calendar.colgate.edu/group/sustainability')
    @agent.follow_meta_refresh = true
    @Events=[]
    page.search(".event_item").each do |t|
      @E=Meeting.new()
      # E.title=t.search(".heading")
      @temp=t.search("a[href]")
      @temp=t.search('a').map{ |link| link['href'] }
      page = @agent.get(@temp[0])
      @E.title=page.search(".summary").text
      if !page.search(".location").nil?
        @E.location= page.search(".location").text
      end

      @E.date=DateTime.parse(page.search(".dtstart").text)

      @E.points=1

      @E.description= page.search(".description").text

      if !Meeting.where(date:@E.date,location:@E.location).exists?
        @E.save()
      end

    end


  end
end
