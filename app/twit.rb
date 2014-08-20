class Twit
  attr_reader :client, :username

  def initialize(config)
    @client = Twitter::REST::Client.new(config)
  end

  def run
    loop do
      display_welcome_message

      case command
      when '1'
        @username = ask('Enter username: ')
        load_tweets
      when '0'
        end_program
      else
        puts 'Invalid command'
      end
    end
  end

  private

  def command
    gets.chomp[0]
  end

  def load_tweets
    header_of_results

    client.search("to:#{username}").take(15).each do |tweet|
      puts tweet.text
    end

    footer_of_results
  end

  def header_of_results
    puts ''
    say("--- Loading mentioned tweets for user #{username}.. ---")
  end

  def footer_of_results
    say('--- end of results ---')
    puts ''
  end

  def display_welcome_message
    say('Please select one of the following options:')
    say('1 - to display tweets for mentioned username')
    say('0 - to close the application')
    ('> ').display
  end

  def end_program
    puts 'Closing application..'
    exit 1
  end
end
