numeric arrow_height, arrow_width;
numeric u, radius, penscale, inner_radius;
numeric angle_label_height[], angle_font_scale[];
numeric lone[], lfive[];

numeric degree, degree_value;
picture degree_label;
pair p[];
path p_arrow;

u := 10mm;
radius := 12u;
penscale := 0.6;

% angle labels
angle_font_scale[1] = 0.85;
angle_font_scale[2] = 0.8;
angle_label_height[1] = angle_font_scale[1] * 0.5u;
angle_label_height[2] = angle_font_scale[2] * 0.75u;

inner_radius := 2.2u;
lone[1]   := 2.5u;
lfive[1]  := 2.8u;
lfive[2]  := 3.4u;

arrow_height := 1.25u;
arrow_width  := 1.8u;

beginfig(0);
p_arrow := (0, 0) -- (arrow_width/2, arrow_width/2)
  -- (arrow_width/4, arrow_width/2) -- (arrow_width/4, arrow_height)
  -- (-arrow_width/4, arrow_height) -- (-arrow_width/4, arrow_width/2)
  -- (-arrow_width/2, arrow_width/2) --cycle;

draw p_arrow withpen pencircle scaled penscale;
label.top("\Cap Align Here" infont defaultfont scaled 0.8, (0, arrow_height * 9 / 8));

for degree = 0 step 1 until 180:
  p2 := (radius, 0);
  if (degree == 180) or (degree == 0):
    p1 := origin;
  elseif floor(degree / 5) == (degree / 5):
    p1 := p2 - (lfive[1], 0);
  else:
    p1 := p2 - (lone[1], 0);
  fi
  draw (p1 -- p2) rotated degree withpen pencircle scaled penscale;
endfor

for degree = 2.5 step 2.5 until 177.5:
  p2 := (radius - lfive[1] - angle_label_height[1], 0); 
  p1 := p2 - (lfive[2], 0);
  if degree == 90:
    p1 := (inner_radius, 0);
  elseif floor(degree / 5) == (degree / 5):
    p1 := p2 - (lfive[2], 0);
  else:
    p1 := p1 + (0.2u, 0);
    p2 := p2 - (0.2u, 0); 
  fi
  draw (p1 -- p2) rotated degree withpen pencircle scaled penscale;
endfor

for degree = 5 step 5 until 175:
  p2 := (radius - lfive[1] - lfive[2] - angle_label_height[1] - angle_label_height[2], 0);
  p1 := (inner_radius, 0);
  if (degree <> 90):
    draw (p1 -- p2) rotated degree withpen pencircle scaled penscale;
  fi
endfor

for degree = 0 step 5 until 180:
  degree_value := 180 - degree;
  degree_label := ("$" & (decimal degree_value) & "^\circ$") infont defaultfont;
  p1 := (radius - lfive[1], 0);
  if degree_value == 180:
    label.ulft(degree_label scaled angle_font_scale[1] rotated 360, p1) rotated degree shifted (0.15u, 0);
  elseif degree_value == 0:
    label.llft(degree_label scaled angle_font_scale[1] rotated 180, p1) rotated degree;
  else:
    label.lft( degree_label scaled angle_font_scale[1] rotated -90, p1) rotated degree;
  fi
endfor

for degree = 5 step 5 until 175:
  degree_value := abs (90 - degree);
  degree_label := ("$" & (decimal degree_value) & "^\circ$") infont defaultfont;
  p1 := (radius - lfive[1] - lfive[2] - angle_label_height[1], 0);
  if degree > 90 :
    label.lft(degree_label scaled angle_font_scale[2] rotated 180, p1) rotated degree;
  elseif degree < 90:
    label.lft(degree_label scaled angle_font_scale[2] rotated 360, p1) rotated degree;
  fi
endfor

endfig;
end
