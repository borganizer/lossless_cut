DIR=/usr/share/lossless_cut

[ -d "$DIR" ] && rm -rf $DIR
mkdir -p $DIR

for f in \
  keyframe_adjust.* \
  LICENSE \
  ll_report.* \
  lossless_cut.* \
  README.md
  do
    cp $f $DIR
  done

for d in \
  importcode \
  subtitle
  do
    cp -r $d $DIR
  done

chmod +rx $DIR/subtitle/ccextractor32bit
chmod +rx $DIR/subtitle/ccextractor64bit

cp lossless_cut /usr/bin/lossless_cut && chmod +rx /usr/bin/lossless_cut
