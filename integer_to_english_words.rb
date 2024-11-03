# @param {Integer} num
# @return {String}
def number_to_words(num)
  raise "Not expected" if num > 2_147_483_647 || num < 0
  return 'Zero' if num == 0

  number_words = {
    1 => 'One',
    2 => 'Two',
    3 => 'Three',
    4 => 'Four',
    5 => 'Five',
    6 => 'Six',
    7 => 'Seven',
    8 => 'Eight',
    9 => 'Nine',
    10 => 'Ten',
    11 => 'Eleven',
    12 => 'Twelve',
    13 => 'Thirteen',
    14 => 'Fourteen',
    15 => 'Fifteen',
    16 => 'Sixteen',
    17 => 'Seventeen',
    18 => 'Eighteen',
    19 => 'Nineteen'
  }

  tens_words = {
    2 => 'Twenty',
    3 => 'Thirty',
    4 => 'Forty',
    5 => 'Fifty',
    6 => 'Sixty',
    7 => 'Seventy',
    8 => 'Eighty',
    9 => 'Ninety',
  }

  octet_words = {
    3 => 'Billion',
    2 => 'Million',
    1 => 'Thousand'
  }

  result = []

  octets = (Math.log(num, 10).round(10) / 3).floor

  (octets.downto 0).each do |octet|
    pr_octet_thousand = 1_000 ** octet
    octet_thousand = 1_000 ** (octet + 1)
    octet_num = num % octet_thousand / pr_octet_thousand
    hundreds_num = octet_num / 100

    if hundreds_num > 0
      result << number_words.fetch(hundreds_num)
      result << "Hundred"
    end

    tens_num = octet_num % 100

    if tens_num > 0 && tens_num < 20
      result << number_words.fetch(tens_num)
    elsif tens_num >= 20 && tens_num <= 99
      tens = tens_num / 10
      single_num = tens_num % 10
      result << tens_words.fetch(tens)
      result << number_words.fetch(single_num) if number_words.has_key?(single_num)
    end

    if octet_num > 0 && octet_words.has_key?(octet)
      result << octet_words.fetch(octet)
    end
  end

  result.join(' ')
end
