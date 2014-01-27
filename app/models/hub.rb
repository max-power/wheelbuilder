class Hub
  attr_accessor :brand, :name, :rear, :disc, :s, :dl, :dr, :wl, :wr, :old, :drillings, :weight
  
  def display_name
    "#{brand} #{name}, #{rear? ? 'rear' : 'front'}"
  end
  
  def front?
    !rear?
  end
  
  def rear?
    !!rear
  end
  
  def disc?
    !!disc
  end
  
  def symmetrical?
    wl == wr && dl == dr
  end
  
  def flange_offset_from_center
    LeftRight.new(wl.to_f, wr.to_f)
  end
  
  def flange_spokehole_circle_radius
    LeftRight.new(dl.to_f/2, dr.to_f/2)
  end
  
  def spokehole_radius
    s.to_f / 2
  end
end