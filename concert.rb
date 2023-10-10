require "date"

class Concert

  VALID_TYPES = ['concert', 'festival', 'livestream']

  def initialize(artists,attendees,start_date, type)
    @artists   = artists
    @attendees = attendees
    @start_date = start_date
    @type = type
  end

  def valid?
    @artists.any?
  end

  def popularity
    if attendees > 1000
      'popular'
    elsif attendees > 500
      'medium'
    else
      'low'
    end
  end


end






