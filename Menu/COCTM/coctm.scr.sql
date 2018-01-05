<--start
trace on

#======================================================================
# Creating base variables, classes etc
#======================================================================

    IF (REPEXISTS("STDWFS") == 0) THEN
    #{
            CREATEREP("STDWFS")
    #}
    ENDIF

    IF (CLASSEXISTS("STDWFS", "LIMIT")) THEN
    #{
            DELETECLASS("STDWFS", "LIMIT")
    #}
    ENDIF

    CREATECLASS("STDWFS", "LIMIT",5)

    IF (REPEXISTS("CUST") == 0) THEN
    #{
            CREATEREP("CUST")
    #}
    ENDIF

    IF (CLASSEXISTS("CUST", "CCOD")== 0) THEN
    #{
            CREATECLASS("CUST", "CCOD",5)
    #}
    ENDIF
    STDWFS.LIMIT.BODDATE=left$(BANCS.STDIN.BODDate,10)
    print(STDWFS.LIMIT.BODDATE)

    sv_r = urhk_b2k_printrepos("BANCS")

    STDWFS.LIMIT.solid = BANCS.STDIN.mySolId
    print(STDWFS.LIMIT.solid)

    STDWFS.LIMIT.userid = BANCS.STDIN.userId
    print(STDWFS.LIMIT.userid)

    STDWFS.LIMIT.roleid = BANCS.STDIN.roleId
    print(STDWFS.LIMIT.roleid)

    STDWFS.LIMIT.proceedflg = "N"

    sv_b = CINT(STDWFS.WFSINPUT.NextStep)

    IF ( sv_b == 0 ) THEN
    #{
            GOTO STEP0
    #}
    ENDIF

    IF ( sv_b == 1 ) THEN
    #{
            GOTO STEP1
    #}
    ENDIF

    IF ( sv_b == 2 ) THEN
    #{
            GOTO STEP2
    #}
    ENDIF

    STDWFS.LIMIT.BODDATE=left$(BANCS.STDIN.BODDate,10)
    print(STDWFS.LIMIT.BODDATE)

STEP0:

#======================================================================
# Set Field Description, Data Length, Default Values
#======================================================================

    STDWFS.LIMIT.WorkFlowDesc = "COC TRAN"
    STDWFS.WFSINPARAMVAL.FormTitle= "TM of CO Accounts"

    STDWFS.WFSINPARAMVAL.Mode = "Mode"
    STDWFS.WFSINPARAMLEN.Mode = "1"
    STDWFS.WFSOUTPARAM.Mode ="A"

    STDWFS.WFSINPARAMVAL.RefNo = "Reference No"
    STDWFS.WFSINPARAMLEN.RefNo = "20"
    STDWFS.WFSOUTPARAM.RefNo =""
    
    STDWFS.WFSINPARAMVAL.AccountNumber1 = "CO Account 1"
    STDWFS.WFSINPARAMLEN.AccountNumber1 = "16"
    STDWFS.WFSOUTPARAM.AccountNumber1 =""
    
    STDWFS.WFSINPARAMVAL.AccountName = "CO Account1 Name"
    STDWFS.WFSINPARAMLEN.AccountName = "70"
    STDWFS.WFSOUTPARAM.AccountName =""
    
    STDWFS.WFSINPARAMVAL.CreditAmount1 = "Credit Amount 1"
    STDWFS.WFSINPARAMLEN.CreditAmount1 = "15"
    STDWFS.WFSOUTPARAM.CreditAmount1 =""
    
    STDWFS.WFSINPARAMVAL.GSTAmount1 = "GSTAmount 1"
    STDWFS.WFSINPARAMLEN.GSTAmount1 = "15"
    STDWFS.WFSOUTPARAM.GSTAmount1 =""
    
    STDWFS.WFSINPARAMVAL.AccountNumber2 = "CO Account 2"
    STDWFS.WFSINPARAMLEN.AccountNumber2 = "16"
    STDWFS.WFSOUTPARAM.AccountNumber2 ="NR"
    
    STDWFS.WFSINPARAMVAL.AccountName2 = "CO Account2 Name"
    STDWFS.WFSINPARAMLEN.AccountName2 = "70"
    STDWFS.WFSOUTPARAM.AccountName2 =""
    
    STDWFS.WFSINPARAMVAL.CreditAmount2 = "Credit Amount 2"
    STDWFS.WFSINPARAMLEN.CreditAmount2 = "15"
    STDWFS.WFSOUTPARAM.CreditAmount2 =""
    
    STDWFS.WFSINPARAMVAL.GSTAmount2 = "GSTAmount 2"
    STDWFS.WFSINPARAMLEN.GSTAmount2 = "15"
    STDWFS.WFSOUTPARAM.GSTAmount2 =""
    
    STDWFS.WFSINPARAMVAL.AccountNumber3 = "CO Account 3"
    STDWFS.WFSINPARAMLEN.AccountNumber3 = "16"
    STDWFS.WFSOUTPARAM.AccountNumber3 ="NR"
    
    STDWFS.WFSINPARAMVAL.AccountName3 = "CO Account3 Name"
    STDWFS.WFSINPARAMLEN.AccountName3 = "70"
    STDWFS.WFSOUTPARAM.AccountName3 =""
    
    STDWFS.WFSINPARAMVAL.CreditAmount3 = "Credit Amount 3"
    STDWFS.WFSINPARAMLEN.CreditAmount3 = "15"
    STDWFS.WFSOUTPARAM.CreditAmount3 =""
    
    STDWFS.WFSINPARAMVAL.GSTAmount3 = "GSTAmount 3"
    STDWFS.WFSINPARAMLEN.GSTAmount3 = "15"
    STDWFS.WFSOUTPARAM.GSTAmount3 =""
    
    STDWFS.WFSINPARAMVAL.Remarks = "Remarks"
    STDWFS.WFSINPARAMLEN.Remarks = "30"
    STDWFS.WFSOUTPARAM.Remarks =""
    
    STDWFS.WFSINPARAMVAL.A1 = "."
    STDWFS.WFSINPARAMLEN.A1 = "1"
    STDWFS.WFSOUTPARAM.A1 =""
    
    STDWFS.WFSINPARAMVAL.A2 = "."
    STDWFS.WFSINPARAMLEN.A2 = "1"
    STDWFS.WFSOUTPARAM.A2 =""
    
    STDWFS.WFSINPARAMVAL.TranType = "TranType"
    STDWFS.WFSINPARAMLEN.TranType = "10"
    STDWFS.WFSOUTPARAM.TranType =""
    
    STDWFS.WFSINPARAMVAL.DebitAcno = "Debit A/c"
    STDWFS.WFSLIST.DebitAcno = ("ACCT_MAST_LIST")
    STDWFS.WFSINPARAMLEN.DebitAcno = "16"
    STDWFS.WFSOUTPARAM.DebitAcno ="NA"
    
    STDWFS.WFSINPARAMVAL.DebitAmount = "Debit Amount"
    
    STDWFS.WFSINPARAMLEN.DebitAmount = "15"
    STDWFS.WFSOUTPARAM.DebitAmount =""
    
    STDWFS.WFSINPARAMVAL.NameOfParty = "Name Of Party"
    STDWFS.WFSINPARAMLEN.NameOfParty = "70"
    STDWFS.WFSOUTPARAM.NameOfParty =""
    
    STDWFS.WFSINPARAMVAL.Address = "Address"
    STDWFS.WFSINPARAMLEN.Address = "70"
    STDWFS.WFSOUTPARAM.Address =""
    
    STDWFS.WFSINPARAMVAL.PAN = "PAN"
    STDWFS.WFSINPARAMLEN.PAN = "70"
    STDWFS.WFSOUTPARAM.PAN =""
    
    STDWFS.WFSINPARAMVAL.GSTN = "GSTN"
    STDWFS.WFSINPARAMLEN.GSTN = "70"
    STDWFS.WFSOUTPARAM.GSTN =""
    
    STDWFS.WFSINPARAMVAL.MobileNumber = "Mobile Number"
    STDWFS.WFSINPARAMLEN.MobileNumber = "70"
    STDWFS.WFSOUTPARAM.MobileNumber =""
    
    STDWFS.WFSINPARAMVAL.IGST = "IGST Applicable"
    STDWFS.WFSINPARAMLEN.IGST = "1"
    STDWFS.WFSOUTPARAM.IGST ="N"

    STDWFS.WFSINPARAMVAL.ChkFlg = "Submit(Y/N)"
    STDWFS.WFSINPARAMLEN.ChkFlg = "1"
    STDWFS.WFSOUTPARAM.ChkFlg ="C"

#======================================================================
# Validations
#======================================================================
    
STDWFS.LIMIT.errCode="Y"
STDWFS.LIMIT.modchk="Y"
STDWFS.LIMIT.CRAcName=""

WHILE (STDWFS.LIMIT.errCode =="Y")
#{

    #======================================================================
    # Hide unwanted fields
    #======================================================================
        sv_a = urhk_TBAF_SetAttrib("bafi2020.datablk.field_4|P")
        sv_a = urhk_TBAF_SetAttrib("bafi2020.datablk.field_6|P")
        sv_a = urhk_TBAF_SetAttrib("bafi2020.datablk.field_8|P")
        sv_a = urhk_TBAF_SetAttrib("bafi2020.datablk.field_10|P")
        sv_a = urhk_TBAF_SetAttrib("bafi2020.datablk.field_12|P")
        sv_a = urhk_TBAF_SetAttrib("bafi2020.datablk.field_14|P")
        sv_a = urhk_TBAF_SetAttrib("bafi2020.datablk.field_16|P")
        sv_a = urhk_TBAF_SetAttrib("bafi2020.datablk.field_17|P")
        sv_a = urhk_TBAF_SetAttrib("bafi2020.datablk.field_20|P")
        sv_a = urhk_TBAF_SetAttrib("bafi2020.datablk.field_28|H")
        sv_a = urhk_TBAF_SetAttrib("bafi2020.datablk.field_29|H")
        sv_a = urhk_TBAF_SetAttrib("bafi2020.datablk.field_30|H")
        sv_a = urhk_TBAF_SetAttrib("bafi2020.datablk.field_31|H")
        sv_a = urhk_TBAF_SetAttrib("bafi2020.datablk.field_32|H")
        sv_a = urhk_TBAF_SetAttrib("bafi2020.datablk.field_33|H")
        sv_a = urhk_TBAF_SetAttrib("bafi2020.datablk.field_34|H")

    #======================================================================
    # Calling scripts on F1 (Help) and F2 (List) key press
    #======================================================================

        # Calling script for F2 (List)
        sv_r = urhk_TBAF_SetKeyScript("bafi2020.datablk.key-f0|coctm_val.scr|0")

        # Calling script for F1 (Help)
        sv_a = urhk_TBAF_SetKeyScript("bafi2020.datablk.key-help|coctm_val.scr|1")

        sv_a = urhk_WFS_ShowParamAcptFrm("")

        IF ( STDWFS.WFSOUTPUT.ErrorCode == "-9999") THEN
        #{
            STDWFS.WFSINPUT.NextStep = "0"
            STDWFS.WFSINPUT.WfsStatus = "D"
            EXITSCRIPT
        #}
        ENDIF

    #======================================================================
    # Assigning the field values to variables
    #======================================================================

        STDWFS.LIMIT.Mode = toupper(STDWFS.WFSOUTPARAM.Mode)
        print(STDWFS.LIMIT.Mode)

        STDWFS.LIMIT.RefNo = toupper(STDWFS.WFSOUTPARAM.RefNo)
        print(STDWFS.LIMIT.RefNo)
        
        STDWFS.LIMIT.AccountNumber1 = toupper(STDWFS.WFSOUTPARAM.AccountNumber1)
        print(STDWFS.LIMIT.AccountNumber1)
        
        STDWFS.LIMIT.AccountName = toupper(STDWFS.WFSOUTPARAM.AccountName)
        print(STDWFS.LIMIT.AccountName)

        STDWFS.LIMIT.CreditAmount1 = toupper(STDWFS.WFSOUTPARAM.CreditAmount1)
        print(STDWFS.LIMIT.CreditAmount1)

        STDWFS.LIMIT.GSTAmount1 = toupper(STDWFS.WFSOUTPARAM.GSTAmount1)
        print(STDWFS.LIMIT.GSTAmount1)
        
        STDWFS.LIMIT.AccountNumber2 = toupper(STDWFS.WFSOUTPARAM.AccountNumber2)
        print(STDWFS.LIMIT.AccountNumber2)
        
        STDWFS.LIMIT.AccountName2 = toupper(STDWFS.WFSOUTPARAM.AccountName2)
        print(STDWFS.LIMIT.AccountName2)
        
        STDWFS.LIMIT.CreditAmount2 = toupper(STDWFS.WFSOUTPARAM.CreditAmount2)
        print(STDWFS.LIMIT.CreditAmount2)

        STDWFS.LIMIT.GSTAmount2 = toupper(STDWFS.WFSOUTPARAM.GSTAmount2)
        print(STDWFS.LIMIT.GSTAmount2)
        
        STDWFS.LIMIT.AccountNumber3 = toupper(STDWFS.WFSOUTPARAM.AccountNumber3)
        print(STDWFS.LIMIT.AccountNumber3)

        STDWFS.LIMIT.AccountName3 = toupper(STDWFS.WFSOUTPARAM.AccountName3)
        print(STDWFS.LIMIT.AccountName3)    
        
        STDWFS.LIMIT.CreditAmount3 = toupper(STDWFS.WFSOUTPARAM.CreditAmount3)
        print(STDWFS.LIMIT.CreditAmount3)  
        
        STDWFS.LIMIT.GSTAmount3 = toupper(STDWFS.WFSOUTPARAM.GSTAmount3)
        print(STDWFS.LIMIT.GSTAmount3)  
        
        STDWFS.LIMIT.Remarks = toupper(STDWFS.WFSOUTPARAM.Remarks)
        print(STDWFS.LIMIT.Remarks) 
        
        STDWFS.LIMIT.TranType = toupper(STDWFS.WFSOUTPARAM.TranType)
        print(STDWFS.LIMIT.TranType)    
        
        STDWFS.LIMIT.DebitAcno = toupper(STDWFS.WFSOUTPARAM.DebitAcno)
        print(STDWFS.LIMIT.DebitAcno)  
        
        STDWFS.LIMIT.DebitAmount = toupper(STDWFS.WFSOUTPARAM.DebitAmount)
        print(STDWFS.LIMIT.DebitAmount)  
        
        STDWFS.LIMIT.NameOfParty = toupper(STDWFS.WFSOUTPARAM.NameOfParty)
        print(STDWFS.LIMIT.NameOfParty) 
        
        STDWFS.LIMIT.Address = toupper(STDWFS.WFSOUTPARAM.Address)
        print(STDWFS.LIMIT.Address)    
        
        STDWFS.LIMIT.PAN = toupper(STDWFS.WFSOUTPARAM.PAN)
        print(STDWFS.LIMIT.PAN)  
        
        STDWFS.LIMIT.GSTN = toupper(STDWFS.WFSOUTPARAM.GSTN)
        print(STDWFS.LIMIT.GSTN)  
        
        STDWFS.LIMIT.MobileNumber = toupper(STDWFS.WFSOUTPARAM.MobileNumber)
        print(STDWFS.LIMIT.MobileNumber) 
        
        STDWFS.LIMIT.IGST = toupper(STDWFS.WFSOUTPARAM.IGST)
        print(STDWFS.LIMIT.IGST)

        STDWFS.LIMIT.ChkFlg = toupper(STDWFS.WFSOUTPARAM.ChkFlg)
        print(STDWFS.LIMIT.ChkFlg)
 
    #======================================================================
    # Validations of field values
    #======================================================================

        STDWFS.LIMIT.ErrFlg="N"

        IF ((STDWFS.LIMIT.modchk=="N") OR (STDWFS.LIMIT.Mode == "A")) THEN
        #{
            sv_a = urhk_TBAF_SetAttrib("bafi2020.datablk.field_1|P")
            sv_a = urhk_TBAF_SetAttrib("bafi2020.datablk.field_2|P")
        #}
        ENDIF

        IF ((STDWFS.LIMIT.Mode != "A") AND (STDWFS.LIMIT.Mode != "M") AND (STDWFS.LIMIT.Mode != "I")AND (STDWFS.LIMIT.Mode != "D")AND (STDWFS.LIMIT.Mode != "V")) THEN
        #{
            STDWFS.WFSINPARAMVAL.ErrorMesg="Select valid mode: A-Add; M-Modify; D-Delete; I-Inquire; V-Verify"
            STDWFS.LIMIT.errCode = "Y"
            GOTO ENDLOOP
        #}
        ENDIF    
        
        #======================================================================
        # Modification,Inquire,Delete,verify
        #======================================================================

        IF ((STDWFS.LIMIT.Mode == "M" ) OR (STDWFS.LIMIT.Mode == "I" )OR (STDWFS.LIMIT.Mode == "D" )OR (STDWFS.LIMIT.Mode == "V" )) THEN 
        #{
            IF (STDWFS.LIMIT.RefNo == "") THEN
            #{
                sv_o="01Enter Reference Number. Press f2 for help"
                STDWFS.LIMIT.ErrFlg = "Y"
                GOTO RPLYLOOP
            #}
            ENDIF 
            
            IF (STDWFS.LIMIT.modchk == "Y")THEN
            #{    
                STDWFS.LIMIT.datastring=STDWFS.LIMIT.Mode+"^"+STDWFS.LIMIT.RefNo+"^"+STDWFS.LIMIT.AccountNumber1+"^"+STDWFS.LIMIT.CreditAmount1+"^"+STDWFS.LIMIT.AccountNumber2+"^"+STDWFS.LIMIT.CreditAmount2+"^"+STDWFS.LIMIT.AccountNumber3+"^"+STDWFS.LIMIT.CreditAmount3+"^^^^^^^^^^^"+STDWFS.LIMIT.solid+"^"+STDWFS.LIMIT.userid+"^"+STDWFS.LIMIT.BODDATE  +"^2"
                print(STDWFS.LIMIT.datastring)
                
                sv_a = "res,res1,res2,res3,res4,res5,res6,res7,res8,res9,res10,res11,res12,res13,res14,res15,res16,res17,res18,res19,res20,res21|SELECT TRIM(PKGSMGBCOMMON.DELIMITEDTEXT(DATASTRING,'^',1)),TRIM(PKGSMGBCOMMON.DELIMITEDTEXT(DATASTRING,'^',2)),TRIM(PKGSMGBCOMMON.DELIMITEDTEXT(DATASTRING,'^',3)),TRIM(PKGSMGBCOMMON.DELIMITEDTEXT(DATASTRING,'^',4)),TRIM(PKGSMGBCOMMON.DELIMITEDTEXT(DATASTRING,'^',5)),TRIM(PKGSMGBCOMMON.DELIMITEDTEXT(DATASTRING,'^',6)),TRIM(PKGSMGBCOMMON.DELIMITEDTEXT(DATASTRING,'^',7)),TRIM(PKGSMGBCOMMON.DELIMITEDTEXT(DATASTRING,'^',8)),TRIM(PKGSMGBCOMMON.DELIMITEDTEXT(DATASTRING,'^',9)),TRIM(PKGSMGBCOMMON.DELIMITEDTEXT(DATASTRING,'^',10)),TRIM(PKGSMGBCOMMON.DELIMITEDTEXT(DATASTRING,'^',11)),TRIM(PKGSMGBCOMMON.DELIMITEDTEXT(DATASTRING,'^',12)),TRIM(PKGSMGBCOMMON.DELIMITEDTEXT(DATASTRING,'^',13)),TRIM(PKGSMGBCOMMON.DELIMITEDTEXT(DATASTRING,'^',14)),TRIM(PKGSMGBCOMMON.DELIMITEDTEXT(DATASTRING,'^',15)),TRIM(PKGSMGBCOMMON.DELIMITEDTEXT(DATASTRING,'^',16)),TRIM(PKGSMGBCOMMON.DELIMITEDTEXT(DATASTRING,'^',17)),TRIM(PKGSMGBCOMMON.DELIMITEDTEXT(DATASTRING,'^',18)),TRIM(PKGSMGBCOMMON.DELIMITEDTEXT(DATASTRING,'^',19)),TRIM(PKGSMGBCOMMON.DELIMITEDTEXT(DATASTRING,'^',20)),TRIM(PKGSMGBCOMMON.DELIMITEDTEXT(DATASTRING,'^',21)),TRIM(PKGSMGBCOMMON.DELIMITEDTEXT(DATASTRING,'^',22)) FROM (SELECT PKGCOCTRAN.VALIDATE_COCTRAN('" + STDWFS.LIMIT.datastring + "') DATASTRING FROM  DUAL)"
                print (sv_a)
                sv_b = urhk_dbSelect(sv_a)
                print (sv_b)
                sv_o = BANCS.OUTPARAM.res
                
                STDWFS.LIMIT.recordcut1 = MID$(sv_o,0,1)
                print(STDWFS.LIMIT.recordcut1)
                
                IF (STDWFS.LIMIT.recordcut1 == "F") THEN
                #{
                    STDWFS.LIMIT.recordcut1 = MID$(sv_o,1,99)
                    STDWFS.WFSINPARAMVAL.ErrorMesg = STDWFS.LIMIT.recordcut1
                    STDWFS.LIMIT.errCode = "Y"
                    GOTO ENDLOOP
                #}
                ENDIF
                
                IF (STDWFS.LIMIT.recordcut1 == "S")  THEN
                #{
                    sv_c = STRLEN(sv_o)
                    print (sv_c)
                    STDWFS.LIMIT.AccountNumber1 = MID$(sv_o,1,sv_c-1)
                    print(STDWFS.LIMIT.AccountNumber1)

                    STDWFS.LIMIT.AccountName = BANCS.OUTPARAM.res1
                    print(STDWFS.LIMIT.AccountName)
                    
                    STDWFS.LIMIT.CreditAmount1 = BANCS.OUTPARAM.res2
                    print(STDWFS.LIMIT.CreditAmount1)
                    
                    STDWFS.LIMIT.GSTAmount1 = BANCS.OUTPARAM.res3
                    print(STDWFS.LIMIT.GSTAmount1)
                    
                    STDWFS.LIMIT.AccountNumber2 = BANCS.OUTPARAM.res4
                    print(STDWFS.LIMIT.AccountNumber2)
                    
                    STDWFS.LIMIT.AccountName2 = BANCS.OUTPARAM.res5
                    print(STDWFS.LIMIT.AccountName2)
                    
                    STDWFS.LIMIT.CreditAmount2 = BANCS.OUTPARAM.res6
                    print(STDWFS.LIMIT.CreditAmount2)
                    
                    STDWFS.LIMIT.GSTAmount2 = BANCS.OUTPARAM.res7
                    print(STDWFS.LIMIT.GSTAmount2)
                    
                    STDWFS.LIMIT.AccountNumber3 = BANCS.OUTPARAM.res8
                    print(STDWFS.LIMIT.AccountNumber3)
                    
                    STDWFS.LIMIT.AccountName3 = BANCS.OUTPARAM.res9
                    print(STDWFS.LIMIT.AccountName3)
                    
                    STDWFS.LIMIT.CreditAmount3 = BANCS.OUTPARAM.res10
                    print(STDWFS.LIMIT.CreditAmount3)
                    
                    STDWFS.LIMIT.GSTAmount3 = BANCS.OUTPARAM.res11
                    print(STDWFS.LIMIT.GSTAmount3)
                    
                    STDWFS.LIMIT.Remarks = BANCS.OUTPARAM.res12
                    print(STDWFS.LIMIT.Remarks)
                    
                    STDWFS.LIMIT.TranType = BANCS.OUTPARAM.res13
                    print(STDWFS.LIMIT.TranType)
                    
                    STDWFS.LIMIT.DebitAcno = BANCS.OUTPARAM.res14
                    print(STDWFS.LIMIT.DebitAcno)
                    
                    STDWFS.LIMIT.DebitAmount = BANCS.OUTPARAM.res15
                    print(STDWFS.LIMIT.DebitAmount)
                    
                    STDWFS.LIMIT.NameOfParty = BANCS.OUTPARAM.res16
                    print(STDWFS.LIMIT.NameOfParty)
                    
                    STDWFS.LIMIT.Address = BANCS.OUTPARAM.res17
                    print(STDWFS.LIMIT.Address)
                    
                    STDWFS.LIMIT.PAN = BANCS.OUTPARAM.res18
                    print(STDWFS.LIMIT.PAN)
                    
                    STDWFS.LIMIT.GSTN = BANCS.OUTPARAM.res19
                    print(STDWFS.LIMIT.GSTN)
                    
                    STDWFS.LIMIT.MobileNumber = BANCS.OUTPARAM.res20
                    print(STDWFS.LIMIT.MobileNumber)
                    
                    STDWFS.LIMIT.IGST = BANCS.OUTPARAM.res21
                    print(STDWFS.LIMIT.IGST)
                                                                                
                    #======================================================================
                    # Disply Fields
                    #======================================================================

                    sv_b = urhk_TBAF_SetValue("bafi2020.datablk.field_3|" + STDWFS.LIMIT.AccountNumber1)
                    sv_b = urhk_TBAF_SetValue("bafi2020.datablk.field_4|" + STDWFS.LIMIT.AccountName)
                    sv_b = urhk_TBAF_SetValue("bafi2020.datablk.field_5|" + STDWFS.LIMIT.CreditAmount1)
                    sv_b = urhk_TBAF_SetValue("bafi2020.datablk.field_6|" + STDWFS.LIMIT.GSTAmount1)
                    sv_b = urhk_TBAF_SetValue("bafi2020.datablk.field_7|" + STDWFS.LIMIT.AccountNumber2)
                    sv_b = urhk_TBAF_SetValue("bafi2020.datablk.field_8|" + STDWFS.LIMIT.AccountName2)
                    sv_b = urhk_TBAF_SetValue("bafi2020.datablk.field_9|" + STDWFS.LIMIT.CreditAmount2)
                    sv_b = urhk_TBAF_SetValue("bafi2020.datablk.field_10|" + STDWFS.LIMIT.GSTAmount2)
                    sv_b = urhk_TBAF_SetValue("bafi2020.datablk.field_11|" + STDWFS.LIMIT.AccountNumber3)
                    sv_b = urhk_TBAF_SetValue("bafi2020.datablk.field_12|" + STDWFS.LIMIT.AccountName3)
                    sv_b = urhk_TBAF_SetValue("bafi2020.datablk.field_13|" + STDWFS.LIMIT.CreditAmount3)
                    sv_b = urhk_TBAF_SetValue("bafi2020.datablk.field_14|" + STDWFS.LIMIT.GSTAmount3)
                    sv_b = urhk_TBAF_SetValue("bafi2020.datablk.field_15|" + STDWFS.LIMIT.Remarks)
                    sv_b = urhk_TBAF_SetValue("bafi2020.datablk.field_18|" + STDWFS.LIMIT.TranType)
                    sv_b = urhk_TBAF_SetValue("bafi2020.datablk.field_19|" + STDWFS.LIMIT.DebitAcno)
                    sv_b = urhk_TBAF_SetValue("bafi2020.datablk.field_20|" + STDWFS.LIMIT.DebitAmount)
                    sv_b = urhk_TBAF_SetValue("bafi2020.datablk.field_21|" + STDWFS.LIMIT.NameOfParty)
                    sv_b = urhk_TBAF_SetValue("bafi2020.datablk.field_22|" + STDWFS.LIMIT.Address)
                    sv_b = urhk_TBAF_SetValue("bafi2020.datablk.field_23|" + STDWFS.LIMIT.PAN)
                    sv_b = urhk_TBAF_SetValue("bafi2020.datablk.field_24|" + STDWFS.LIMIT.GSTN)
                    sv_b = urhk_TBAF_SetValue("bafi2020.datablk.field_25|" + STDWFS.LIMIT.MobileNumber)
                    sv_b = urhk_TBAF_SetValue("bafi2020.datablk.field_26|" + STDWFS.LIMIT.IGST)
                    
                    sv_b = urhk_TBAF_SetAttrib("bafi2020.datablk.field_1|P")
                    sv_b = urhk_TBAF_SetAttrib("bafi2020.datablk.field_2|P")
                    STDWFS.LIMIT.modchk="N"

                    IF ((STDWFS.LIMIT.Mode == "I" ) OR (STDWFS.LIMIT.Mode == "D" )OR (STDWFS.LIMIT.Mode == "V")) THEN
                    #{
                        sv_b = urhk_TBAF_SetAttrib("bafi2020.datablk.field_3|P")
                        sv_b = urhk_TBAF_SetAttrib("bafi2020.datablk.field_4|P")
                        sv_b = urhk_TBAF_SetAttrib("bafi2020.datablk.field_5|P")
                        sv_b = urhk_TBAF_SetAttrib("bafi2020.datablk.field_6|P")
                        sv_b = urhk_TBAF_SetAttrib("bafi2020.datablk.field_7|P")
                        sv_b = urhk_TBAF_SetAttrib("bafi2020.datablk.field_8|P")
                        sv_b = urhk_TBAF_SetAttrib("bafi2020.datablk.field_9|P")
                        sv_b = urhk_TBAF_SetAttrib("bafi2020.datablk.field_10|P")
                        sv_b = urhk_TBAF_SetAttrib("bafi2020.datablk.field_11|P")
                        sv_b = urhk_TBAF_SetAttrib("bafi2020.datablk.field_12|P")
                        sv_b = urhk_TBAF_SetAttrib("bafi2020.datablk.field_13|P")
                        sv_b = urhk_TBAF_SetAttrib("bafi2020.datablk.field_14|P")
                        sv_b = urhk_TBAF_SetAttrib("bafi2020.datablk.field_15|P")
                        sv_b = urhk_TBAF_SetAttrib("bafi2020.datablk.field_18|P")
                        sv_b = urhk_TBAF_SetAttrib("bafi2020.datablk.field_19|P")
                        sv_b = urhk_TBAF_SetAttrib("bafi2020.datablk.field_20|P")
                        sv_b = urhk_TBAF_SetAttrib("bafi2020.datablk.field_21|P")
                        sv_b = urhk_TBAF_SetAttrib("bafi2020.datablk.field_22|P")
                        sv_b = urhk_TBAF_SetAttrib("bafi2020.datablk.field_23|P")
                        sv_b = urhk_TBAF_SetAttrib("bafi2020.datablk.field_24|P")
                        sv_b = urhk_TBAF_SetAttrib("bafi2020.datablk.field_25|P")
                        sv_b = urhk_TBAF_SetAttrib("bafi2020.datablk.field_26|P")
                        
                        IF (STDWFS.LIMIT.Mode == "I" ) THEN
                        #{
                            sv_b = urhk_TBAF_SetAttrib("bafi2020.datablk.field_27|P")
                           
                            STDWFS.WFSINPARAMVAL.ErrorMesg="Press F3 to exit"
                            STDWFS.LIMIT.errCode = "Y"
                            GOTO ENDLOOP
                        #}
                        ENDIF

                        STDWFS.LIMIT.errCode = "Y"
                        GOTO FLGLOOP
                    #}
                    ENDIF

                    STDWFS.LIMIT.errCode = "Y"
                    GOTO ENDLOOP
                #}
                ENDIF
            #}
            ENDIF
            
            IF ((STDWFS.LIMIT.modchk == "N") AND (STDWFS.LIMIT.Mode == "I" ) OR (STDWFS.LIMIT.Mode == "D" )OR (STDWFS.LIMIT.Mode == "V")) THEN
            #{
                sv_b = urhk_TBAF_SetAttrib("bafi2020.datablk.field_3|P")
                sv_b = urhk_TBAF_SetAttrib("bafi2020.datablk.field_4|P")
                sv_b = urhk_TBAF_SetAttrib("bafi2020.datablk.field_5|P")
                sv_b = urhk_TBAF_SetAttrib("bafi2020.datablk.field_6|P")
                sv_b = urhk_TBAF_SetAttrib("bafi2020.datablk.field_7|P")
                sv_b = urhk_TBAF_SetAttrib("bafi2020.datablk.field_8|P")
                sv_b = urhk_TBAF_SetAttrib("bafi2020.datablk.field_9|P")
                sv_b = urhk_TBAF_SetAttrib("bafi2020.datablk.field_10|P")
                sv_b = urhk_TBAF_SetAttrib("bafi2020.datablk.field_11|P")
                sv_b = urhk_TBAF_SetAttrib("bafi2020.datablk.field_12|P")
                sv_b = urhk_TBAF_SetAttrib("bafi2020.datablk.field_13|P")
                sv_b = urhk_TBAF_SetAttrib("bafi2020.datablk.field_14|P")
                sv_b = urhk_TBAF_SetAttrib("bafi2020.datablk.field_15|P")
                sv_b = urhk_TBAF_SetAttrib("bafi2020.datablk.field_18|P")
                sv_b = urhk_TBAF_SetAttrib("bafi2020.datablk.field_19|P")
                sv_b = urhk_TBAF_SetAttrib("bafi2020.datablk.field_20|P")
                sv_b = urhk_TBAF_SetAttrib("bafi2020.datablk.field_21|P")
                sv_b = urhk_TBAF_SetAttrib("bafi2020.datablk.field_22|P")
                sv_b = urhk_TBAF_SetAttrib("bafi2020.datablk.field_23|P")
                sv_b = urhk_TBAF_SetAttrib("bafi2020.datablk.field_24|P")
                sv_b = urhk_TBAF_SetAttrib("bafi2020.datablk.field_25|P")
                sv_b = urhk_TBAF_SetAttrib("bafi2020.datablk.field_26|P")
                
                sv_b = urhk_TBAF_SetValue("bafi2020.datablk.field_4|" + STDWFS.LIMIT.AccountName)
                sv_b = urhk_TBAF_SetValue("bafi2020.datablk.field_6|" + STDWFS.LIMIT.GSTAmount1)
                sv_b = urhk_TBAF_SetValue("bafi2020.datablk.field_8|" + STDWFS.LIMIT.AccountName2)
                sv_b = urhk_TBAF_SetValue("bafi2020.datablk.field_10|" + STDWFS.LIMIT.GSTAmount2)
                sv_b = urhk_TBAF_SetValue("bafi2020.datablk.field_12|" + STDWFS.LIMIT.AccountName3)
                sv_b = urhk_TBAF_SetValue("bafi2020.datablk.field_14|" + STDWFS.LIMIT.GSTAmount3)
                sv_b = urhk_TBAF_SetValue("bafi2020.datablk.field_20|" + STDWFS.LIMIT.DebitAmount)
                
                IF (STDWFS.LIMIT.Mode == "I" ) THEN
                #{
                    sv_b = urhk_TBAF_SetAttrib("bafi2020.datablk.field_27|P")
                    STDWFS.WFSINPARAMVAL.ErrorMesg="Press F3 to exit"
                    STDWFS.LIMIT.errCode = "Y"
                    GOTO ENDLOOP
                #}
                ENDIF

                STDWFS.LIMIT.errCode = "Y"
                GOTO FLGLOOP
            #}
            ENDIF
               
        #}
        ENDIF
        #======================================================================
        # Validating null value in  Remarks
        #======================================================================
        
        IF ((STDWFS.LIMIT.AccountNumber1 == "") AND (STDWFS.LIMIT.Mode == "A")) THEN
        #{
            sv_o="01Enter CO Account Number 1. Press f2 for help"
            STDWFS.LIMIT.ErrFlg = "Y"
            GOTO RPLYLOOP
        #}
        ENDIF  
        
        IF ((STDWFS.LIMIT.CreditAmount1 == "") AND (STDWFS.LIMIT.ErrFlg == "N"))  THEN
        #{
            sv_o="02Enter Credit amount 1."
            STDWFS.LIMIT.ErrFlg = "Y"
            GOTO RPLYLOOP
        #}
        ENDIF
        
        IF ((STDWFS.LIMIT.AccountNumber2 == "") AND (STDWFS.LIMIT.ErrFlg == "N")) THEN
        #{
            sv_o="03Enter CO Account Number 2. If not required enter NR."
            STDWFS.LIMIT.ErrFlg = "Y"
            GOTO RPLYLOOP
        #}
        ENDIF  
        
        
        IF ((STDWFS.LIMIT.AccountNumber2 != "NR") AND (STDWFS.LIMIT.ErrFlg == "N"))  THEN
        #{
            sv_o="03Enter NR for CO Account Number 2.Only One credit account is allowed."
            STDWFS.LIMIT.ErrFlg = "Y"
            GOTO RPLYLOOP
        #}
        ENDIF 
        
        IF ((STDWFS.LIMIT.CreditAmount2 == "") AND (STDWFS.LIMIT.AccountNumber2 != "NR") AND (STDWFS.LIMIT.ErrFlg == "N"))  THEN
        #{
            sv_o="04Enter Credit amount 2."
            STDWFS.LIMIT.ErrFlg = "Y"
            GOTO RPLYLOOP
        #}
        ENDIF 
        
        IF ((STDWFS.LIMIT.CreditAmount2 != "") AND (STDWFS.LIMIT.AccountNumber2 == "NR") AND (STDWFS.LIMIT.ErrFlg == "N"))  THEN
        #{
            sv_o="04Clear Credit amount 2."
            STDWFS.LIMIT.ErrFlg = "Y"
            GOTO RPLYLOOP
        #}
        ENDIF 
        
        IF ((STDWFS.LIMIT.AccountNumber3 == "") AND (STDWFS.LIMIT.ErrFlg == "N")) THEN
        #{
            sv_o="05Enter CO Account Number 3. If not required enter NR."
            STDWFS.LIMIT.ErrFlg = "Y"
            GOTO RPLYLOOP
        #}
        ENDIF  
        
        IF ((STDWFS.LIMIT.AccountNumber3 != "NR") AND (STDWFS.LIMIT.ErrFlg == "N"))  THEN
        #{
            sv_o="05Enter NR for CO Account Number 3.Only One credit account is allowed."
            STDWFS.LIMIT.ErrFlg = "Y"
            GOTO RPLYLOOP
        #}
        ENDIF 
        
        IF ((STDWFS.LIMIT.CreditAmount3 == "") AND (STDWFS.LIMIT.AccountNumber3 != "NR") AND (STDWFS.LIMIT.ErrFlg == "N"))  THEN
        #{
            sv_o="06Enter Credit amount 3."
            STDWFS.LIMIT.ErrFlg = "Y"
            GOTO RPLYLOOP
        #}
        ENDIF 
        
        IF ((STDWFS.LIMIT.CreditAmount3 != "") AND (STDWFS.LIMIT.AccountNumber3 == "NR") AND (STDWFS.LIMIT.ErrFlg == "N"))  THEN
        #{
            sv_o="06Clear Credit amount 3."
            STDWFS.LIMIT.ErrFlg = "Y"
            GOTO RPLYLOOP
        #}
        ENDIF  
        
        IF ((STDWFS.LIMIT.Mode == "A" ) AND (STDWFS.LIMIT.modchk == "Y" )) THEN 
        #{
                STDWFS.LIMIT.datastring=STDWFS.LIMIT.Mode+"^"+STDWFS.LIMIT.RefNo+"^"+STDWFS.LIMIT.AccountNumber1+"^"+STDWFS.LIMIT.CreditAmount1+"^"+STDWFS.LIMIT.AccountNumber2+"^"+STDWFS.LIMIT.CreditAmount2+"^"+STDWFS.LIMIT.AccountNumber3+"^"+STDWFS.LIMIT.CreditAmount3+"^^^^^^^^^^^"+STDWFS.LIMIT.solid+"^"+STDWFS.LIMIT.userid+"^"+STDWFS.LIMIT.BODDATE +"^1"
                print(STDWFS.LIMIT.datastring)

                sv_a = "res,res1,res2,res3,res4,res5,res6|SELECT TRIM(PKGSMGBCOMMON.DELIMITEDTEXT(DATASTRING,'^',1)),TRIM(PKGSMGBCOMMON.DELIMITEDTEXT(DATASTRING,'^',2)),TRIM(PKGSMGBCOMMON.DELIMITEDTEXT(DATASTRING,'^',3)),TRIM(PKGSMGBCOMMON.DELIMITEDTEXT(DATASTRING,'^',4)),TRIM(PKGSMGBCOMMON.DELIMITEDTEXT(DATASTRING,'^',5)),TRIM(PKGSMGBCOMMON.DELIMITEDTEXT(DATASTRING,'^',6)),TRIM(PKGSMGBCOMMON.DELIMITEDTEXT(DATASTRING,'^',7)) FROM (SELECT PKGCOCTRAN.VALIDATE_COCTRAN('" + STDWFS.LIMIT.datastring + "') DATASTRING FROM  DUAL)"
                print (sv_a)
                sv_b = urhk_dbSelect(sv_a)
                print (sv_b)
                sv_o = BANCS.OUTPARAM.res
                
                STDWFS.LIMIT.recordcut1 = MID$(sv_o,0,1)
                print(STDWFS.LIMIT.recordcut1)
                
                IF (STDWFS.LIMIT.recordcut1 == "F") THEN
                #{
                    STDWFS.LIMIT.recordcut1 = MID$(sv_o,1,99)
                    STDWFS.WFSINPARAMVAL.ErrorMesg = STDWFS.LIMIT.recordcut1
                    STDWFS.LIMIT.errCode = "Y"
                    GOTO ENDLOOP
                #}
                ENDIF
                
                IF (STDWFS.LIMIT.recordcut1 == "S")  THEN
                #{
                    sv_c = STRLEN(sv_o)
                    print (sv_c)
                    STDWFS.LIMIT.AccountName = MID$(sv_o,1,sv_c-1)
                    print(STDWFS.LIMIT.AccountName)
                    
                    STDWFS.LIMIT.GSTAmount1 = BANCS.OUTPARAM.res1
                    print(STDWFS.LIMIT.GSTAmount1)
                    
                    STDWFS.LIMIT.AccountName2 = BANCS.OUTPARAM.res2
                    print(STDWFS.LIMIT.AccountName2)
                    
                    STDWFS.LIMIT.GSTAmount2 = BANCS.OUTPARAM.res3
                    print(STDWFS.LIMIT.GSTAmount2)
                    
                    STDWFS.LIMIT.AccountName3 = BANCS.OUTPARAM.res4
                    print(STDWFS.LIMIT.AccountName3)
                    
                    STDWFS.LIMIT.GSTAmount3 = BANCS.OUTPARAM.res5
                    print(STDWFS.LIMIT.GSTAmount3)
                    
                    STDWFS.LIMIT.DebitAmount = BANCS.OUTPARAM.res6
                    print(STDWFS.LIMIT.DebitAmount)
                    
                    #======================================================================
                    # Disply Fields
                    #======================================================================

                    sv_b = urhk_TBAF_SetValue("bafi2020.datablk.field_4|" + STDWFS.LIMIT.AccountName)
                    sv_b = urhk_TBAF_SetValue("bafi2020.datablk.field_6|" + STDWFS.LIMIT.GSTAmount1)
                    sv_b = urhk_TBAF_SetValue("bafi2020.datablk.field_8|" + STDWFS.LIMIT.AccountName2)
                    sv_b = urhk_TBAF_SetValue("bafi2020.datablk.field_10|" + STDWFS.LIMIT.GSTAmount2)
                    sv_b = urhk_TBAF_SetValue("bafi2020.datablk.field_12|" + STDWFS.LIMIT.AccountName3)
                    sv_b = urhk_TBAF_SetValue("bafi2020.datablk.field_14|" + STDWFS.LIMIT.GSTAmount3)
                    sv_b = urhk_TBAF_SetValue("bafi2020.datablk.field_20|" + STDWFS.LIMIT.DebitAmount)
                    
                    sv_a = urhk_TBAF_SetAttrib("bafi2020.datablk.field_1|P")
                    sv_a = urhk_TBAF_SetAttrib("bafi2020.datablk.field_2|P")
                    
                    STDWFS.LIMIT.modchk="N"
                    STDWFS.LIMIT.errCode = "Y"
                    GOTO ENDLOOP
                #}
                ENDIF
        #}
        ENDIF
        
        
        #======================================================================
        # Validating null value in  Remarks
        #======================================================================
        
        IF ((STDWFS.LIMIT.Remarks == "") AND (STDWFS.LIMIT.ErrFlg == "N")) THEN
        #{
            sv_o="07Enter Remarks."
            STDWFS.LIMIT.ErrFlg = "Y"
            GOTO RPLYLOOP
        #}
        ENDIF  
        
        #======================================================================
        # Validating null value in  Remarks
        #======================================================================
        
        IF ((STDWFS.LIMIT.TranType == "") AND (STDWFS.LIMIT.ErrFlg == "N")) THEN
        #{
            sv_o="08Enter Transaction Mode. C-Cash, T-Transfer."
            STDWFS.LIMIT.ErrFlg = "Y"
            GOTO RPLYLOOP
        #}
        ENDIF  
        
        IF ((STDWFS.LIMIT.TranType != "C") AND (STDWFS.LIMIT.TranType != "T" ) AND (STDWFS.LIMIT.ErrFlg == "N")) THEN
        #{
            sv_o="08Enter a valid Transaction Mode. C-Cash, T-Transfer"
            STDWFS.LIMIT.ErrFlg = "Y"
            GOTO RPLYLOOP
        #}
        ENDIF
        
        IF ((STDWFS.LIMIT.DebitAcno == "") AND (STDWFS.LIMIT.TranType == "T") AND (STDWFS.LIMIT.ErrFlg == "N")) THEN
        #{
            sv_o="09Enter Debit Account number."
            STDWFS.LIMIT.ErrFlg = "Y"
            GOTO RPLYLOOP
        #}
        ENDIF 
        
        IF ((STDWFS.LIMIT.DebitAcno != "") AND (STDWFS.LIMIT.DebitAcno != "NA")  AND (STDWFS.LIMIT.TranType == "C") AND (STDWFS.LIMIT.ErrFlg == "N")) THEN
        #{
            sv_o="09Clear Debit Account number field for Transaction type C or Enter NA."
            STDWFS.LIMIT.ErrFlg = "Y"
            GOTO RPLYLOOP
        #}
        ENDIF 
        
        IF ((STDWFS.LIMIT.TranType == "C") AND (STDWFS.LIMIT.ErrFlg == "N")) THEN
        #{
           
             IF ((STDWFS.LIMIT.NameOfParty == "") AND (STDWFS.LIMIT.ErrFlg == "N")) THEN
            #{
                sv_o="10Enter Name Of Party."
                STDWFS.LIMIT.ErrFlg = "Y"
                GOTO RPLYLOOP
            #}
            ENDIF 
            
            IF ((STDWFS.LIMIT.Address == "") AND (STDWFS.LIMIT.ErrFlg == "N")) THEN
            #{
                sv_o="11Enter Address."
                STDWFS.LIMIT.ErrFlg = "Y"
                GOTO RPLYLOOP
            #}
            ENDIF 
            
            IF ((STDWFS.LIMIT.PAN == "") AND (STDWFS.LIMIT.ErrFlg == "N")) THEN
            #{
                sv_o="12Enter PAN.Enter NA if not available."
                STDWFS.LIMIT.ErrFlg = "Y"
                GOTO RPLYLOOP
            #}
            ENDIF 
            
            IF ((STDWFS.LIMIT.GSTN == "") AND (STDWFS.LIMIT.ErrFlg == "N")) THEN
            #{
                sv_o="13Enter GSTN Number.Enter NA if not available."
                STDWFS.LIMIT.ErrFlg = "Y"
                GOTO RPLYLOOP
            #}
            ENDIF 
            
            IF ((STDWFS.LIMIT.MobileNumber == "") AND (STDWFS.LIMIT.ErrFlg == "N")) THEN
            #{
                sv_o="14Enter Mobile Number."
                STDWFS.LIMIT.ErrFlg = "Y"
                GOTO RPLYLOOP
            #}
            ENDIF 
            
        #}
        ENDIF 
        
        IF ((STDWFS.LIMIT.IGST == "") AND (STDWFS.LIMIT.IGST != "Y") AND(STDWFS.LIMIT.IGST != "N") AND (STDWFS.LIMIT.ErrFlg == "N")) THEN
        #{
            sv_o="15Enter Y/N for IGST Applicable flag."
            STDWFS.LIMIT.ErrFlg = "Y"
            GOTO RPLYLOOP
        #}
        ENDIF 
        
        #======================================================================
        # Final Validation
        #======================================================================
        IF ((STDWFS.LIMIT.Mode == "M") OR (STDWFS.LIMIT.Mode == "A")) THEN
        #{
            STDWFS.LIMIT.datastring=STDWFS.LIMIT.Mode+"^"+STDWFS.LIMIT.RefNo+"^"+STDWFS.LIMIT.AccountNumber1+"^"+STDWFS.LIMIT.CreditAmount1+"^"+STDWFS.LIMIT.AccountNumber2+"^"+STDWFS.LIMIT.CreditAmount2+"^"+STDWFS.LIMIT.AccountNumber3+"^"+STDWFS.LIMIT.CreditAmount3+"^"+STDWFS.LIMIT.Remarks+"^"+STDWFS.LIMIT.TranType+"^"+STDWFS.LIMIT.DebitAcno+"^"+STDWFS.LIMIT.DebitAmount+"^"+STDWFS.LIMIT.NameOfParty+"^"+STDWFS.LIMIT.Address+"^"+STDWFS.LIMIT.PAN+"^"+STDWFS.LIMIT.GSTN+"^"+STDWFS.LIMIT.MobileNumber+"^"+STDWFS.LIMIT.IGST+"^"+STDWFS.LIMIT.solid+"^"+STDWFS.LIMIT.userid+"^"+STDWFS.LIMIT.BODDATE+"^4"
            print(STDWFS.LIMIT.datastring)

            sv_a = "res,res1,res2,res3,res4,res5,res6,res7,res8,res9,res10,res11,res12|SELECT TRIM(PKGSMGBCOMMON.DELIMITEDTEXT(DATASTRING,'^',1)),TRIM(PKGSMGBCOMMON.DELIMITEDTEXT(DATASTRING,'^',2)),TRIM(PKGSMGBCOMMON.DELIMITEDTEXT(DATASTRING,'^',3)),TRIM(PKGSMGBCOMMON.DELIMITEDTEXT(DATASTRING,'^',4)),TRIM(PKGSMGBCOMMON.DELIMITEDTEXT(DATASTRING,'^',5)),TRIM(PKGSMGBCOMMON.DELIMITEDTEXT(DATASTRING,'^',6)),TRIM(PKGSMGBCOMMON.DELIMITEDTEXT(DATASTRING,'^',7)),TRIM(PKGSMGBCOMMON.DELIMITEDTEXT(DATASTRING,'^',8)),TRIM(PKGSMGBCOMMON.DELIMITEDTEXT(DATASTRING,'^',9)),TRIM(PKGSMGBCOMMON.DELIMITEDTEXT(DATASTRING,'^',10)),TRIM(PKGSMGBCOMMON.DELIMITEDTEXT(DATASTRING,'^',11)),TRIM(PKGSMGBCOMMON.DELIMITEDTEXT(DATASTRING,'^',12)) ,TRIM(PKGSMGBCOMMON.DELIMITEDTEXT(DATASTRING,'^',13))FROM (SELECT PKGCOCTRAN.VALIDATE_COCTRAN('" + STDWFS.LIMIT.datastring + "') DATASTRING FROM  DUAL)"
            print (sv_a)
            sv_b = urhk_dbSelect(sv_a)
            print (sv_b)
            sv_r = BANCS.OUTPARAM.res
            
            STDWFS.LIMIT.recordcut1 = MID$(sv_r,0,1)
            print(STDWFS.LIMIT.recordcut1)
            
            IF (STDWFS.LIMIT.recordcut1 == "F") THEN
            #{
                sv_o=MID$(sv_r,1,130)
                STDWFS.LIMIT.ErrFlg = "Y"
                GOTO RPLYLOOP
            #}
            ENDIF    
            IF (STDWFS.LIMIT.recordcut1 == "S")  THEN
            #{
                #======================================================================
                # Record cut sample sv_a=SAB|CD|EF|GH|IJ|KL|MN
                #======================================================================
                sv_c = STRLEN(sv_r)
                print (sv_c)
                STDWFS.LIMIT.AccountName = MID$(sv_r,1,sv_c-1)
                print(STDWFS.LIMIT.AccountName)
                    
                STDWFS.LIMIT.GSTAmount1 = BANCS.OUTPARAM.res1
                print(STDWFS.LIMIT.GSTAmount1)
                    
                STDWFS.LIMIT.AccountName2 = BANCS.OUTPARAM.res2
                print(STDWFS.LIMIT.AccountName2)
                    
                STDWFS.LIMIT.GSTAmount2 = BANCS.OUTPARAM.res3
                print(STDWFS.LIMIT.GSTAmount2)
                    
                STDWFS.LIMIT.AccountName3 = BANCS.OUTPARAM.res4
                print(STDWFS.LIMIT.AccountName3)
                    
                STDWFS.LIMIT.GSTAmount3 = BANCS.OUTPARAM.res5
                print(STDWFS.LIMIT.GSTAmount3)
                
                STDWFS.LIMIT.DebitAmount = BANCS.OUTPARAM.res6
                print(STDWFS.LIMIT.DebitAmount)
                
                STDWFS.LIMIT.NameOfParty = BANCS.OUTPARAM.res7
                print(STDWFS.LIMIT.NameOfParty)
                
                STDWFS.LIMIT.Address = BANCS.OUTPARAM.res8
                print(STDWFS.LIMIT.Address)
                
                STDWFS.LIMIT.PAN = BANCS.OUTPARAM.res9
                print(STDWFS.LIMIT.PAN)
                
                STDWFS.LIMIT.MobileNumber = BANCS.OUTPARAM.res10
                print(STDWFS.LIMIT.MobileNumber)
                
                STDWFS.LIMIT.IGST = BANCS.OUTPARAM.res11
                print(STDWFS.LIMIT.IGST)
                
                STDWFS.LIMIT.GSTN = BANCS.OUTPARAM.res12
                print(STDWFS.LIMIT.GSTN)
                
                
                IF ((STDWFS.LIMIT.ChkFlg != "Y")) THEN
                #{
                    sv_b = urhk_TBAF_SetValue("bafi2020.datablk.field_4|" + STDWFS.LIMIT.AccountName)
                    sv_b = urhk_TBAF_SetValue("bafi2020.datablk.field_6|" + STDWFS.LIMIT.GSTAmount1)
                    sv_b = urhk_TBAF_SetValue("bafi2020.datablk.field_8|" + STDWFS.LIMIT.AccountName2)
                    sv_b = urhk_TBAF_SetValue("bafi2020.datablk.field_10|" + STDWFS.LIMIT.GSTAmount2)
                    sv_b = urhk_TBAF_SetValue("bafi2020.datablk.field_12|" + STDWFS.LIMIT.AccountName3)
                    sv_b = urhk_TBAF_SetValue("bafi2020.datablk.field_14|" + STDWFS.LIMIT.GSTAmount3) 
                    sv_b = urhk_TBAF_SetValue("bafi2020.datablk.field_20|" + STDWFS.LIMIT.DebitAmount)  
                    sv_b = urhk_TBAF_SetValue("bafi2020.datablk.field_21|" + STDWFS.LIMIT.NameOfParty)
                    sv_b = urhk_TBAF_SetValue("bafi2020.datablk.field_22|" + STDWFS.LIMIT.Address)
                    sv_b = urhk_TBAF_SetValue("bafi2020.datablk.field_23|" + STDWFS.LIMIT.PAN)
                    sv_b = urhk_TBAF_SetValue("bafi2020.datablk.field_24|" + STDWFS.LIMIT.GSTN)
                    sv_b = urhk_TBAF_SetValue("bafi2020.datablk.field_25|" + STDWFS.LIMIT.MobileNumber)
                    sv_b = urhk_TBAF_SetValue("bafi2020.datablk.field_26|" + STDWFS.LIMIT.IGST)              
                #}
                ENDIF
            #}
            ENDIF
        #}
        ENDIF            
        
        #======================================================================
        # Conformation
        #======================================================================
FLGLOOP:    
        IF ((STDWFS.LIMIT.ChkFlg != "Y") AND (STDWFS.LIMIT.ChkFlg != "N" ) AND (STDWFS.LIMIT.ErrFlg == "N")) THEN
        #{
            sv_o="16Enter Y - Submit; N - Cancel"
            STDWFS.LIMIT.ErrFlg = "Y"
            GOTO RPLYLOOP
        #}
        ENDIF
        #======================================================================
        # Verification Checking
        #======================================================================
        IF (STDWFS.LIMIT.Mode == "V") THEN
        #{
            STDWFS.LIMIT.datastring=STDWFS.LIMIT.Mode+"^"+STDWFS.LIMIT.RefNo+"^"+STDWFS.LIMIT.AccountNumber1+"^"+STDWFS.LIMIT.CreditAmount1+"^"+STDWFS.LIMIT.AccountNumber2+"^"+STDWFS.LIMIT.CreditAmount2+"^"+STDWFS.LIMIT.AccountNumber3+"^"+STDWFS.LIMIT.CreditAmount3+"^"+STDWFS.LIMIT.Remarks+"^"+STDWFS.LIMIT.TranType+"^"+STDWFS.LIMIT.DebitAcno+"^"+STDWFS.LIMIT.DebitAmount+"^"+STDWFS.LIMIT.NameOfParty+"^"+STDWFS.LIMIT.Address+"^"+STDWFS.LIMIT.PAN+"^"+STDWFS.LIMIT.GSTN+"^"+STDWFS.LIMIT.MobileNumber+"^"+STDWFS.LIMIT.IGST+"^"+STDWFS.LIMIT.solid+"^"+STDWFS.LIMIT.userid+"^"+STDWFS.LIMIT.BODDATE+"^3"
            print(STDWFS.LIMIT.datastring)
            
            sv_a = "res|SELECT PKGCOCTRAN.VALIDATE_COCTRAN('" + STDWFS.LIMIT.datastring + "') FROM  DUAL"
            print (sv_a)
            sv_b = urhk_dbSelect(sv_a)
            print (sv_b)
            sv_r = BANCS.OUTPARAM.res
            
            STDWFS.LIMIT.recordcut1 = MID$(sv_r,0,1)
            print(STDWFS.LIMIT.recordcut1)
            
            IF (STDWFS.LIMIT.recordcut1 == "F") THEN
            #{
                sv_o=MID$(sv_r,1,130)
                STDWFS.LIMIT.ErrFlg = "Y"
                GOTO RPLYLOOP
            #}
            ENDIF  

        #}
        ENDIF

        #======================================================================
        # Replay Loop
        #======================================================================
RPLYLOOP:
        IF (STDWFS.LIMIT.ErrFlg == "Y") THEN
        #{
            sv_r = MID$(sv_o,0,2)
            print(sv_r)
            sv_r=cint(sv_r)
            print (sv_r)
             while(sv_r != 0)
            #{
                sv_a = urhk_TBAF_SetReplayKey("bafi2020.datablk.key-nxtfld")
                sv_r=sv_r-1
                print(sv_r)
            do

                STDWFS.LIMIT.recordcut1 = MID$(sv_o,2,130)
                STDWFS.WFSINPARAMVAL.ErrorMesg = STDWFS.LIMIT.recordcut1
                STDWFS.LIMIT.errCode = "Y"
                GOTO ENDLOOP
            #}
        #}
        ENDIF
        #======================================================================
        # Calling Step1 functionS to update database
        #======================================================================

            IF(STDWFS.LIMIT.ChkFlg =="Y") THEN
            #{
               GOTO STEP1     
            #}
            ENDIF
            
            IF(STDWFS.LIMIT.ChkFlg =="N")THEN
            #{
                STDWFS.LIMIT.errCode = "Y"
                sv_q = urhk_TBAF_DispMesg("User cancelled the action.Press F3 to Quit the menu")
                GOTO ENDLOOP
            #}
            ENDIF
            
STEP1:

    STDWFS.LIMIT.updatestatus = "F"
    
    IF ((STDWFS.LIMIT.ChkFlg =="Y") AND (STDWFS.LIMIT.Mode == "A")) THEN
    #{  
        sv_a = "Slno|SELECT COTM_CR_SEQ.NEXTVAL FROM DUAL"
        print (sv_a)
        sv_b = urhk_dbSelect(sv_a)
        print (sv_b)
        
        IF (sv_b == 0)  THEN
        #{
            STDWFS.LIMIT.RefNo   = BANCS.OUTPARAM.Slno    
        #}
        ELSE
        #{
            STDWFS.LIMIT.updatestatus = "F"
            print(STDWFS.LIMIT.updatestatus)
            sv_q = urhk_TBAF_DispMesg("Ref number not Generated")
            STDWFS.LIMIT.errCode = "Y"
            GOTO ENDLOOP
        #}
        ENDIF
        
        sv_s = "INSERT INTO C_COCR_TRAN_MASTER (SOLID,SLNO,CR_ACNO_1,TRAN_AMOUNT_1,GSTAMOUNT_1,CR_ACNO_2,TRAN_AMOUNT_2,GSTAMOUNT_2,CR_ACNO_3,TRAN_AMOUNT_3,GSTAMOUNT_3,REMARKS,TRAN_MODE,DEBITACNO,DEBIT_AMOUNT,NAMEOFPARTY,ADDRESS,PAN,GSTN,MOBILENUMBER,IGST,CUSERID,CDATE) VALUES ('"+ STDWFS.LIMIT.solid  +"','"+ STDWFS.LIMIT.RefNo +"','"+ STDWFS.LIMIT.AccountNumber1 +"','"+ STDWFS.LIMIT.CreditAmount1+"','"+ STDWFS.LIMIT.GSTAmount1 +"','"+ STDWFS.LIMIT.AccountNumber2 +"','"+ STDWFS.LIMIT.CreditAmount2+"','"+ STDWFS.LIMIT.GSTAmount2 +"','"+ STDWFS.LIMIT.AccountNumber3 +"','"+ STDWFS.LIMIT.CreditAmount3+"','"+ STDWFS.LIMIT.GSTAmount3 +"','"+ STDWFS.LIMIT.Remarks+"','"+ STDWFS.LIMIT.TranType+"','"+ STDWFS.LIMIT.DebitAcno +"','"+ STDWFS.LIMIT.DebitAmount +"','"+ STDWFS.LIMIT.NameOfParty +"','"+ STDWFS.LIMIT.Address +"','"+ STDWFS.LIMIT.PAN+"','"+ STDWFS.LIMIT.GSTN+"','"+ STDWFS.LIMIT.MobileNumber+"','"+ STDWFS.LIMIT.IGST+"','"+ STDWFS.LIMIT.userid +"','"+ STDWFS.LIMIT.BODDATE +"')"
        print(sv_s)
        sv_d = urhk_dbSql(sv_s)
        print(sv_d)

        IF (sv_d == 0) THEN
        #{
            sv_q = urhk_dbSql("commit")
            STDWFS.LIMIT.updatestatus = "S"
            print(STDWFS.LIMIT.updatestatus)
        #}
        ELSE
        #{
            STDWFS.LIMIT.updatestatus = "F"
            print(STDWFS.LIMIT.updatestatus)
            sv_q = urhk_TBAF_DispMesg("Record not added due to error")
            STDWFS.LIMIT.errCode = "Y"
            GOTO ENDLOOP
        #}
        ENDIF
    #}
    ENDIF 
    
    IF ((STDWFS.LIMIT.ChkFlg =="Y") AND (STDWFS.LIMIT.Mode == "M")) THEN
    #{                    
  
        sv_s ="UPDATE C_COCR_TRAN_MASTER SET CR_ACNO_1='"+ STDWFS.LIMIT.AccountNumber1 +"',TRAN_AMOUNT_1='"+ STDWFS.LIMIT.CreditAmount1 +"',GSTAMOUNT_1='"+ STDWFS.LIMIT.GSTAmount1+"',CR_ACNO_2='"+ STDWFS.LIMIT.AccountNumber2+"',TRAN_AMOUNT_2='"+ STDWFS.LIMIT.CreditAmount2 +"',GSTAMOUNT_2='"+ STDWFS.LIMIT.GSTAmount2+"',CR_ACNO_3='"+ STDWFS.LIMIT.AccountNumber3+"',TRAN_AMOUNT_3='"+ STDWFS.LIMIT.CreditAmount3 +"',GSTAMOUNT_3='"+ STDWFS.LIMIT.GSTAmount3+"',REMARKS='"+ STDWFS.LIMIT.Remarks+"',TRAN_MODE='"+ STDWFS.LIMIT.TranType+"',DEBITACNO='"+ STDWFS.LIMIT.DebitAcno+"',DEBIT_AMOUNT='"+ STDWFS.LIMIT.DebitAmount+"',NAMEOFPARTY='"+ STDWFS.LIMIT.NameOfParty+"',ADDRESS='"+ STDWFS.LIMIT.Address+"',PAN='"+ STDWFS.LIMIT.PAN+"',GSTN='"+ STDWFS.LIMIT.GSTN+"',MOBILENUMBER='"+ STDWFS.LIMIT.MobileNumber+"',IGST='"+ STDWFS.LIMIT.IGST+"',MUSERID='"+ STDWFS.LIMIT.userid +"',MDATE='"+ STDWFS.LIMIT.BODDATE +"' WHERE SLNO='"+ STDWFS.LIMIT.RefNo +"'"
        print(sv_s)
        sv_d = urhk_dbSql(sv_s)

        IF (sv_d == 0) THEN
        #{
            sv_q = urhk_dbSql("commit")
            STDWFS.LIMIT.updatestatus = "S"
            print(STDWFS.LIMIT.updatestatus)
        #}
        ELSE
        #{
            STDWFS.LIMIT.updatestatus = "F"
            print(STDWFS.LIMIT.updatestatus)
            sv_q = urhk_TBAF_DispMesg("Record not Updated due to error")
            STDWFS.LIMIT.errCode = "Y"
            GOTO ENDLOOP
        #}
        ENDIF
    #}
    ENDIF  
    
    IF ((STDWFS.LIMIT.ChkFlg =="Y") AND (STDWFS.LIMIT.Mode == "D")) THEN
    #{
        sv_s ="UPDATE C_COCR_TRAN_MASTER SET DUSERID='"+ STDWFS.LIMIT.userid +"',DDATE='"+ STDWFS.LIMIT.BODDATE +"' WHERE SLNO='"+ STDWFS.LIMIT.RefNo +"'"
        print(sv_s)
        sv_d = urhk_dbSql(sv_s)
        print(sv_d)

        IF (sv_d == 0) THEN
        #{
            sv_q = urhk_dbSql("commit")
            STDWFS.LIMIT.updatestatus = "S"
            print(STDWFS.LIMIT.updatestatus)
        #}

        ELSE
        #{
            STDWFS.LIMIT.updatestatus = "F"
            print(STDWFS.LIMIT.updatestatus)
            sv_q = urhk_TBAF_DispMesg("Record not Updated due to error")
            STDWFS.LIMIT.errCode = "Y"
            GOTO ENDLOOP
        #}
        ENDIF
    #}
    ENDIF
    
    IF ((STDWFS.LIMIT.ChkFlg =="Y") AND (STDWFS.LIMIT.Mode == "V")) THEN
    #{
        if(STDWFS.LIMIT.Mode == "V") then
        #{
            CUST.CCOD.refNum = STDWFS.LIMIT.RefNo
			sv_s = " Checker | SELECT 1 FROM GAM,C_COCR_TRAN_MASTER "
			sv_s = sv_s + " WHERE foracid = DEBITACNO and schm_type ='LAA' "
			sv_s = sv_s + " AND SLNO = '"+CUST.CCOD.refNum+"'"
			print(sv_s)
			sv_d = urhk_dbselect(sv_s)
			print(sv_d)
			IF (sv_d == 0) THEN
            	call("coctmTranMTT.scr")
			ELSE
            	call("coctmTranSRV.scr")
			ENDIF
            BANCS.STDIN.WFflg = "Y"
            IF(CUST.CCOD.statusFlg == "S") THEN
            #{
                sv_s = ""
                sv_s = "UPDATE C_COCR_TRAN_MASTER SET TRAN_ID = '"+CUST.CCOD.tranId+"',TRAN_DATE=SYSDATE ,VUSERID='"+ STDWFS.LIMIT.userid +"',VDATE='"+ STDWFS.LIMIT.BODDATE +"' WHERE SLNO='"+ CUST.CCOD.refNum +"'"
                ###print(sv_s)

                sv_d = urhk_dbSql(sv_s)
                ###print(sv_d)

                IF (sv_d == 0) THEN
                #{
                    sv_q = urhk_dbSql("commit")
                    STDWFS.LIMIT.updatestatus = "S"
                    ###print(STDWFS.LIMIT.updatestatus)
                #}
                ENDIF

            #}
            ELSE
            #{
                STDWFS.LIMIT.updatestatus = "F"
                ###print(STDWFS.LIMIT.updatestatus)
                ###print(CUST.CCOD.statusMsg)
                sv_q = urhk_TBAF_DispMesg(CUST.CCOD.statusMsg)
                STDWFS.LIMIT.errCode = "Y"
                GOTO STEP2
            #}
            ENDIF
        #}
        endif
    
        #sv_s ="UPDATE C_COCR_TRAN_MASTER SET VUSERID='"+ STDWFS.LIMIT.userid +"',VDATE='"+ STDWFS.LIMIT.BODDATE +"' WHERE SLNO='"+ STDWFS.LIMIT.RefNo +"'"
        #print(sv_s)

        #sv_d = urhk_dbSql(sv_s)
        #print(sv_d)

        #IF (sv_d == 0) THEN
        ##{
        #    sv_q = urhk_dbSql("commit")
        #    STDWFS.LIMIT.updatestatus = "S"
        #    print(STDWFS.LIMIT.updatestatus)
        ##}
        #ELSE
        ##{
         #   STDWFS.LIMIT.updatestatus = "F"
         #   print(STDWFS.LIMIT.updatestatus)
          #  sv_q = urhk_TBAF_DispMesg("Record not Updated due to error")
        #    STDWFS.LIMIT.errCode = "Y"
        #    GOTO ENDLOOP
        ##}
       # ENDIF                              
                            
    #}
    ENDIF 
    
    IF (STDWFS.LIMIT.updatestatus =="S")  THEN
    #{
        IF (STDWFS.LIMIT.Mode == "A") THEN
        #{
            IF (STDWFS.LIMIT.ChkFlg =="Y") THEN
            #{
                sv_q = urhk_TBAF_DispMesg("Record added successfully, RefNo: " + STDWFS.LIMIT.RefNo)       
                STDWFS.LIMIT.errCode = "Y"
                GOTO STEP2
                       
            #}
            ENDIF
            
        #}
        ENDIF

        IF (STDWFS.LIMIT.Mode == "M") THEN
        #{

            IF (STDWFS.LIMIT.ChkFlg =="Y") THEN
            #{
                sv_q = urhk_TBAF_DispMesg("Record Modified successfully")       
                STDWFS.LIMIT.errCode = "Y"
                GOTO STEP2
                                   
            #}
            ENDIF
           
           STDWFS.LIMIT.errCode = "Y"
           GOTO STEP2
        #}
        ENDIF

        IF (STDWFS.LIMIT.Mode == "D") THEN
        #{  
           sv_q = urhk_TBAF_DispMesg("Record Deleted")
           STDWFS.LIMIT.errCode = "Y"
           GOTO STEP2  
        #}
        ENDIF
        
        IF (STDWFS.LIMIT.Mode == "V") THEN
        #{
           sv_q = urhk_TBAF_DispMesg("Record Verified successfully.Tran Id " +CUST.CCOD.tranId )
           STDWFS.LIMIT.errCode = "Y"
           GOTO STEP2 
        #}
        ENDIF
    #}
    ENDIF
        
    
STEP2:    

    STDWFS.LIMIT.AccountNumber1=""
    STDWFS.LIMIT.AccountName = ""
    STDWFS.LIMIT.CreditAmount1=""
    STDWFS.LIMIT.GSTAmount1 = ""
    STDWFS.LIMIT.AccountNumber2=""
    STDWFS.LIMIT.AccountName2 = ""
    STDWFS.LIMIT.CreditAmount2=""
    STDWFS.LIMIT.GSTAmount2 = ""
    STDWFS.LIMIT.AccountNumber3=""
    STDWFS.LIMIT.AccountName3 = ""
    STDWFS.LIMIT.CreditAmount3=""
    STDWFS.LIMIT.GSTAmount3 = ""
    STDWFS.LIMIT.Remarks=""
    STDWFS.LIMIT.TranType = ""
    STDWFS.LIMIT.DebitAcno=""
    STDWFS.LIMIT.DebitAmount = ""
    STDWFS.LIMIT.NameOfParty=""
    STDWFS.LIMIT.Address = ""
    STDWFS.LIMIT.PAN=""
    STDWFS.LIMIT.GSTN = ""
    STDWFS.LIMIT.MobileNumber=""
    STDWFS.LIMIT.IGST=""
    
    sv_b = urhk_TBAF_SetValue("bafi2020.datablk.field_1|")
    sv_b = urhk_TBAF_SetValue("bafi2020.datablk.field_2|")
    sv_b = urhk_TBAF_SetValue("bafi2020.datablk.field_3|")
    sv_b = urhk_TBAF_SetValue("bafi2020.datablk.field_4|")
    sv_b = urhk_TBAF_SetValue("bafi2020.datablk.field_5|")
    sv_b = urhk_TBAF_SetValue("bafi2020.datablk.field_6|")
    sv_b = urhk_TBAF_SetValue("bafi2020.datablk.field_7|")
    sv_b = urhk_TBAF_SetValue("bafi2020.datablk.field_8|")
    sv_b = urhk_TBAF_SetValue("bafi2020.datablk.field_9|")
    sv_b = urhk_TBAF_SetValue("bafi2020.datablk.field_10|")
    sv_b = urhk_TBAF_SetValue("bafi2020.datablk.field_11|")
    sv_b = urhk_TBAF_SetValue("bafi2020.datablk.field_12|")
    sv_b = urhk_TBAF_SetValue("bafi2020.datablk.field_13|")
    sv_b = urhk_TBAF_SetValue("bafi2020.datablk.field_14|")
    sv_b = urhk_TBAF_SetValue("bafi2020.datablk.field_15|")
    sv_b = urhk_TBAF_SetValue("bafi2020.datablk.field_16|")
    sv_b = urhk_TBAF_SetValue("bafi2020.datablk.field_17|")
    sv_b = urhk_TBAF_SetValue("bafi2020.datablk.field_18|")
    sv_b = urhk_TBAF_SetValue("bafi2020.datablk.field_19|")
    sv_b = urhk_TBAF_SetValue("bafi2020.datablk.field_20|")
    sv_b = urhk_TBAF_SetValue("bafi2020.datablk.field_21|")
    sv_b = urhk_TBAF_SetValue("bafi2020.datablk.field_22|")
    sv_b = urhk_TBAF_SetValue("bafi2020.datablk.field_23|")
    sv_b = urhk_TBAF_SetValue("bafi2020.datablk.field_24|")
    sv_b = urhk_TBAF_SetValue("bafi2020.datablk.field_25|")
    sv_b = urhk_TBAF_SetValue("bafi2020.datablk.field_26|")
    sv_b = urhk_TBAF_SetValue("bafi2020.datablk.field_27|C")
    STDWFS.LIMIT.errCode="Y"
    STDWFS.LIMIT.modchk="Y"

ENDLOOP:

#}
DO


EXITSCRIPT
trace off
end-->
