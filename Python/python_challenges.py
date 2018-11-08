# -*- coding: utf-8 -*-
"""
Created on Thu Nov  8 22:25:22 2018

@author: piotr
"""

#Challenge 1
print(2**38)

#Challenge 2

from string import ascii_lowercase as letters
string = "g fmnc wms bgblr rpylqjyrc gr zw fylb. rfyrq ufyr amknsrcpq ypc dmp. bmgle gr gl zw fylb gq glcddgagclr ylb rfyr'q ufw rfgq rcvr gq qm jmle. sqgle qrpgle.kyicrpylq() gq pcamkkclbcb. lmu ynnjw ml rfc spj."

new_string = ""
for l in string:
    if l in letters:
        new_string=new_string+letters[(letters.index(l)+2)%len(letters)]
    else:
        new_string+=l

print(new_string)

## Recomended:
''' 
Recomended solution is :string.maketrans()
'''

#Example:

from string import maketrans   # Required to call maketrans function.

intab = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
outtab = "CDEFGHIJKLMNOPQRSTUVWXYZAB"

intab = intab.lower()
outtab = outtab.lower()

trantab = str.maketrans(intab, outtab)

str = "g fmnc wms bgblr rpylqjyrc gr zw fylb. rfyrq ufyr amknsrcpq ypc dmp. bmgle gr gl zw fylb gq glcddgagclr ylb rfyr'q ufw rfgq rcvr gq qm jmle. sqgle qrpgle.kyicrpylq() gq pcamkkclbcb. lmu ynnjw ml rfc spj."
print(str.translate(trantab))
