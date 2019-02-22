class Meeting
    def initialize(name,duration,type)
        @name = name
        @duration = duration
        @type =type
    end

    def name()
        return @name 
    end

    def duration()
        return @duration
    end

    def type()
        return @type
    end
end


def scheduler(meetings)
    #hash for my calendar 
    calendar = Hash.new { |h, k| h[k] = [] } # no of hours filled up in the day 
    #two pointers, one for onsite and one for offsite
    #best way for offsite meeting is to fill from end of the day forwards and onsite meeting from begining to backwards
    onsite = 0 
    offsite = 8
    #last meeting of the day
    last_meeting = false
    # if the last meeting was an offsite meeting
    lm_offsite = false
    meetings.each do |meeting|
        name = meeting.name
        type = meeting.type
        duration = meeting.duration
        # handling offsite meeting
        if type == "offsite"
            start = (offsite - duration + 9)%12
            finish = (offsite+9)%12
            offsite = offsite - duration - 0.5
        else
            start = (onsite+9)%12
            finish = (onsite+duration+9)%12
            onsite = onsite + duration    
        end
        if start == 0
            start = 12
        end
        if finish == 0 
            finish = 12
        end
        calendar[name] = [start,finish]
    end
    if offsite >= onsite 
        puts "Yes can fit. One possible solution would be"
        puts calendar.each { |x, y| puts "#{x}: #{y}" }
    else offsite < onsite
        puts "No,can't fit"
    end 
end


meetings = []
meetings << Meeting.new("Meeting 1",3,"onsite")
meetings << Meeting.new("Meeting 2",2,"onsite")
meetings << Meeting.new("Meeting 3",1,"offsite")
meetings << Meeting.new("Meeting 4",0.5,"offsite")
    
scheduler(meetings)

meetings2 = []
meetings2 << Meeting.new("Meeting 1",1.5,"onsite")
meetings2 << Meeting.new("Meeting 2",2,"offsite")
meetings2 << Meeting.new("Meeting 3",1,"onsite")
meetings2 << Meeting.new("Meeting 4",1,"offsite")
meetings2 << Meeting.new("Meeting 4",1,"offsite")

scheduler(meetings2)

meetings3 = []
meetings3 << Meeting.new("Meeting 1",4,"offsite")
meetings3 << Meeting.new("Meeting 2",4,"offsite")

scheduler(meetings3)

meetings4 = []
meetings4 << Meeting.new("Meeting 1",0.5,"offsite")
meetings4 << Meeting.new("Meeting 2",0.5,"onsite")
meetings4 << Meeting.new("Meeting 3",2.5,"offsite")
meetings4 << Meeting.new("Meeting 4",3,"onsite")

scheduler(meetings4)
