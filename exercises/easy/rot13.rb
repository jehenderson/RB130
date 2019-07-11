# replaces a letter with the 13th letter after it

name_string = "Nqn Ybirynpr
Tenpr Ubccre
Nqryr Tbyqfgvar
Nyna Ghevat
Puneyrf Onoontr
Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv
Wbua Ngnanfbss
Ybvf Unvog
Pynhqr Funaaba
Fgrir Wbof
Ovyy Tngrf
Gvz Orearef-Yrr
Fgrir Jbmavnx
Xbaenq Mhfr
Fve Nagbal Ubner
Zneiva Zvafxl
Lhxvuveb Zngfhzbgb
Unllvz Fybavzfxv
Tregehqr Oynapu"

names = name_string.split("\n")
alphabet = Array.new
("a".."z").each { |letter| alphabet << letter }

secret_names = names.map do |name|
  deciphered_chars = Array.new
  name.chars.each do |char|
    if alphabet.include?(char.downcase)
      index = alphabet.find_index(char.downcase)
      index += 13
      index -= alphabet.size if index >= alphabet.size
      deciphered_chars << alphabet[index]
      next
    end
    # handle edge cases for spaces or special characters (i.e. do not cipher, leave as is)
    deciphered_chars << char
  end
  deciphered_name = deciphered_chars.join
  # handle proper name capitalization
  deciphered_name.split.each { |lower_case_name| lower_case_name.capitalize! }.join(' ')
end

puts secret_names