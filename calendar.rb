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
            if(type == "offsite")
                calendar[name] = [(offsite - duration + 9)%12,(offsite+9)%12]
                offsite = offsite - duration - 0.5
            else
                calendar[name] = [(onsite+9)%12, (onsite+duration+9)%12]
                onsite = onsite + duration    
            end
    end
    if(offsite == onsite) 
        puts "Yes can fit. One possible solution would be"
        puts calendar.each { |x, y| puts "#{x}: #{y}" }
    elsif(offsite > onsite)
        puts "No,can't fit"
    else
        #I have to test if I can bump offsite meeting by half hour cause i filled for worst case. 
    end
end


meetings = []
meetings << Meeting.new("1",3,"onsite")
meetings << Meeting.new("2",3,"onsite")
meetings << Meeting.new("3",3,"offsite")
meetings << Meeting.new("4",3,"offsite")
    
scheduler(meetings)
                
        