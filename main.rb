if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end
puts "Тест поможет определить ваш уровень коммуникабельности.\nДля этого необходимо правдиво ответить на следующие вопросы."

current_path = File.dirname(__FILE__)
questions_path = current_path + "/data/questions.txt"
results_path = current_path + "/data/results.txt"

if File.exist?(results_path)
  file = File.new(results_path, "r:UTF-8")
  results = file.readlines
  file.close
else
  puts "Ответы не найдены!"
end

if File.exist?(questions_path)
  file = File.new(questions_path, "r:UTF-8")
  questions = file.readlines
  file.close
else
  puts "Вопросы не найдены!"
end

answers = ['а) да', 'б) нет', 'в) иногда']
vars = ['да', 'нет', 'иногда']
answer_counter = 0
for item in questions do
  puts "#{item}\n #{answers.join("\n")}"
  print ">"
  answer = STDIN.gets.encode("UTF-8").chomp.downcase
  until vars.include?(answer) do
    puts "Возможные варианты ответа: да, нет, иногда"
    print ">"
    answer = STDIN.gets.encode("UTF-8").chomp.downcase
  end
  if answer == vars[0]
    answer_counter += 2
  elsif answer == vars[1]
    answer_counter += 0
  else
    answer_counter += 1
  end
end

puts case answer_counter
       when (30..32) then results[0]
       when (25..29) then results[1]
       when (19..24) then results[2]
       when (14..18) then results[3]
       when (9..13) then results[4]
       when (4..8) then results[5]
       else results[6]
     end