ln -s molecules.dat fort.2
ln -s continua.dat fort.17
./xnfpelsyn.exe<ap04t4970g46k1at12.mod>xnfpelsyn.out       
mv fort.10 xnft4970g46k1at12.dat
rm fort.*
./synbeg.exe<<EOF>synbeg.out
AIR       250.0    1050.0     100000.   0.     0          10 .001         0   00
AIRorVAC  WLBEG     WLEND     RESOLU    TURBV  IFNLTE LINOUT CUTOFF        NREAD
EOF
ln -s gf0300.100 fort.11
./rgfalllinesnew.exe>gf0300.out
rm fort.11
ln -s gf0400.100 fort.11
./rgfalllinesnew.exe>gf0400.out
rm fort.11
ln -s gf0500.100 fort.11
./rgfalllinesnew.exe>gf0500.out
rm fort.11
ln -s gf0600.100 fort.11
./rgfalllinesnew.exe>gf0600.out
rm fort.11
ln -s gf0800.100 fort.11
./rgfalllinesnew.exe>gf0800.out
rm fort.11
ln -s chmasseron.asc fort.11
./rmolecasc.exe>chmasseron.out
rm fort.11
ln -s mgh.asc fort.11
./rmolecasc.exe>mgh.out
rm fort.11
ln -s nh.asc fort.11
./rmolecasc.exe>nh.out
rm fort.11
ln -s ohupdate.asc fort.11
./rmolecasc.exe>oh.out
rm fort.11
ln -s sihax.asc fort.11
./rmolecasc.exe>sihax.out
rm fort.11
ln -s h2.asc fort.11
./rmolecasc.exe>h2.out
rm fort.11
ln -s h2xx.asc fort.11
./rmolecasc.exe>h2xx.out
rm fort.11
ln -s hdxx.asc fort.11
./rmolecasc.exe>hdxx.out
rm fort.11
ln -s c2ax.asc fort.11
./rmolecasc.exe>c2ax.out
rm fort.11
ln -s c2ba.asc fort.11
./rmolecasc.exe>c2ba.out
rm fort.11
ln -s c2dabrookek.asc fort.11
./rmolecasc.exe>c2da.out
rm fort.11
ln -s c2ea.asc fort.11
./rmolecasc.exe>c2ea.out
rm fort.11
ln -s cnaxbrookek.asc fort.11
./rmolecasc.exe>cnax.out
rm fort.11
ln -s cnbxbrookek.asc fort.11
./rmolecasc.exe>cnbx.out
rm fort.11
ln -s cnxx12brooke.asc fort.11
./rmolecasc.exe>cnxx12.out
rm fort.11
ln -s coax.asc fort.11
./rmolecasc.exe>coax.out
rm fort.11
ln -s coxx.asc fort.11
./rmolecasc.exe>coxx.out
rm fort.11
ln -s sioax.asc fort.11
./rmolecasc.exe>sioax.out
rm fort.11
ln -s sioex.asc fort.11
./rmolecasc.exe>sioex.out
rm fort.11
ln -s sioxx.asc fort.11
./rmolecasc.exe>sioxx.out
rm fort.11
ln -s tioschwenke.bin fort.11
ln -s eschwenke.bin fort.48
./rschwenk.exe>rschwenk.out
rm fort.11
rm fort.48
ln -s h2ofastfix.bin fort.11
./rh2ofast.exe>h2ofastfix.out
rm fort.11
ln -s xnft4970g46k1at12.dat fort.10
ln -s he1tables.dat fort.18
./synthe.exe>synthe.out
ln -s molecules.dat fort.2
cat<<EOF>fort.25
0.0       0.        1.        0.        0.        0.        0.        0.
0.
RHOXJ     R1        R101      PH1       PC1       PSI1      PRDDOP    PRDPOW
EOF
./spectrv.exe<ap04t4970g46k1at12.mod>spectrv.out
mv fort.7 i7000-7210.dat
ln -s i7000-7210.dat fort.1
./rotate.exe<<"EOF">rotate.out
3
0.	20.	100.
EOF
mv ROT1 f7000-7210vr2.dat
ln -s f7000-7210vr2.dat fort.21
./broaden.exe<<"EOF">broaden.out
GAUSSIAN  48000.    RESOLUTION
EOF
mv fort.22 f7000-7210vr2br48000ap04t4970g46k1at12.bin
rm fort.*
ln -s f7000-7210vr2br48000ap04t4970g46k1at12.bin fort.1
./converfsynnmtoa.exe
mv fort.2 f2500-10500Resoln100000ap04t4970g46k1at12Gaus48000.asc
rm fort.*
