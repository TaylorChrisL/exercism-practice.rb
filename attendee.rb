class Attendee
  attr_reader :height, :pass_id

  def initialize(height)
    @height = height
    @pass_id = nil
  end

  def issue_pass!(pass_id)
    @pass_id = pass_id
  end

  def revoke_pass!()
    @pass_id = nil
  end

  def has_pass?()
    pass_id ? true : false
  end

  def fits_ride?(required_height)
    height > required_height ? true : false
  end

  def allowed_to_ride?(required_height)
    fits_ride?(required_height) && has_pass?() ? true : false
  end
end

attendee = Attendee.new(106)
p attendee.height
p attendee.pass_id
attendee.issue_pass!(42)
p attendee.pass_id
p attendee.has_pass?
attendee.revoke_pass!
p attendee.pass_id
p attendee.has_pass?
p attendee.fits_ride?(100)
p attendee.fits_ride?(110)
p attendee.allowed_to_ride?(100)
attendee.issue_pass!(42)
p attendee.allowed_to_ride?(100)
p attendee.allowed_to_ride?(110)
