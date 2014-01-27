class Rim
  attr_accessor :brand, :name, :erd, :osb, :etrto, :weight, :width, :height, :drillings

  def diplay_name
    "#{brand} #{name}"
  end
  
  def nipple_seat_radius
    erd.to_f / 2
  end
  
  def spoke_bed_offset
    LeftRight.new(-osb, osb)
  end
  
  def symmetrical?
    osb == 0
  end
end