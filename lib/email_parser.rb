require 'pry'

class EmailAddressParser
  def initialize(emails)
    @emails = emails
  end

  attr_accessor :emails

  def parse
    split_by_space = emails.split(' ')
    split_by_comma = emails.split(',')
    cleaned_up_comma_list = []
    split_by_comma.each do |given_email|
      cleaned = given_email.split(' ')
      cleaned_up_comma_list.push(cleaned)
    end
    all_emails = split_by_space + cleaned_up_comma_list
    flattened = all_emails.flatten
    clean_emails = []
    flattened.each do |given_email|
      if given_email[-1] == ','
        no_comma = given_email.delete(',')
        clean_emails.push(no_comma)
      elsif given_email[0] == ' '
        no_space.delete(' ')
        clean_emails.push(no_space)
      else
        clean_emails.push(given_email)
      end
    end
    no_dupes = clean_emails.uniq
    no_dupes
  end
end

parser =
  EmailAddressParser.new(
    'wschierenbeck@gmail.com, wes.schierenbeck@gmail.com wes@wschierenbeck.com admin@myrankedchoice.com, meilingluvgreendot@gmail.com',
  )

parser.parse
