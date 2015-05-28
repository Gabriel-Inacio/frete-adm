# encoding: UTF-8
module DateHelper

	def self.valid_date?(str)
    !!(str=~ /[0-9]{4}-[0-9]{2}-[0-9]{2}/)
  end

  def self.str_to_date(date)
    Date.strptime(date,"%Y-%m-%d")
  end

  def self.str_to_date2(date)
    Date.strptime("10/15/2013", "%m/%d/%Y")
  end

  def self.format_date2(date)
   binding.pry
  end

  def self.format_date(date, format = "%d/%m/%Y")
    if date and date.class == String and !date.empty?
      self.format_date(Date.parse(date), format)
    else
  	  date.strftime(format) if date and date.class != String
    end
  end

  def self.format_date_time(datetime, format = "%d/%m/%Y - %H:%M:%S")
    if datetime and datetime.class == String and !datetime.empty?
      self.format_date_time(DateTime.parse(datetime), format)
    else
      datetime.strftime(format) if datetime and datetime.class != String
    end
  end

  def self.format_oas_date(date)
  	self.format_date date, "%Y-%m-%d"
  end

  def self.format_en_date(time)
    time.strftime("%Y-%m-%d")
  end

  def self.format_date_without_separator(date)
    date.strftime("%Y%m%d")
  end

  def self.date_overlaps?(start_date_period, end_date_period, date_compare)
    (start_date_period - date_compare) * (date_compare - end_date_period) >= 0
  end

  def self.dates_overlaps?(start_date_initial, end_date_initial, start_date_final, end_date_final)
    (start_date_initial - end_date_final) * (start_date_final - end_date_initial) >= 0
  end

  def self.date_to_string

  end

  def self.day_of_week(date)
    days = ["Domingo","Segunda-feira","Terça-feira","Quarta-feira","Quinta-feira","Sexta-feira","Sábado"]
    days[(date.wday)]
  end

end