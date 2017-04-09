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
  puts item.to_s + "\n" + answers.join("\n")
  print ">"
  answer = STDIN.gets.encode("UTF-8").chomp.downcase
  while vars.include?(answer) == false do
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

puts answer_counter.to_s

if answer_counter >= 30 && answer_counter <= 32
  puts results[0].to_s
elsif answer_counter >= 25 && answer_counter <= 29
  puts results[1].to_s
elsif answer_counter >= 19 && answer_counter <= 24
  puts results[2].to_s
elsif answer_counter >= 14 && answer_counter <= 18
  puts results[3].to_s
elsif answer_counter >= 9 && answer_counter <= 13
  puts results[4].to_s
elsif answer_counter >= 4 && answer_counter <= 8
  puts results[5].to_s
else
  puts results[6].to_s
end