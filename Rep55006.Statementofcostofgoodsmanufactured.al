report 55006 "Statement of COG Manuf."
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    WordLayout = 'layouts/StateofCOGSManuf.docx';
    DefaultLayout = Word;           
    dataset
    {
        dataitem(ValueEntry; "Value Entry")
        {
            column(BaseRawMaterialInvAmout;BaseRawMaterialInvAmout){}
            column(CurrPeriodRawMaterialPurchAmount;CurrPeriodRawMaterialPurchAmount){}
            column(fromOtherAccountAmount;fromOtherAccountAmount){}
            column(toOtherAccountManufAmount;toOtherAccountManufAmount){}
            column(toOtherAccountAmountEtc;toOtherAccountAmountEtc){}
            column(EndPeriodRawMaterialInvAmount;EndPeriodRawMaterialInvAmount){}
            column(PriorBaseRawMaterialInvAmout;PriorBaseRawMaterialInvAmout){}
            column(PriorCurrPeriodRawMaterialPurchAmount;PriorCurrPeriodRawMaterialPurchAmount){}
            column(PriorfromOtherAccountAmount;PriorfromOtherAccountAmount){}
            column(PriortoOtherAccountManufAmount;PriortoOtherAccountManufAmount){}
            column(PriortoOtherAccountAmountEtc;PriortoOtherAccountAmountEtc){}
            column(PriorEndPeriodRawMaterialInvAmount;PriorEndPeriodRawMaterialInvAmount){}     
            column(CurrRawMaterialTotal;CurrRawMaterialTotal){}
            column(PriorRawMeterialTotal;PriorRawMeterialTotal){}
            column(CurrPeriodText;CurrPeriodText){}
            column(PriorPeriodText;PriorPeriodText){}      
            column(CurrUserID;CurrUserID){}
            column(CompanyName;CompanyName){} 
            trigger OnPreDataItem()
            var
                CompanyInformation: Record "Company Information";
            begin
                SetRange("Entry No.",1);
                CompanyInformation.get();
                CurrUserID := UserId;
                CompanyName := CompanyInformation.Name;
                CurrPeriodText := StrSubstNo('%1 - %2',StartDate,EndDate);
                PriorPeriodText := StrSubstNo('%1 - %2',CalcDate('<-1Y-CM>',StartDate),CalcDate('<-1Y>',EndDate));
                calcCostofGoods(true,StartDate,EndDate);
                calcCostofGoods(false,CalcDate('<-1Y-CM>',StartDate),CalcDate('<-1Y>',EndDate));
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
                    field(StartDate;StartDate)
                    {
                        ApplicationArea = All;
                    }
                    field(EndDate;EndDate)
                    {
                        ApplicationArea = All;
                    }
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

    local procedure calcCostofGoods(isCurrPeriod: Boolean;StartD: Date;EndD: Date)
    var
        ValueEntry: Record "Value Entry";
        FFSetup: Record "FF Setup";
    begin
        FFSetup.Get();

        //1. 기초 원재료 재고액
        ValueEntry.Reset();
        ValueEntry.SetCurrentKey("Item No.", "Posting Date", "Item Ledger Entry Type", "Entry Type", "Variance Type", "Item Charge No.", "Location Code", "Variant Code");
        ValueEntry.SetRange("Posting Date",0D,CalcDate('<-1D>',StartD));
        if FFSetup."Raw Material Inv Posting Grp" <> '' then
            ValueEntry.SetFilter("Inventory Posting Group",'%1',FFSetup."Raw Material Inv Posting Grp");
        if ValueEntry.FindSet() then
        begin
            ValueEntry.CalcSums("Cost Amount (Actual)");
            if isCurrPeriod then
                BaseRawMaterialInvAmout := ValueEntry."Cost Amount (Actual)"
            else
                PriorBaseRawMaterialInvAmout := ValueEntry."Cost Amount (Actual)";
        end;
        //2. 당기 원재료 매입액
        ValueEntry.Reset();
        ValueEntry.SetCurrentKey("Item No.", "Posting Date", "Item Ledger Entry Type", "Entry Type", "Variance Type", "Item Charge No.", "Location Code", "Variant Code");
        ValueEntry.SetRange("Posting Date",StartD,EndD);
        ValueEntry.SetRange("Item Ledger Entry Type",ValueEntry."Item Ledger Entry Type"::Purchase);
        if FFSetup."Raw Material Inv Posting Grp" <> '' then
            ValueEntry.SetFilter("Inventory Posting Group",'%1',FFSetup."Raw Material Inv Posting Grp");
        if ValueEntry.FindSet() then
        begin
            ValueEntry.CalcSums("Cost Amount (Actual)");
            if isCurrPeriod then
                CurrPeriodRawMaterialPurchAmount := ValueEntry."Cost Amount (Actual)"
            else
                PriorCurrPeriodRawMaterialPurchAmount := ValueEntry."Cost Amount (Actual)";
        end;        
        //3. 타계정에서 대체액
        ValueEntry.Reset();
        ValueEntry.SetCurrentKey("Item No.", "Posting Date", "Item Ledger Entry Type", "Entry Type", "Variance Type", "Item Charge No.", "Location Code", "Variant Code");
        ValueEntry.SetRange("Posting Date",StartD,EndD);
        ValueEntry.SetRange("Item Ledger Entry Type",ValueEntry."Item Ledger Entry Type"::"Positive Adjmt.");
        if FFSetup."Raw Material Inv Posting Grp" <> '' then
            ValueEntry.SetFilter("Inventory Posting Group",'%1',FFSetup."Raw Material Inv Posting Grp");
        if ValueEntry.FindSet() then
        begin
            ValueEntry.CalcSums("Cost Amount (Actual)");
            if isCurrPeriod then
                fromOtherAccountAmount := ValueEntry."Cost Amount (Actual)"
            else
                PriorfromOtherAccountAmount := ValueEntry."Cost Amount (Actual)";
        end;      
        //4. 타계정으로 대체액(제조)
        ValueEntry.Reset();
        ValueEntry.SetCurrentKey("Item No.", "Posting Date", "Item Ledger Entry Type", "Entry Type", "Variance Type", "Item Charge No.", "Location Code", "Variant Code");
        ValueEntry.SetRange("Posting Date",StartD,EndD);
        ValueEntry.SetRange("Item Ledger Entry Type",ValueEntry."Item Ledger Entry Type"::Consumption);
        if FFSetup."Raw Material Inv Posting Grp" <> '' then
            ValueEntry.SetFilter("Inventory Posting Group",'%1',FFSetup."Raw Material Inv Posting Grp");
        if ValueEntry.FindSet() then
        begin
            ValueEntry.CalcSums("Cost Amount (Actual)");
            if isCurrPeriod then
                toOtherAccountManufAmount := ValueEntry."Cost Amount (Actual)"*-1
            else
                PriortoOtherAccountManufAmount := ValueEntry."Cost Amount (Actual)"*-1;
        end; 
        //5. 타계정으로 대체액(제조) + 추가
        ValueEntry.Reset();
        ValueEntry.SetCurrentKey("Item No.", "Posting Date", "Item Ledger Entry Type", "Entry Type", "Variance Type", "Item Charge No.", "Location Code", "Variant Code");
        ValueEntry.SetRange("Posting Date",StartD,EndD);
        ValueEntry.SetRange("Item Ledger Entry Type",ValueEntry."Item Ledger Entry Type"::"Negative Adjmt.");
        if FFSetup."Raw Material Inv Posting Grp" <> '' then
            ValueEntry.SetFilter("Inventory Posting Group",'%1',FFSetup."Raw Material Inv Posting Grp");
        if FFSetup."Gen.Bus.Posting Group Etc" <> '' then
            ValueEntry.SetFilter("Gen. Bus. Posting Group",'%1',FFSetup."Gen.Bus.Posting Group Etc");
        if ValueEntry.FindSet() then
        begin
            ValueEntry.CalcSums("Cost Amount (Actual)");
            if isCurrPeriod then
                toOtherAccountManufAmount += ValueEntry."Cost Amount (Actual)"*-1
            else
                PriortoOtherAccountManufAmount += ValueEntry."Cost Amount (Actual)"*-1;
        end;   
        //6. 타계정으로 대체액(기타)
        ValueEntry.Reset();
        ValueEntry.SetCurrentKey("Item No.", "Posting Date", "Item Ledger Entry Type", "Entry Type", "Variance Type", "Item Charge No.", "Location Code", "Variant Code");
        ValueEntry.SetRange("Posting Date",StartD,EndD);
        ValueEntry.SetRange("Item Ledger Entry Type",ValueEntry."Item Ledger Entry Type"::"Negative Adjmt.");
        if FFSetup."Raw Material Inv Posting Grp" <> '' then
            ValueEntry.SetFilter("Inventory Posting Group",'%1',FFSetup."Raw Material Inv Posting Grp");
        if FFSetup."Gen.Bus.Posting Group Etc" <> '' then
            ValueEntry.SetFilter("Gen. Bus. Posting Group",'<>%1',FFSetup."Gen.Bus.Posting Group Etc");
        if ValueEntry.FindSet() then
        begin
            ValueEntry.CalcSums("Cost Amount (Actual)");
            if isCurrPeriod then
                toOtherAccountAmountEtc := ValueEntry."Cost Amount (Actual)"*-1
            else
                PriortoOtherAccountAmountEtc := ValueEntry."Cost Amount (Actual)"*-1;
        end;                                
        //7. 기말 원재료 재고액
        ValueEntry.Reset();
        ValueEntry.SetCurrentKey("Item No.", "Posting Date", "Item Ledger Entry Type", "Entry Type", "Variance Type", "Item Charge No.", "Location Code", "Variant Code");
        ValueEntry.SetRange("Posting Date",0D,EndD);
        if FFSetup."Raw Material Inv Posting Grp" <> '' then
            ValueEntry.SetFilter("Inventory Posting Group",'%1',FFSetup."Raw Material Inv Posting Grp");
        if ValueEntry.FindSet() then
        begin
            ValueEntry.CalcSums("Cost Amount (Actual)");
            if isCurrPeriod then
                EndPeriodRawMaterialInvAmount := ValueEntry."Cost Amount (Actual)"
            else
                PriorEndPeriodRawMaterialInvAmount := ValueEntry."Cost Amount (Actual)";
        end;        

        if isCurrPeriod then
            CurrRawMaterialTotal := toOtherAccountManufAmount
        else
            PriorRawMeterialTotal := PriortoOtherAccountManufAmount;

    end;

    var
        StartDate : Date;
        EndDate: Date;
        BaseRawMaterialInvAmout: Decimal;
        CurrPeriodRawMaterialPurchAmount: Decimal;
        fromOtherAccountAmount: Decimal;
        toOtherAccountManufAmount: Decimal;
        toOtherAccountAmountEtc: Decimal;
        EndPeriodRawMaterialInvAmount: Decimal;
        PriorBaseRawMaterialInvAmout: Decimal;
        PriorCurrPeriodRawMaterialPurchAmount: Decimal;
        PriorfromOtherAccountAmount: Decimal;
        PriortoOtherAccountManufAmount: Decimal;
        PriortoOtherAccountAmountEtc: Decimal;
        PriorEndPeriodRawMaterialInvAmount: Decimal;        
        CurrRawMaterialTotal: Decimal;
        PriorRawMeterialTotal: Decimal;
        CurrPeriodText: Text;
        PriorPeriodText: Text;
        CurrUserID: Text;
        CompanyName: Text;

}
