#!/bin/bash
skip=49

tab='   '
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | /*/) ;;
  /*) TMPDIR=$TMPDIR/;;
  *) TMPDIR=/tmp/;;
esac
if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -d "${TMPDIR}gztmpXXXXXXXXX"`
else
  gztmpdir=${TMPDIR}gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
��aaworkshop.sh�X]o�0}��U�
H@JՖn}�"�Z[��Z��iJ�K"LšPi?~���4�e�E<$���9��\�OƳ��s¶CA7��W8�]���:
�5���r_�'4�-
            ~}E��=�J;x��<k����p�R咜�x�2����(�\BHs_Z-h�.��
���ނ$TH/��3����r.�@#Ki�����-��֞��C���w*O�m�
Xnt跌'�U�z̫?�U��h��� t\��f=�L�o9{[sV���b�
{5X���v,m�N������6�B~1
���
 ��<{��N
        ��>     :�l+��Q��&giՄ��
&�B�-�Y9�]�,�������9�O���#yG�".�()g�,�%t�K�A�L
|w�V��Z���b�fk�Ϣ\�E��eO█�jSNfT�TXT�ǥ����Q���*AU�TK9+Vg;@;.���"��"yR*��H�nk��0����[�F���F�-
���DD��[ea�H��Ѕ`��ʚ��l:�#`9AرZ�K������p����u�78�Y�x�Kh� 5��     ]
                                                                 �'��btc��/��3x���5�SV!z�h�znr��i������Յ9ԝ0�'z���W�7�.�j�퓴��6+9_�������y<ʫE�  ���R�%#w[|�Vڰ��0u�'8���g�
                                                                 �^r�CI�y��U