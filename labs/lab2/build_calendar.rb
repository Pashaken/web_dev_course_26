require 'date'

#Валидация входных данных


#Валидация аргументов в кс
def validARGV
  if ARGV.length != 4
    puts "Error : need 4 arg!"
    exit
  end

end


#Валидация расположения файла
def validFile(path)
  unless File.exist?(path)
    puts "Error : path not found!"
    exit
  end
end

#Валидация даты
def validDate(first_day,last_day)
  begin
    first_day = Date.strptime(first_day,"%d.%m.%Y")
    last_day = Date.strptime(last_day,"%d.%m.%Y")
  rescue
    puts "Error : not valid DataType"
    exit
  end
  
  if last_day <= first_day
    puts "Error : firstday > lastday"
    exit
  end
end




#Чтение файла
def readFile(path)

  File.read(path, encoding: "UTF-8").split("\n").map do |line|
    #проверка на тип строки
    unless line =~ /^\d+\.\s.+\s—\s.+$/
      puts "Error : not valid string type"
      exit
    end

    #заполнение нужными переменными из строки
    numb, team_name = line.split('. ', 2)
    city = team_name.split('—').last.strip
    { id: numb.to_i, name: team_name.strip, city: city }
  end
end


#Генерация слотов под матчи
def genMatchTime(first_day,last_day)
  first_day = Date.parse(first_day)
  last_day = Date.parse(last_day)

  matches = []

  cur_day = first_day

  #Слотов для будущего заполнения матчей 
  while cur_day <= last_day
    if %w(Friday Saturday Sunday).include?(cur_day.strftime('%A'))
      ["12:00","15:00","18:00"].each do |time|
        matches<< "#{cur_day.strftime('%d.%m.%Y')} #{time}" 
      end
    end
    cur_day+=1
  end
  matches
end

#Заполнение слотов матчами 
def fillMatchTime(teams,slot)
  matches=[]
  slot_index = 0

  teams.each_with_index do |a,i|
    nteam = i+1

    while nteam< teams.length
      #Проверка на слоты
      if slot_index >= slot.length
        puts "Error : not enough time slots for matches"
        exit
      end

      #заполнение слотов 
      b = teams[nteam]
      matches<<{time: slot[slot_index], team1: a, team2: b}

      slot_index+=1
      nteam +=1
    end
  end
  matches
end

#Создание файла календаря
def saveAsCalendar(matches,file_name)
  #Создание файла и присваивание заголовка
  File.open(file_name,"w") do |file|
    file.puts "Календарь Матчей"
    file.puts " " * 10
  
  #Заполнение матчами
    matches.each do |slot|
      file.puts slot[:time]
      file.puts " #{slot[:team1][:name]}"
      file.puts " and "
      file.puts " #{slot[:team2][:name]}"
      file.puts " " * 10
    end
  end
end

#Запуск функций и тд


#Валидация аругментов кс
validARGV


#заполнение входных данных 
teams_file = ARGV[0]
first_day = ARGV[1]
last_day = ARGV[2]
calendar_name = ARGV[3]


#Валидация входных данных
validFile(teams_file)
validDate(first_day,last_day)

#Считывание файла - генерация слотов - заполнение слотов
teams = readFile(teams_file)
slots = genMatchTime(first_day,last_day)
matches = fillMatchTime(teams,slots)

#Сохранение в файл в качестве календаря
saveAsCalendar(matches,calendar_name)
puts "Calendar sucsesfull create!"