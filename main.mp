beginfig(0);

numeric arrow_height, arrow_width;
numeric u, degree, degree_label, radius, penscale;
path line;
numeric l_half, l_one, l_five, l_ten;

pair p[];
path p_arrow;

u := 10mm;
radius := 12u;
penscale := 0.6;

% these are the lengths of outer-most lines
l_half := 1u;
l_one  := 2u;
l_five := 3.2u;
l_ten  := 2.3u;

arrow_height := 1.35u;
arrow_width  := 2u;
p_arrow := (0, 0) -- (arrow_width/2, arrow_width/2)
  -- (arrow_width/4, arrow_width/2) -- (arrow_width/4, arrow_height)
  -- (-arrow_width/4, arrow_height) -- (-arrow_width/4, arrow_width/2)
  -- (-arrow_width/2, arrow_width/2) --cycle;

draw p_arrow withpen pencircle scaled penscale;
label.top("ORIGIN", (0, arrow_height * 9 / 8));

for degree = 0 step 0.5 until 180:
  p2 := (radius, 0);
  if floor degree < degree:
    p1 := (radius - l_half, 0);
  elseif (degree == 180) or (degree == 0):
    p1 := (0, 0);
  elseif floor(degree / 10) == (degree / 10):
    p1 := (radius - l_ten, 0);
  elseif floor(degree / 5) == (degree / 5):
    p1 := (radius - l_five, 0);
  else:
    p1 := (radius - l_one, 0);
  fi

  line := (p1 -- p2) rotated degree;
  draw line withpen pencircle scaled penscale;
endfor

for degree = 0 step 10 until 180:
  degree_label := 180 - degree;
  p1 := (radius - l_ten, 0);
  if degree_label == 180:
    label.ulft((decimal degree_label) infont defaultfont rotated 360, p1) rotated degree;
  elseif degree_label == 0:
    label.llft((decimal degree_label) infont defaultfont rotated 180, p1) rotated degree;
  else:
    label.lft( (decimal degree_label) infont defaultfont rotated -90, p1) rotated degree;
  fi
endfor

for degree = 5 step 10 until 175:
  degree_label := 180 - degree;
  p1 := (radius - l_five, 0);
  label.lft((decimal degree_label) infont defaultfont rotated -90, p1) rotated degree;
endfor

endfig;
end
