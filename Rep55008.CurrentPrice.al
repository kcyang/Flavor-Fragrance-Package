report 55008 "Current Price"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    WordLayout = 'layouts/CurrentPrice.docx';
    DefaultLayout = Word;
    dataset
    {
        dataitem(ProductionBOMHeader; "Production BOM Header")
        {
            column(No; "No.")
            {
            }
            column(Description; Description)
            {
            }
            column(RequestProdOrderQty; "Request Prod. Order Qty")
            {
            }
            column(Application; Application)
            {
            }
            column(Note; Note)
            {
            }
            column(CompoundType; CompoundType)
            {
            }
            column(totalbld; totalbld)
            { }
            column(companyName; companyinformation.Name) { }
            column(currDateTime; currDateTime) { }
            column(TotalReqQty; TotalReqQty) { }
            column(TotalCnt; TotalCnt) { }
            dataitem(QCLine; "Production BOM Line")
            {
                DataItemLink = "Production BOM No." = FIELD("No.");
                DataItemTableView = SORTING("Production BOM No.", "Version Code", "Line No.");
                DataItemLinkReference = ProductionBOMHeader;
                column(Line_No_; "Line No.")
                { }
                column(No_; "No.")
                { }
                column(MaterialName; Description)
                { }
                column(Maxing_Ratio; "Maxing Ratio")
                { }
                column(Necessary_Qty; "Necessary Qty")
                { }
                column(CurrencyCode; CurrencyCode)
                { }
                column(ExchangeRate; ExchangeRate)
                { }
                column(unitcost; unitcost)
                { }
                column(cnt; cnt)
                { }
                column(extCost; extCost) { }

                trigger OnAfterGetRecord()
                var
                    Item: Record Item;
                    FFSetup: Record "FF Setup";
                begin
                    Clear(unitcost);
                    Clear(extCost);
                    cnt += 1;

                    totalbld += QCLine."Maxing Ratio";
                    Item.Reset();
                    Item.SetRange("No.", "Production BOM No.");
                    if item.Find('-') then begin
                        unitcost := Item."Unit Cost";
                        extCost := unitcost * Quantity;
                    end;
                    TotalReqQty += QCLine."Maxing Ratio";
                    TotalExtQty += extCost;
                    TotalCnt += 1;
                end;
            }
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
    trigger OnInitReport()
    begin
        Clear(totalbld);
        Clear(cnt);
        Clear(TotalCnt);
        Clear(TotalReqQty);
        Clear(TotalExtQty);
        CompanyInformation.Get();
        currDay := Format(CurrentDateTime, 0, '<Year4>-<Month,2>-<Day,2>');
        currTime := Format(CurrentDateTime, 0, '<Hours12,2>:<Minutes,2>:<Seconds,2>');
        currDateTime := currDay + ' ' + currTime;
    end;

    var
        totalbld: Decimal;
        unitcost: Decimal;
        extCost: Decimal;
        TotalReqQty: Decimal;
        TotalExtCost: Decimal;
        TotalExtQty: Decimal;
        TotalCnt: Integer;
        CompanyInformation: Record "Company Information";
        FFSetup: Record "FF Setup";
        cnt: Integer;
        currDay: Text;
        currTime: Text;
        currDateTime: Text;
}
