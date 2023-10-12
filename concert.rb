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


  # 1   Create a method with Concert/ Livesream/ Festival
  # 2   Create 2 test to check if is's vallid or invalid
  # 3    Create start_date method 
  #  


  def type
    @type
  end

  def type_is_valid
    return VALID_TYPES.include?(@type)
  end
  
  def headliners
    if @type == 'concert' || @type == 'livestream'
      return @artists[0]
    elsif @type == 'festival'
      return @artists
    end
  end

  


end






