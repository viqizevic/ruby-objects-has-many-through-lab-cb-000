class Patient

  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def new_appointment(doctor, date)
    Appointment.new(date, doctor, self)
  end

  def self.all
    @@all
  end

  def appointments
    Appointment.all.select { |a| a.patient == self }
  end

  def doctors
    appointments.map { |a| a.doctor }.uniq
  end

end
