class Test
  attr_reader :points
  attr_accessor :version

  def initialize(questions_path)
    unless File.exist?(questions_path)
      abort "Файл с вопросами #{questions_path} не найден."
    end
    file = File.new(questions_path, "r:UTF-8")
    @questions = file.readlines
    file.close

    @points = 0
    @question_number = 0
  end

  def finished?
    return @question_number >= @questions.size
  end

  def next_question
    puts @questions[@question_number]

    user_input = nil
    until user_input == 1 || user_input == 2 || user_input == 3
      puts "введите число: 1 – да, 2 – нет, 3 – иногда, и нажмите Enter"
      user_input = STDIN.gets.to_i
    end

    if user_input == 1
      @points += 2
      puts @points
    elsif user_input == 3
      @points += 1
    end

    @question_number += 1
  end
end