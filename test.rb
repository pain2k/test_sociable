class Test
  def initialize(questions_path)
    unless File.exist?(questions_path)
      abort "Файл с вопросами #{questions_path} не найден."
    end
    file = File.new(questions_path, "r:UTF-8")
    @questions = file.readlines
    file.close

    @points = 0
    @current_question = 0
  end

  def finished?
    return @current_question >= @questions.size
  end

  def next_question
    puts @questions[@current_question]

    user_input = nil
    until user_input == 1 || user_input == 2 || user_input == 3
      puts "введите число: 1 – да, 2 – нет, 3 – иногда, и нажмите Enter"
      user_input = gets.to_i
    end

    if user_input == 1
      @points += 2
      puts @points
    elsif user_input == 3
      @points += 1
    end

    @current_question += 1
  end

  def points
    return @points
  end
end