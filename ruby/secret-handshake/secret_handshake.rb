class SecretHandshake
  COMMANDS = ['wink', 'double blink', 'close your eyes', 'jump'].freeze

  def initialize(number)
    @binary = number.is_a?(Integer) ? number.to_s(2) : []
  end

  def commands
    if @binary.length > 4 && @binary[-5] == '1'
      process_commands.reverse
    elsif !@binary.empty?
      process_commands
    else
      []
    end
  end

  def process_commands
    binary = @binary.split('')
    COMMANDS.select { binary.pop == '1' }
  end
end
