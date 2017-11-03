

-- recsepchar appears in help but is does not work in SQLcl
-- recsep does not appear in help and is not available in SQLcl

-- help not installed in SQLPlus

set echo on


help set

help set recsepchar

set recsepchar
set recsepchar "x"
set recsepchar 'x'
set recsepchar x

-- sqlplus only at this time

set recsep wrapped
set recsep each
set recsep off
set recsepchar ' '

set echo off




