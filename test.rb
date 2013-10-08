about = <<'ABOUT'

This Ruby example shows how you check whether a file exists,
and how you open a file for write and write to it.

You'll also see an interesting use of a function which returns
multiple values in a comma separated list, and you'll see how
they're collected by the calling program.

ABOUT

def addvat(incoming,factor = nil)
    if ! factor
        factor = 1.15
    end
    return incoming * factor, factor
end
price = 600

if File.exist?("log.txt")
    puts "Sorry - I would be overwriting a file"
else
    fyle = File.open("log.txt","w")
    ask,rate = addvat(price)
    fyle.write "#{price} #{ask} #{rate}\n"
    fyle.close
end

__END__
path = "mgsys@krwhite_web%s:/home/mgsys/sg-gcard-kr/"
command = "scp %s %s"
the_count = [2, 3, 4, 5, 6, 7, 8]
text = File.open("in_file").read
text.each_line do |src|
    src = src.chomp
    for i in the_count
        dst = path % i + src
        puts command % [src, dst]
    end
    puts "\n"
end

#for i in the_count
#    dst = path % i + src
#    puts dst
#end
#b = a + 'ed'
#puts b
