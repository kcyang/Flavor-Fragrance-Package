report 55002 "Import Cost Statement"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    WordLayout = 'layouts/ImportCostStatement.docx';
    DefaultLayout = Word;
    dataset
    {
        dataitem(BillofLanding; "Bill of Landing")
        {
            column(BLNo; "BL No.")
            {
            }
            column(VendorNo; "Vendor No.")
            {
            }
            column(VendorName; "Vendor Name")
            {
            }
            column(BLDate; "BL Date")
            {
            }
            column(ShipDate; "Ship Date")
            {
            }
            column(ImportReferenceNo; "Import Reference No.")
            {
            }
            column(AmountLCY; "Amount (LCY)")
            {
            }
            column(ImportReferenceDate; "Import Reference Date")
            {
            }
            column(ImportRefefenceRemark; "Import Refefence Remark")
            {
            }
            column(Status; Status)
            {
            }
            column(ArrayofItemCharge1;ArrayofDescription[1])
            {}
            column(ArrayofItemCharge2;ArrayofDescription[2])
            {}
            column(ArrayofItemCharge3;ArrayofDescription[3])
            {}
            column(ArrayofItemCharge4;ArrayofDescription[4])
            {}
            column(ArrayofItemCharge5;ArrayofDescription[5])
            {}
            column(ArrayofItemCharge6;ArrayofDescription[6])
            {}
            column(ArrayofItemCharge7;ArrayofDescription[7])
            {}
            column(ArrayofItemCharge8;ArrayofDescription[8])
            {}
            column(ArrayofItemCharge9;ArrayofDescription[9])
            {}
            column(ArrayofItemCharge10;ArrayofDescription[10])
            {}
            column(ArrayofItemCharge11;ArrayofDescription[11])
            {}
            column(ArrayofItemCharge12;ArrayofDescription[12])
            {}
            column(ArrayofItemCharge13;ArrayofDescription[13])
            {}
            column(ArrayofItemCharge14;ArrayofDescription[14])
            {}
            column(ArrayofItemCharge15;ArrayofDescription[15])
            {}
            column(ArrayofItemCharge16;ArrayofDescription[16])
            {}
            column(ArrayofItemCharge17;ArrayofDescription[17])
            {}
            column(ArrayofItemCharge18;ArrayofDescription[18])
            {}
            column(ArrayofItemCharge19;ArrayofDescription[19])
            {}
            column(ArrayofItemCharge20;ArrayofDescription[20])
            {}
            column(ArrayofItemChargeAmount1;DocMgt.BlankZero(ArrayofItemChargeAmount[1])){}
            column(ArrayofItemChargeAmount2;DocMgt.BlankZero(ArrayofItemChargeAmount[2])){}
            column(ArrayofItemChargeAmount3;DocMgt.BlankZero(ArrayofItemChargeAmount[3])){}
            column(ArrayofItemChargeAmount4;DocMgt.BlankZero(ArrayofItemChargeAmount[4])){}
            column(ArrayofItemChargeAmount5;DocMgt.BlankZero(ArrayofItemChargeAmount[5])){}
            column(ArrayofItemChargeAmount6;DocMgt.BlankZero(ArrayofItemChargeAmount[6])){}
            column(ArrayofItemChargeAmount7;DocMgt.BlankZero(ArrayofItemChargeAmount[7])){}
            column(ArrayofItemChargeAmount8;DocMgt.BlankZero(ArrayofItemChargeAmount[8])){}
            column(ArrayofItemChargeAmount9;DocMgt.BlankZero(ArrayofItemChargeAmount[9])){}
            column(ArrayofItemChargeAmount10;DocMgt.BlankZero(ArrayofItemChargeAmount[10])){}
            column(ArrayofItemChargeAmount11;DocMgt.BlankZero(ArrayofItemChargeAmount[11])){}
            column(ArrayofItemChargeAmount12;DocMgt.BlankZero(ArrayofItemChargeAmount[12])){}
            column(ArrayofItemChargeAmount13;DocMgt.BlankZero(ArrayofItemChargeAmount[13])){}
            column(ArrayofItemChargeAmount14;DocMgt.BlankZero(ArrayofItemChargeAmount[14])){}
            column(ArrayofItemChargeAmount15;DocMgt.BlankZero(ArrayofItemChargeAmount[15])){}
            column(ArrayofItemChargeAmount16;DocMgt.BlankZero(ArrayofItemChargeAmount[16])){}
            column(ArrayofItemChargeAmount17;DocMgt.BlankZero(ArrayofItemChargeAmount[17])){}
            column(ArrayofItemChargeAmount18;DocMgt.BlankZero(ArrayofItemChargeAmount[18])){}
            column(ArrayofItemChargeAmount19;DocMgt.BlankZero(ArrayofItemChargeAmount[19])){}
            column(ArrayofItemChargeAmount20;DocMgt.BlankZero(ArrayofItemChargeAmount[20])){}
            column(ArrayofRate1;DocMgt.BlankZero(ArrayofRate[1])){}
            column(ArrayofRate2;DocMgt.BlankZero(ArrayofRate[2])){}
            column(ArrayofRate3;DocMgt.BlankZero(ArrayofRate[3])){}
            column(ArrayofRate4;DocMgt.BlankZero(ArrayofRate[4])){}
            column(ArrayofRate5;DocMgt.BlankZero(ArrayofRate[5])){}
            column(ArrayofRate6;DocMgt.BlankZero(ArrayofRate[6])){}
            column(ArrayofRate7;DocMgt.BlankZero(ArrayofRate[7])){}
            column(ArrayofRate8;DocMgt.BlankZero(ArrayofRate[8])){}
            column(ArrayofRate9;DocMgt.BlankZero(ArrayofRate[9])){}
            column(ArrayofRate10;DocMgt.BlankZero(ArrayofRate[10])){}
            column(ArrayofRate11;DocMgt.BlankZero(ArrayofRate[11])){}
            column(ArrayofRate12;DocMgt.BlankZero(ArrayofRate[12])){}
            column(ArrayofRate13;DocMgt.BlankZero(ArrayofRate[13])){}
            column(ArrayofRate14;DocMgt.BlankZero(ArrayofRate[14])){}
            column(ArrayofRate15;DocMgt.BlankZero(ArrayofRate[15])){}
            column(ArrayofRate16;DocMgt.BlankZero(ArrayofRate[16])){}
            column(ArrayofRate17;DocMgt.BlankZero(ArrayofRate[17])){}
            column(ArrayofRate18;DocMgt.BlankZero(ArrayofRate[18])){}
            column(ArrayofRate19;DocMgt.BlankZero(ArrayofRate[19])){}
            column(ArrayofRate20;DocMgt.BlankZero(ArrayofRate[20])){}            
            column(PurchAmt;PurchAmt){}
            column(PurchChargeAmt;PurchChargeAmt){}
            column(CurrencyCode;CurrencyCode){}
            column(CurrencyExchRate;CurrencyExchRate){}
            column(AmountFCY;AmountFCY){}

            trigger OnAfterGetRecord()
            var
                ItemLedgerEntry: Record "Item Ledger Entry";
                ValueEntry: Record "Value Entry";
                PurchRcptHeader: Record "Purch. Rcpt. Header";
                VendorLedger: Record "Vendor Ledger Entry";
                ArrayCount: Integer;
                ForCount: Integer;
                
            begin
                Clear(PurchAmt);
                Clear(PurchChargeAmt);
                Clear(CurrencyCode);
                Clear(CurrencyExchRate);
                Clear(AmountFCY);
                Clear(ArrayofItemCharge);
                Clear(ArrayofItemChargeAmount);
                Clear(ArrayofRate);
                Clear(ItemCharge);
                Clear(ArrayofDescription);

                ItemCharge.Reset();
                for ForCount := 1 to 20 do
                begin
                    ArrayofItemCharge[ForCount] := '';
                    ArrayofItemChargeAmount[ForCount] := 0;
                    ArrayofDescription[ForCount] := '';
                end;
                if ItemCharge.FindSet() then
                begin
                    ArrayCount := 0;
                    repeat
                        ArrayCount += 1;
                        ArrayofItemCharge[ArrayCount] := ItemCharge."No.";
                        ArrayofDescription[ArrayCount] := ItemCharge.Description;
                    until ItemCharge.Next() = 0;
                end;
                //BL 번호에 해당하는 입고문서를 찾음.
                PurchRcptHeader.Reset();
                PurchRcptHeader.SetCurrentKey("BL No.");
                PurchRcptHeader.SetRange("BL No.","BL No.");
                //BL에 해당하는 입고문서는 여러개가 있을 수 있음.
                if PurchRcptHeader.FindSet() then
                begin
                    repeat
                        //RcptHeader 문서에 해당하는 Item Ledger 를 찾음. (원가를 찾아낼 대상임.)
                        ItemLedgerEntry.Reset();
                        ItemLedgerEntry.SetCurrentKey("Document No.", "Document Type", "Document Line No.");
                        ItemLedgerEntry.SetRange("Document No.",PurchRcptHeader."No.");
                        
                        if ItemLedgerEntry.FindSet() then
                        begin
                            repeat
                                //Item ledger 에 맞는 Value Entry 를 찾아서,
                                ValueEntry.Reset();
                                ValueEntry.SetCurrentKey("Item Ledger Entry No.", "Entry Type");
                                ValueEntry.SetRange("Item Ledger Entry No.",ItemLedgerEntry."Entry No.");
                                ValueEntry.SetRange("Entry Type",ValueEntry."Entry Type"::"Direct Cost"); //FIXME 이거만 넣는게 맞을까?
                                if ValueEntry.FindSet() then
                                begin
                                    repeat
                                        //Item Charge 가 아닌 것은, PurchAmt >> 상품금액에,
                                        if ValueEntry."Item Charge No." = '' then
                                        begin
                                            PurchAmt += ValueEntry."Cost Amount (Actual)";
                                            VendorLedger.Reset();
                                            VendorLedger.SetRange("Document No.",ValueEntry."Document No.");
                                            VendorLedger.SetFilter("Currency Code",'<>%1','');
                                            if VendorLedger.Find('-') then
                                            begin
                                                VendorLedger.CalcFields("Original Amount");
                                                AmountFCY := VendorLedger."Original Amount"*-1;
                                                CurrencyCode := VendorLedger."Currency Code";
                                                if VendorLedger."Original Currency Factor" <> 0 then
                                                    CurrencyExchRate := 1/VendorLedger."Original Currency Factor"
                                                else
                                                    CurrencyExchRate := 1;
                                            end;
                                        end else 
                                        //Item Charge 가 있는 것은, Charge Amount 에 입력함.
                                        begin
                                            PurchChargeAmt += ValueEntry."Cost Amount (Actual)";

                                            for ForCount := 1 to Arraylen(ArrayofItemCharge) do
                                            begin
                                                if ArrayofItemCharge[ForCount] = ValueEntry."Item Charge No." then
                                                    ArrayofItemChargeAmount[ForCount] += ValueEntry."Cost Amount (Actual)";
                                            end;
                                        end;
                                    until ValueEntry.Next() = 0;
                                end;
                            until ItemLedgerEntry.Next() = 0;
                        end;
                    until PurchRcptHeader.Next() = 0;
                end;
                if PurchAmt <> 0 then
                begin
                    for ForCount := 1 to ArrayLen(ArrayofItemCharge) do
                    begin
                        ArrayofRate[ForCount] := Round((ArrayofItemChargeAmount[ForCount] / PurchAmt)*100,0.01);
                    end;
                end;
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }

    var
        PurchAmt: Decimal;
        PurchChargeAmt: Decimal;
        CurrencyCode: Code [10];
        CurrencyExchRate: Decimal;
        AmountFCY: Decimal;
        
        ArrayofItemCharge: array[20] of Code[20];
        ArrayofItemChargeAmount: array[20] of Decimal;
        ArrayofRate: array[20] of Decimal;
        ItemCharge: Record "Item Charge";
        ArrayofDescription: array[20] of Text;
        DocMgt: Codeunit "FF Package Functions";
}
