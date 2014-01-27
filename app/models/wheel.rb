class Wheel
  attr_accessor :hub, :rim, :spokes, :crosses
  
  def initialize(params = {})
    params.each { |k,v| public_send(:"#{k}=", v) if respond_to?(:"#{k}=") } if params
  end
  
  def spoke_length
    LeftRight.new(spoke_length_for(:left), spoke_length_for(:right)) if valid?
  end
    
  def spoke_anchor_angle
    Math.cos(Math::PI * 4 * crosses / spokes)
  end
  
  def symmetrical?
    hub.symmetrical? && rim.symmetrical?
  end
  
  def spokehole_drillings
    hub.drillings & rim.drillings
  end
  
  def valid?
    rim.present? && hub.present? && spokehole_drillings.include?(spokes)
  end
  
  # def weight
  #   hub.weight + rim.weight + spokes_weight
  # end

  private
  def spoke_length_for(side)
    # http://web.archive.org/web/20080728140917/http://www.geocities.com/spokeanwheel/trig.htm
    # https://en.wikipedia.org/wiki/Spoke#Spoke_length
    # http://www.merih-bike.de/66001.html#top
    
    a = hub.flange_offset_from_center[side] - rim.spoke_bed_offset[side]
    b = hub.flange_spokehole_circle_radius[side]
    c = rim.nipple_seat_radius
    Math.sqrt(a**2 + b**2 + c**2 - 2 * b * c * spoke_anchor_angle) - hub.spokehole_radius
  end
end