ln -s molecules.dat fort.2
ln -s continua.dat fort.17
./xnfpelsyn.exe<ap00t5777g44377k1odfnew_solar_scaled_mod.mod>xnfpelsyn.out
mv fort.10 xnfcp00t5777g44377k1odfnew.dat
rm fort.*
./synbeg.exe<<EOF>synbeg.out
AIR       250.0     1050.0    500000.   0.     0         -10 .001         1   00
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
ln -s  chmasseron.asc fort.11
./rmolecasc.exe>chmasseron.out
rm fort.11
ln -s  mgh.asc fort.11
./rmolecasc.exe>mgh.out
rm fort.11
ln -s  nh.asc fort.11
./rmolecasc.exe>nh.out
rm fort.11
ln -s   ohupdate.asc fort.11
./rmolecasc.exe>oh.out
rm fort.11
ln -s   sihax.asc fort.11
./rmolecasc.exe>sihax.out
rm fort.11
ln -s  h2.asc fort.11
./rmolecasc.exe>h2.out
rm fort.11
ln -s  h2xx.asc fort.11
./rmolecasc.exe>h2xx.out
rm fort.11
ln -s  hdxx.asc fort.11
./rmolecasc.exe>hdxx.out
rm fort.11
ln -s c2ax.asc fort.11
./rmolecasc.exe>c2ax.out
rm fort.11
ln -s  c2ba.asc fort.11
./rmolecasc.exe>c2ba.out
rm fort.11
ln -s  c2dabrookek.asc fort.11
./rmolecasc.exe>c2da.out
rm fort.11
ln -s   c2ea.asc fort.11
./rmolecasc.exe>c2ea.out
rm fort.11
ln -s cnaxbrookek.asc fort.11
./rmolecasc.exe>cnax.out
rm fort.11
ln -s cnbxbrookek.asc fort.11
./rmolecasc.exe>cnbx.out
rm fort.11
ln -s  cnxx12brooke.asc fort.11
./rmolecasc.exe>cnxx12.out
rm fort.11
ln -s  coax.asc fort.11
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
ln -s xnfcp00t5777g44377k1odfnew.dat fort.10
ln -s he1tables.dat fort.18
./synthe.exe>synthe.out
ln -s molecules.dat fort.2
cat <<EOF>fort.25
0.0       0.        1.        0.        0.        0.        0.        0.
0.
RHOXJ     R1        R101      PH1       PC1       PSI1      PRDDOP    PRDPOW
EOF
./spectrv.exe<ap00t5777g44377k1odfnew_solar_scaled_mod.mod>spectrv.out
mv fort.7 k2500-10500.dat
ln -s k2500-10500.dat fort.1
./rotate.exe<<EOF>rotate.out
    1
0.
EOF
mv ROT1 f2500-10500vr0ap00t5777g44377k1odfnew_solar_scaled_mod.dat
rm fort.*
ln -s f2500-10500vr0ap00t5777g44377k1odfnew_solar_scaled_mod.dat fort.1
./fluxaverage1a_nmtoa.exe<<EOF>f2500-10500ap00t5777g44377k1odfnew_solar_scaled_mod.out
 250.0    1050.0
 250.0    250.1     250.05
EOF
mv fort.2 f2500-10500p00t5777g44377k1odfnew_solar_scaled_low_resoln.txt
rm fort.*
