<--start
trace on

#======================================================================
# Basic configuration
#======================================================================

    sv_b=cint(INTBAF.INTBAFC.TbafEventStep)
    print (sv_b)

    sv_z = REPEXISTS("CUST")
    IF (sv_z == 0) THEN
        CREATEREP("CUST")
    ENDIF

    sv_d = CLASSEXISTS("CUST", "GLBDATA")
    IF (sv_d == 0) THEN
        CREATECLASS("CUST", "GLBDATA", 5)
    ENDIF

    CUST.GLBDATA.Sol_id=""
    CUST.GLBDATA.scand_flg="N"

    IF(sv_b==0)THEN
        GOTO STEP0
    ENDIF

    IF(sv_b==1)THEN
        GOTO STEP1
    ENDIF

    IF(sv_b==2)THEN
        GOTO STEP2
    ENDIF

STEP0:

    #======================================================================
    # Identifying field name and data from which F2 is fired
    #======================================================================

        sv_r = CLASSEXISTS("CUST", "LIMIT")
        IF (sv_r == 0) THEN
            CREATECLASS("CUST", "LIMIT", 5)
        ENDIF

        sv_a = urhk_TBAF_GetCurFldName("")
        sv_a = B2KTEMP.TEMPSTD.TBAFRESULT
        print (sv_a)
        sv_d = sv_a

        sv_b = GETPOSITION(sv_a, '.')
        print (sv_b)
        sv_c = STRLEN(sv_a)
        print (sv_c)
        sv_a = MID$(sv_a, sv_b, sv_c-sv_b)
        print (sv_a)

        CUST.LIMIT.CurFieldName = sv_a
        sv_b = GETPOSITION(sv_a, '.')
        sv_c = STRLEN(sv_a)
        sv_a = MID$(sv_a, sv_b, sv_c-sv_b)

        CUST.LIMIT.field_num=sv_a
        sv_a = urhk_TBAF_InquireFieldValue(CUST.LIMIT.CurFieldName)
        CUST.LIMIT.CurFieldVal= trim(B2KTEMP.TEMPSTD.TBAFRESULT)
        print(CUST.LIMIT.field_num)

        CUST.LIMIT.BODDATE=left$(BANCS.STDIN.BODDate,10)
        print(CUST.LIMIT.BODDATE)
        
    #======================================================================
    # Displaying Referance number  
    #======================================================================

    IF (CUST.LIMIT.field_num == "field_2") THEN
    #{
        sv_a = urhk_TBAF_InquireFieldValue("datablk.field_1")
        CUST.LIMIT.Field1=trim(B2KTEMP.TEMPSTD.TBAFRESULT)
        print(CUST.LIMIT.Field1)

        sv_a = urhk_TBAF_InquireFieldValue("datablk.field_2")
        CUST.LIMIT.Field2=trim(B2KTEMP.TEMPSTD.TBAFRESULT)
        print(CUST.LIMIT.Field2)

        IF (CUST.LIMIT.Field1 == "") THEN
        #{
            sv_u = urhk_TBAF_DispMesg("Enter Mode")
            BANCS.OUTPUT.successOrFailure = "F"
            exitscript
        #}
        ENDIF
            
        IF ((CUST.LIMIT.Field1 == "M") OR (CUST.LIMIT.Field1 == "D") OR (CUST.LIMIT.Field1 == "V") OR (CUST.LIMIT.Field1 == "I")) THEN
        #{
            sv_r = urhk_b2k_printrepos("BANCS")
            STDWFS.LIMIT.solid = BANCS.STDIN.mySolId
            print(STDWFS.LIMIT.solid)

            sv_a = urhk_TBAF_InquireFieldValue("datablk.field_2")
            sv_a=trim(B2KTEMP.TEMPSTD.TBAFRESULT)
            sv_c = STRLEN(sv_a)

            sv_k="bafl0001.datablk.select_clause|"
            sv_k=sv_k+"CONCAT(RPAD(SLNO,18),RPAD(CR_ACNO_1,16))"
            print (sv_k)
            sv_a = urhk_TBAF_SetValue(sv_k)
            sv_a = urhk_TBAF_SetValue("bafl0001.datablk.from_clause|C_COCR_TRAN_MASTER")
            print(sv_a)    
            
            IF (CUST.LIMIT.Field1 == "I") THEN
            #{
                sv_b = "SOLID='"+ STDWFS.LIMIT.solid +"' AND DUSERID IS NULL"
            #}
            ELSE
            #{
                sv_b = "SOLID='"+ STDWFS.LIMIT.solid +"' AND DUSERID IS NULL AND VUSERID IS NULL"
            #}
            ENDIF
            sv_a = "bafl0001.datablk.where_clause_1|" + sv_b
            sv_a = urhk_TBAF_SetValue(sv_a)
            sv_a = "bafl0001.datablk.where_clause_2|"
            sv_a = urhk_TBAF_SetValue(sv_a)
            sv_a = "bafl0001.datablk.where_clause_3|"
            sv_a = urhk_TBAF_SetValue(sv_a)
            sv_a = urhk_TBAF_SetValue("bafl0001.datablk.column_header|Referance Number  A/c Num   ")
            sv_a = urhk_TBAF_SetValue("bafl0001.datablk.header_subtitle|          LIST OF REFERANCE NUMBERS")
            sv_a = urhk_TBAF_SetReplayKey("bafl0001.datablk.key-f2")
            sv_a = urhk_TBAF_SetKeyScript("bafl0001.listblk.key-listval|gctm_shiftf4.scr|0")

            CUST.LIMIT.sel_field_length   =   "90"
            CUST.LIMIT.selValue = " "
            sv_a = urhk_B2K_ShowParamAcptFrm("bafl0001")

            sv_a = CUST.LIMIT.selValue
            sv_i = CINT(CUST.LIMIT.sel_field_length)
            print(sv_a)
            sv_e = trim(MID$(sv_a,0,15))
            print (sv_e)
            sv_f = trim(MID$(sv_a,18,16))
            print (sv_f)
                                        
            sv_c = "datablk.field_2|" + sv_e
            sv_r = urhk_TBAF_ChangeFieldValue(sv_c)
            sv_c = "datablk.field_3|" + sv_f
            sv_r = urhk_TBAF_ChangeFieldValue(sv_c)            

            BANCS.OUTPUT.successOrFailure = "F"
            exitscript
        #}
        ENDIF
    #}
    ENDIF

    #======================================================================
    # Pickup Code - REF No - End
    #======================================================================
    
    #==============================================================================================
    # Pickup Code - Start >> Displaying List if the key is pressed from CO Acnumber (field_3)
    #==============================================================================================

    IF (CUST.LIMIT.field_num == "field_3") THEN
    #{
        sv_a = urhk_TBAF_InquireFieldValue("datablk.field_1")
        CUST.LIMIT.Field1=trim(B2KTEMP.TEMPSTD.TBAFRESULT)
        print(CUST.LIMIT.Field1)

        sv_a = urhk_TBAF_InquireFieldValue("datablk.field_3")
        CUST.LIMIT.Field3=trim(B2KTEMP.TEMPSTD.TBAFRESULT)
        print(CUST.LIMIT.Field3)

        IF (CUST.LIMIT.Field1 == "") THEN
        #{
            sv_u = urhk_TBAF_DispMesg("Enter Mode")
            BANCS.OUTPUT.successOrFailure = "F"
            exitscript
        #}
        ENDIF

        IF ((CUST.LIMIT.Field1 == "A")OR (CUST.LIMIT.Field1 == "M")) THEN
        #{
            sv_r = urhk_b2k_printrepos("BANCS")
            STDWFS.LIMIT.solid = BANCS.STDIN.mySolId
            print(STDWFS.LIMIT.solid)
            
            sv_k="bafl0001.datablk.select_clause|"
            sv_k=sv_k+"CONCAT(RPAD(FORACID,16),RPAD(UPPER(ACCT_NAME),25))"
            print (sv_k)
            sv_a = urhk_TBAF_SetValue(sv_k)
            sv_a = urhk_TBAF_SetValue("bafl0001.datablk.from_clause|GAM")
            print(sv_a)
            sv_b = " SOL_ID ='"+ STDWFS.LIMIT.solid +"' AND GL_SUB_HEAD_CODE IN ('31010') AND ACCT_CRNCY_CODE='INR' AND BACID IN (SELECT CODE_DESCRIPTION FROM C_REFCODE WHERE MAIN_CODE=4002 AND DEL_FLAG='N')AND UPPER(ACCT_NAME) LIKE '%"+CUST.LIMIT.Field3+"%'"
            sv_a = "bafl0001.datablk.where_clause_1|" + sv_b
            sv_a = urhk_TBAF_SetValue(sv_a)
            sv_a = "bafl0001.datablk.where_clause_2|"
            sv_a = urhk_TBAF_SetValue(sv_a)
            sv_a = "bafl0001.datablk.where_clause_3|"
            sv_a = urhk_TBAF_SetValue(sv_a)
                            
            sv_a = urhk_TBAF_SetValue("bafl0001.datablk.column_header|Account number   Discription        ")
            sv_a = urhk_TBAF_SetValue("bafl0001.datablk.header_subtitle|          LIST OF CO Accounts")
            sv_a = urhk_TBAF_SetReplayKey("bafl0001.datablk.key-f2")
            sv_a = urhk_TBAF_SetKeyScript("bafl0001.listblk.key-listval|gctm_shiftf4.scr|0")

            CUST.LIMIT.sel_field_length   =   "90"
            CUST.LIMIT.selValue = " "
            sv_a = urhk_B2K_ShowParamAcptFrm("bafl0001")

            sv_a = CUST.LIMIT.selValue
            sv_i = CINT(CUST.LIMIT.sel_field_length)
            print(sv_a)
            IF (trim(sv_a) != "")THEN
            #{
                sv_e = trim(MID$(sv_a,0,16))
                print (sv_e)
                                
                sv_c = "datablk.field_3|" + sv_e
                sv_r = urhk_TBAF_ChangeFieldValue(sv_c)              
            #}
            ENDIF
            BANCS.OUTPUT.successOrFailure = "F"
            exitscript
        #}
        ENDIF
    #}
    ENDIF

    #======================================================================
    # Pickup Code - End
    #======================================================================
    
    #==============================================================================================
    # Pickup Code - Start >> Displaying List if the key is pressed from CO Acnumber 2 (field_7)
    #==============================================================================================

    IF (CUST.LIMIT.field_num == "field_7") THEN
    #{
        sv_a = urhk_TBAF_InquireFieldValue("datablk.field_1")
        CUST.LIMIT.Field1=trim(B2KTEMP.TEMPSTD.TBAFRESULT)
        print(CUST.LIMIT.Field1)

        sv_a = urhk_TBAF_InquireFieldValue("datablk.field_7")
        CUST.LIMIT.Field7=trim(B2KTEMP.TEMPSTD.TBAFRESULT)
        print(CUST.LIMIT.Field7)

        IF (CUST.LIMIT.Field1 == "") THEN
        #{
            sv_u = urhk_TBAF_DispMesg("Enter Mode")
            BANCS.OUTPUT.successOrFailure = "F"
            exitscript
        #}
        ENDIF

        IF ((CUST.LIMIT.Field1 == "A")OR (CUST.LIMIT.Field1 == "M")) THEN
        #{
            sv_r = urhk_b2k_printrepos("BANCS")
            STDWFS.LIMIT.solid = BANCS.STDIN.mySolId
            print(STDWFS.LIMIT.solid)
            
            sv_k="bafl0001.datablk.select_clause|"
            sv_k=sv_k+"CONCAT(RPAD(FORACID,16),RPAD(UPPER(ACCT_NAME),25))"
            print (sv_k)
            sv_a = urhk_TBAF_SetValue(sv_k)
            sv_a = urhk_TBAF_SetValue("bafl0001.datablk.from_clause|GAM")
            print(sv_a)
            sv_b = " SOL_ID ='"+ STDWFS.LIMIT.solid +"' AND GL_SUB_HEAD_CODE IN ('31010') AND ACCT_CRNCY_CODE='INR' AND BACID IN (SELECT CODE_DESCRIPTION FROM C_REFCODE WHERE MAIN_CODE=4002 AND DEL_FLAG='N')AND UPPER(ACCT_NAME) LIKE '%"+CUST.LIMIT.Field7+"%'"
            sv_a = "bafl0001.datablk.where_clause_1|" + sv_b
            sv_a = urhk_TBAF_SetValue(sv_a)
            sv_a = "bafl0001.datablk.where_clause_2|"
            sv_a = urhk_TBAF_SetValue(sv_a)
            sv_a = "bafl0001.datablk.where_clause_3|"
            sv_a = urhk_TBAF_SetValue(sv_a)
                            
            sv_a = urhk_TBAF_SetValue("bafl0001.datablk.column_header|Account number   Discription        ")
            sv_a = urhk_TBAF_SetValue("bafl0001.datablk.header_subtitle|          LIST OF CO Accounts")
            sv_a = urhk_TBAF_SetReplayKey("bafl0001.datablk.key-f2")
            sv_a = urhk_TBAF_SetKeyScript("bafl0001.listblk.key-listval|gctm_shiftf4.scr|0")

            CUST.LIMIT.sel_field_length   =   "90"
            CUST.LIMIT.selValue = " "
            sv_a = urhk_B2K_ShowParamAcptFrm("bafl0001")

            sv_a = CUST.LIMIT.selValue
            sv_i = CINT(CUST.LIMIT.sel_field_length)
            print(sv_a)
            IF (trim(sv_a) != "")THEN
            #{
                sv_e = trim(MID$(sv_a,0,16))
                print (sv_e)
                                
                sv_c = "datablk.field_7|" + sv_e
                sv_r = urhk_TBAF_ChangeFieldValue(sv_c)              
            #}
            ENDIF
            BANCS.OUTPUT.successOrFailure = "F"
            exitscript
        #}
        ENDIF
    #}
    ENDIF

    #======================================================================
    # Pickup Code - End
    #======================================================================
    
    #==============================================================================================
    # Pickup Code - Start >> Displaying List if the key is pressed from CO Acnumber (field_11)
    #==============================================================================================

    IF (CUST.LIMIT.field_num == "field_11") THEN
    #{
        sv_a = urhk_TBAF_InquireFieldValue("datablk.field_1")
        CUST.LIMIT.Field1=trim(B2KTEMP.TEMPSTD.TBAFRESULT)
        print(CUST.LIMIT.Field1)

        sv_a = urhk_TBAF_InquireFieldValue("datablk.field_11")
        CUST.LIMIT.Field11=trim(B2KTEMP.TEMPSTD.TBAFRESULT)
        print(CUST.LIMIT.Field11)

        IF (CUST.LIMIT.Field1 == "") THEN
        #{
            sv_u = urhk_TBAF_DispMesg("Enter Mode")
            BANCS.OUTPUT.successOrFailure = "F"
            exitscript
        #}
        ENDIF

        IF ((CUST.LIMIT.Field1 == "A")OR (CUST.LIMIT.Field1 == "M")) THEN
        #{
            sv_r = urhk_b2k_printrepos("BANCS")
            STDWFS.LIMIT.solid = BANCS.STDIN.mySolId
            print(STDWFS.LIMIT.solid)
            
            sv_k="bafl0001.datablk.select_clause|"
            sv_k=sv_k+"CONCAT(RPAD(FORACID,16),RPAD(UPPER(ACCT_NAME),25))"
            print (sv_k)
            sv_a = urhk_TBAF_SetValue(sv_k)
            sv_a = urhk_TBAF_SetValue("bafl0001.datablk.from_clause|GAM")
            print(sv_a)
            sv_b = " SOL_ID ='"+ STDWFS.LIMIT.solid +"' AND GL_SUB_HEAD_CODE IN ('31010') AND ACCT_CRNCY_CODE='INR' AND BACID IN (SELECT CODE_DESCRIPTION FROM C_REFCODE WHERE MAIN_CODE=4002 AND DEL_FLAG='N')AND UPPER(ACCT_NAME) LIKE '%"+CUST.LIMIT.Field11+"%'"
            sv_a = "bafl0001.datablk.where_clause_1|" + sv_b
            sv_a = urhk_TBAF_SetValue(sv_a)
            sv_a = "bafl0001.datablk.where_clause_2|"
            sv_a = urhk_TBAF_SetValue(sv_a)
            sv_a = "bafl0001.datablk.where_clause_3|"
            sv_a = urhk_TBAF_SetValue(sv_a)
                            
            sv_a = urhk_TBAF_SetValue("bafl0001.datablk.column_header|Account number   Discription        ")
            sv_a = urhk_TBAF_SetValue("bafl0001.datablk.header_subtitle|          LIST OF CO Accounts")
            sv_a = urhk_TBAF_SetReplayKey("bafl0001.datablk.key-f2")
            sv_a = urhk_TBAF_SetKeyScript("bafl0001.listblk.key-listval|gctm_shiftf4.scr|0")

            CUST.LIMIT.sel_field_length   =   "90"
            CUST.LIMIT.selValue = " "
            sv_a = urhk_B2K_ShowParamAcptFrm("bafl0001")

            sv_a = CUST.LIMIT.selValue
            sv_i = CINT(CUST.LIMIT.sel_field_length)
            print(sv_a)
            IF (trim(sv_a) != "")THEN
            #{
                sv_e = trim(MID$(sv_a,0,16))
                print (sv_e)
                                
                sv_c = "datablk.field_11|" + sv_e
                sv_r = urhk_TBAF_ChangeFieldValue(sv_c)              
            #}
            ENDIF
            BANCS.OUTPUT.successOrFailure = "F"
            exitscript
        #}
        ENDIF
    #}
    ENDIF

    #======================================================================
    # Pickup Code - End
    #======================================================================

exitscript

STEP1:

        sv_z = urhk_TBAF_GetCurFldName("")
        sv_a = B2KTEMP.TEMPSTD.TBAFRESULT
        print(sv_a)

        IF (sv_a=="bafi2020.datablk.field_1") THEN
        #{
            sv_u = urhk_TBAF_DispMesg("Valid options are : A-Add; M-Modify; I-Inquiry; D-Delete; V-Verify")
            BANCS.OUTPUT.successOrFailure = "F"
            exitscript
        #}
        ENDIF
        
        IF (sv_a=="bafi2020.datablk.field_2") THEN
        #{
            sv_u = urhk_TBAF_DispMesg("Enter Reference Number. Press F2 for help.")
            BANCS.OUTPUT.successOrFailure = "F"
            exitscript
        #}
        ENDIF
        
        IF (sv_a=="bafi2020.datablk.field_3") THEN
        #{
            sv_u = urhk_TBAF_DispMesg("Enter CO Account Number 1. Press F2 for help.")
            BANCS.OUTPUT.successOrFailure = "F"
            exitscript
        #}
        ENDIF   
        
        IF (sv_a=="bafi2020.datablk.field_5") THEN
        #{
            sv_u = urhk_TBAF_DispMesg("Enter Credit Amount 1.")
            BANCS.OUTPUT.successOrFailure = "F"
            exitscript
        #}
        ENDIF                
        
        IF (sv_a=="bafi2020.datablk.field_7") THEN
        #{
            sv_u = urhk_TBAF_DispMesg("Enter CO Account Number 2. Press F2 for help.")
            BANCS.OUTPUT.successOrFailure = "F"
            exitscript
        #}
        ENDIF
        
        
        IF (sv_a=="bafi2020.datablk.field_9") THEN
        #{
            sv_u = urhk_TBAF_DispMesg("Enter Credit Amount 2.")
            BANCS.OUTPUT.successOrFailure = "F"
            exitscript
        #}
        ENDIF
        
        IF (sv_a=="bafi2020.datablk.field_11") THEN
        #{
            sv_u = urhk_TBAF_DispMesg("Enter CO Account Number 3. Press F2 for help.")
            BANCS.OUTPUT.successOrFailure = "F"
            exitscript
        #}
        ENDIF
        
        IF (sv_a=="bafi2020.datablk.field_13") THEN
        #{
            sv_u = urhk_TBAF_DispMesg("Enter Credit Amount 3.")
            BANCS.OUTPUT.successOrFailure = "F"
            exitscript
        #}
        ENDIF
        
        IF (sv_a=="bafi2020.datablk.field_15") THEN
        #{
            sv_u = urhk_TBAF_DispMesg("Enter Remarks.")
            BANCS.OUTPUT.successOrFailure = "F"
            exitscript
        #}
        ENDIF
        
        IF (sv_a=="bafi2020.datablk.field_18") THEN
        #{
            sv_u = urhk_TBAF_DispMesg("Enter Transacion mode. C-Cash; T-Transfer")
            BANCS.OUTPUT.successOrFailure = "F"
            exitscript
        #}
        ENDIF
                            
        IF (sv_a=="bafi2020.datablk.field_19") THEN
        #{
            sv_u = urhk_TBAF_DispMesg("Enter Debit A/c No for transaction mode T. Press F2 for help")
            BANCS.OUTPUT.successOrFailure = "F"
            exitscript
        #}
        ENDIF   
        
        
        IF (sv_a=="bafi2020.datablk.field_21") THEN
        #{
            sv_u = urhk_TBAF_DispMesg("Enter Name of party.")
            BANCS.OUTPUT.successOrFailure = "F"
            exitscript
        #}
        ENDIF   
        
        IF (sv_a=="bafi2020.datablk.field_22") THEN
        #{
            sv_u = urhk_TBAF_DispMesg("Enter Address.")
            BANCS.OUTPUT.successOrFailure = "F"
            exitscript
        #}
        ENDIF
        
        IF (sv_a=="bafi2020.datablk.field_23") THEN
        #{
            sv_u = urhk_TBAF_DispMesg("Enter PAN.")
            BANCS.OUTPUT.successOrFailure = "F"
            exitscript
        #}
        ENDIF   
        
        IF (sv_a=="bafi2020.datablk.field_24") THEN
        #{
            sv_u = urhk_TBAF_DispMesg("Enter GSTN Number.")
            BANCS.OUTPUT.successOrFailure = "F"
            exitscript
        #}
        ENDIF
        
        IF (sv_a=="bafi2020.datablk.field_25") THEN
        #{
            sv_u = urhk_TBAF_DispMesg("Enter Mobile Number.")
            BANCS.OUTPUT.successOrFailure = "F"
            exitscript
        #}
        ENDIF       
        
        IF (sv_a=="bafi2020.datablk.field_16") THEN
        #{
            sv_u = urhk_TBAF_DispMesg("Enter Submit. Y-Yes; N-No")
            BANCS.OUTPUT.successOrFailure = "F"
            exitscript
        #}
        ENDIF        

exitscript

#trace off
end-->
