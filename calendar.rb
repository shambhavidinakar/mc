#hash for my calendar 
calendar = Hash.new { |h, k| h[k] = [] } # no of hours filled up in the day 
#two pointers, one for onsite and one for offsite
#best way for offsite meeting is to fill from end of the day forwards and onsite meeting from begining to backwards
onsite = 0 
offsite = 7
#last meeting of the day
last_meeting = false
# if the last meeting was an offsite meeting
lm_offsite = false
meeting.each do |meeting|
    name = meeting.name
    type = meeting.type
    duration = meeting.duration
    # handling offsite meeting
    while offsite >= onsite
        if(type == "offsite")
            calendar[name] = [offsite - duration,offsite]
            offsite = offsite - duration - 0.5
        else
            calendar[name] = [onsite, onsite +duration]
            onsite = onsite + duration    
        end
    end
end
if(offsite == onsite) 
    puts "Yes can fit. One possible solution would be"
    puts calendar.each { |x, y| puts "#{x}: #{y}" }
elsif(offsite > onsite)
    puts "No,can't fit"
else
    #I have to test if I can bump offsite meeting by half hour cause i filled for worst case. 

        
    
            
                
        