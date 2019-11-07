require "active_support/all"
require 'time'

time_zone = 'Asia/Shanghai'
now = Time.parse("2019-09-11 18:58:42 +0000")
puts now

res = Time.use_zone(time_zone) do
  puts now
  puts now.in_time_zone("Asia/Shanghai")
  now = now.in_time_zone("Asia/Shanghai")
  puts now + 86400
  puts Time.zone.parse("02:00", now + 86400)
end

def parse_duration
  sku_attrs = Hash[ 'trial_class' => "7d"]
  duration = {"d" => :days, "m" => :months, "y" => :years}
  puts sku_attrs["trial_class"]
  sku_attrs["trial_class"][0..-1].to_f.method(duration[sku_attrs["trial_class"][-1]]).call
end

puts parse_duration
