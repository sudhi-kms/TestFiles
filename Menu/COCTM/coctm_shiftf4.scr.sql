<--start
trace on

sv_a=CINT(INTBAF.INTBAFC.TbafEventStep)

if (sv_a==0) then
    GOTO STEP0
endif

STEP0:

    sv_a = urhk_TBAF_InquireFieldValue("listblk.sel_field")
    CUST.LIMIT.selValue = MID$(B2KTEMP.TEMPSTD.TBAFRESULT,0,170)

exitscript

trace off
end-->
