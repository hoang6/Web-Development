class RPNCalculator
  def initialize
    @array = []
  end

  def push(item)
    @array.push(item)
  end

  def value
    @result
  end

  def plus
    if @array.empty?
      raise ("calculator is empty")
    else
      a = @array.pop
      b = @array.pop
      @result = a + b
      @array.push(@result)
    end
  end

  def minus
    if @array.empty?
      raise ("calculator is empty")
    else
      a = @array.pop
      b = @array.pop
      @result = b - a
      @array.push(@result)
    end
  end

  def divide
    if @array.empty?
      raise "calculator is empty"
    else
      a = @array.pop
      b = @array.pop
      @result = b.to_f / a.to_f
      @array.push(@result)
    end
  end

  def times
    if @array.empty?
      raise "calculator is empty"
    else
      a = @array.pop
      b = @array.pop
      @result = b.to_f * a.to_f
      @array.push(@result)
    end
  end

  def tokens(string)
    string.split.map! { |t| t[/\d/] ? t.to_i : t.to_sym }
  end

  # def evaluate(pol)
  #   @numbers = [] # because this does 4 tests without clearing @numbers
  #   opps = {:+ => Proc.new {plus}, :- => Proc.new{minus}, :/ => Proc.new{divide}, :* => Proc.new{times} } # method in proc, thank you Frank :D
  #   tokens(pol).chunk{|n| n.is_a?(Integer)}.each{|e,a| e == true ? a.each{|a| push(a) } : a.each {|o| (opps[o].call) }}
  #   # @numbers[0]
  #   @result
  # end


  def evaluate(str)
    array = tokens(str)
    operators = {:+ => lambda {plus}, :- => lambda {minus}, :/ => lambda {divide}, :* => lambda {times} }
    for i in 0..(array.length - 1)
      if (operators.include?(array[i]))
        (operators[array[i]]).call
      else
        push(array[i])
      end
    end
    @result
  end

end

def run
  calc = RPNCalculator.new
  # First method:
  # print 'Enter string:'
  # str = gets.chomp

  # Second method
  # str = ARGV[0]
  # str = File.readlines(str).join

  # Third method
  # str = ''
  # File.open('rpn_string.txt') do |f|
  #   str = f.gets.chomp
  # end

  # Fourth method
  str = File.readlines('rpn_string.txt').join
  p calc.evaluate(str)
end

run
