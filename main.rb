if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end
require_relative "test"
require_relative "result_printer"

puts "Тест поможет определить ваш уровень коммуникабельности.\nДля этого необходимо правдиво ответить на следующие вопросы."

current_path = File.dirname(__FILE__)
questions_path = current_path + "/data/questions.txt"
results_path = current_path + "/data/results.txt"

test = Test.new(questions_path)
result_printer = ResultPrinter.new(results_path)

until test.finished?
  test.next_question
end

result_printer.print_result(test)
