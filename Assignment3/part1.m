%Load images
Ia = imread('data/DSCF4177.jpg');
Ia = single(rgb2gray(Ia));

Ib = imread('data/DSCF4178.jpg');
Ib = single(rgb2gray(Ib));

Ic = imread('data/DSCF4179.jpg');
Ic = single(rgb2gray(Ic));

Id = imread('data/DSCF4180.jpg');
Id = single(rgb2gray(Id));

Ie = imread('data/DSCF4181.jpg');
Ie = single(rgb2gray(Ie));

If = imread('data/DSCF4182.jpg');
If = single(rgb2gray(If));

%Extract the SIFT features in all the images
[fa, da] = vl_sift(Ia);
[fb, db] = vl_sift(Ib);
[fc, dc] = vl_sift(Ic);
[fd, dd] = vl_sift(Id);
[fe, de] = vl_sift(Ie);
[ff, df] = vl_sift(If);

%find the matches between each pair of images
[matches1, scores1] = vl_ubcmatch(da, db);
[matches2, scores2] = vl_ubcmatch(dc, dd);
[matches3, scores3] = vl_ubcmatch(de, df);

%sort by score, remove score < 10000
sorted_matches1 = matches1(scores1 > 10000);
sorted_matches2 = matches2(scores2 > 10000);
sorted_matches3 = matches1(scores3 > 10000);

%use the mask
Maska = imread('data/DSCF4177Mask.jpg');
Maskb = imread('data/DSCF4178Mask.jpg');
Maskc = imread('data/DSCF4179Mask.jpg');
Maskd = imread('data/DSCF4180Mask.jpg');
Maske = imread('data/DSCF4181Mask.jpg');
Maskf = imread('data/DSCF4182Mask.jpg');

%Using the mask to remove SIFT features which are not on the object
[fa_prime, da_prime] = vl_sift(Ia.*single(Maska));
[fb_prime, db_prime] = vl_sift(Ia.*single(Maska));
[fc_prime, dc_prime] = vl_sift(Ia.*single(Maska));
[fd_prime, dd_prime] = vl_sift(Ia.*single(Maska));
[fe_prime, de_prime] = vl_sift(Ia.*single(Maska));
[ff_prime, df_prime] = vl_sift(Ia.*single(Maska));
