if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end
require_relative "lib/test"
require_relative "lib/result_printer"

VERSION = "Программа-тест оценки коммуникабельности. Версия 4, 15.04.2017"

current_path = File.dirname(__FILE__)
questions_path = current_path + "/data/questions.txt"
results_path = current_path + "/data/results.txt"

puts "Тест поможет определить ваш уровень коммуникабельности.\nДля этого необходимо правдиво ответить на следующие вопросы."

test = Test.new(questions_path)
test.version = VERSION
result_printer = ResultPrinter.new(results_path)

until test.finished?
  test.next_question
end

result_printer.print_result(test)
