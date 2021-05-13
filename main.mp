beginfig(0);

numeric u, degree, radius, d;
path line;
numeric l_half, l_one, l_five, l_ten;

pair p[];

u := 10mm;
radius := 12u;

% these are the lengths of outer-most lines
l_half := 1u;
l_one  := 2u;
l_five := 3u;
l_ten  := 2.3u;

for degree = 0.5 step 0.5 until 179.5:
  if floor degree < degree:
    d := l_half;
  elseif floor(degree / 10) == (degree / 10):
    d := l_ten;
  elseif floor(degree / 5) == (degree / 5):
    d := l_five;
  else:
    d := l_one;
  fi

  p1 := (radius - d, 0);
  p2 := (radius, 0);
  line := (p1 -- p2) rotated degree;

  draw line withpen pencircle scaled 0.5;

endfor


endfig;
end;
