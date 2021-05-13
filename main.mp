beginfig(0);

numeric u;
numeric degree;
path p;

u := 10mm;
z0 = (0, 0);
z1 = (2u, 0);
z2 = (10u, 0);



for degree = 0 step 5 until 180:
  p := (z1 -- z2) rotatedaround(z0, degree);

  draw p withpen pencircle scaled 1;

endfor


endfig;
end;
