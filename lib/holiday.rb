require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  holiday_hash.each do |season, holiday|
    if season == :winter
      holiday.each do |holiday, supplies|
        supplies << supply
      end
    end
  end
end
 

def add_supply_to_memorial_day(holiday_hash, supply)
  holiday_hash.each do |season, holiday|
    if season == :spring
      holiday.each do |holiday, supplies|
        supplies << supply
      end
    end
  end
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  holiday_hash[season]={holiday_name => supply_array}
  puts holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  all_winter_holiday_supplies_array = []
  holiday_hash.each do |season, holiday|
    if season == :winter
      holiday.each do |holiday, supplies|
        all_winter_holiday_supplies_array << supplies
      end
    end
  end
  all_winter_holiday_supplies_array.flatten
end


def all_supplies_in_holidays(holiday_hash)
  holiday_hash.each do |season, holiday|
    season = "#{season.to_s.capitalize}:" #convert the season symbol to a string
    puts season #print the season string
    holiday.each do |holiday, supplies|
      holidayString = holiday.to_s.capitalize #for each holiday, convert it to a string and capitalize it
      holidayString2 = holidayString.split("_").map(&:capitalize).join(" ") 
      holidayString2 = "  #{holidayString2}: " #add the string to a new string
      supplies.each do |supply|
        holidayString2 << "#{supply}, " #for each supply, add it to a string
      end
      puts holidayString2.chomp(", ") #remove the extra comma and space at the end of the holiday supply string
    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  holidays_with_bbq = []
    holiday_hash.each do |season, holiday|
        holiday.each do |holiday, supplies|
          if supplies.include?("BBQ")
            holidaySym = holiday.to_sym #convert to symbol
            holidays_with_bbq<< holidaySym #add to array
          end
        end
      end
    holidays_with_bbq
end






