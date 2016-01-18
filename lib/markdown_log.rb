class MarkdownLog
  # Title
  def self.h1(text)
    puts "\n#{text}\n#{'=' * text.length}\n"
  end

  def self.h2(text)
    puts "\n#{text}\n#{'-' * text.length}\n"
  end

  def self.h3(text)
    puts "\n### #{text}\n"
  end

  # Paragraph
  def self.p(text)
    puts "\n#{text}\n"
  end

  # Quote
  def self.quote(text)
    puts "\n > #{text}\n"
  end

  # Normal code
  def self.code(obj = nil, &block)
    puts "\n```"
    if block_given?
      yield
    elsif !obj.nil?
      puts obj
    else
      raise ArgumentError, 'need printable object or block'
    end
    puts "```\n"
  end

  # Suppress exception
  # TODO: Make it better :-/
  def self.code_with_rescue(err = RuntimeError)
    puts "\n```"
    begin
      yield
    rescue err
    end
    puts "```\n"
  end

  # Print object
  def self.print(obj = nil, &block)
    puts "\n```"
    if block_given?
      ::AwesomePrint.awesome_print yield
    elsif !obj.nil?
      ::AwesomePrint.awesome_print obj
    else
      raise ArgumentError, 'need printable object or block'
    end
    puts "```\n"
  end

end
