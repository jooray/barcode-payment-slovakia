require 'shellwords'

class PostovyPoukazBarCode


def initialize(path_to_barcode="barcode")
	@path_to_barcode=path_to_barcode
end

def barcode(accountno, bankno, vs, ks, cents)
	servicecode = "3800"
	accountno = fill_with_zeroes(accountno, 16)
	bankno = fill_with_zeroes(bankno, 4)
	vs = fill_with_zeroes(vs, 10)
	ks = fill_with_zeroes(ks, 4)
	kod_spracovania = "0"
	cents = fill_with_zeroes(cents, 10)
	full_string="#{servicecode}#{accountno}#{bankno}#{vs}#{ks}#{kod_spracovania}#{cents}"
	full_string+bar_checksum(full_string).to_s
end

# for iphone screen use 70x35
def save_as_eps(code, filepath, dimensions="110x12")
	if /^[0-9]{50}$/.match(code)
		system("#{@path_to_barcode} -o #{Shellwords.escape(filepath)} -b #{Shellwords.escape(code)} -u mm -g #{Shellwords.escape(dimensions)} -n -e code128c -E")
	else
		false
	end
end


private

def bar_checksum(numbers)
	weight="7864235978642359786423597864235978642359786423597"
	sum=0
	weight.size.times do |i|
		sum += weight[i].to_i * numbers[i].to_i
	end

	res = 11-sum.modulo(11)
	if res == 10
		res = 0
	elsif res == 11
		res = 5
	end
	res
end


def fill_with_zeroes(what, length)
	"0"*(length-what.length) + what
end


end



