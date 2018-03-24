pen_types = ["fountain", "gel", "rollerball", "ballpoint", "felt tip", "brush"]

pen_types.each {|t| PenType.create(name: t)}
