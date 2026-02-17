require 'date'

def readFile(path)
  File.read(path).split("\n").map do |line|
    numb, team_name = line.split('. ', 2)
    city = team_name.split('—').last.strip
    { id: numb.to_i, name: team_name.strip, city: city }
  end
end

def genMatchTime(first_day,last_day)
  first_day = Date.parse(start_day)
  last_day = Date.parse(last_day)

  matches = []

  cur_day = first_day

  while cur_day <= last_day
    if %w(Friday Saturday Sunday).include?(cur_day.strftime('%A'))
      ["12:00","15:00","18:00"].each do time
        matches<< "#{cur_day.strftime('%d.%m.%Y')} #{time}" 
      end
    end
    cur_day+=1
  end
end

def fillMatchTime(teams,slot)
  matches={}
  teams.each do |a,i|
    nteam = i+1

    while nteam< teams.lenght
      b = teams[nteam]
      nil
      

    end
    
  end
  
end