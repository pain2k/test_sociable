class ResultPrinter
  def initialize(results_path)
    unless File.exist?(results_path)
      abort "Файл с результатами #{results_path} не найден."
    end

    file = File.new(results_path, "r:UTF-8")
    @results = file.readlines
    file.close
  end

  def print_result(test)
    puts "Результат теста (всего баллов - #{test.points}):"

    case test.points
      when (30..32) then puts @results[0]
      when (25..29) then puts @results[1]
      when (19..24) then puts @results[2]
      when (14..18) then puts @results[3]
      when (9..13) then puts @results[4]
      when (4..9) then puts @results[5]
      when (0..3) then puts @results[6]
    end
  end
end
