report 55007 "Current Simulation - Price"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    WordLayout = 'layouts/CurrentSimulationPrice.docx';
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
            column(Expenses; Expenses)
            {
            }
            column(USD; USD)
            {
            }
            column(CHF; CHF)
            {
            }
            column(EUR; EUR)
            {
            }
            column(CNY; CNY)
            {
            }
            column(JPY; JPY)
            {
            }
            column(totalbld;totalbld)
            {}
            column(companyName;companyinformation.Name){}
            column(currDateTime;currDateTime){}
            column(TotalExtCost;TotalExtCost){}
            column(TotalReqQty;TotalReqQty){}
            column(TotalCnt;TotalCnt){}
            dataitem(QCLine;"Production BOM Line")
            {
                DataItemLink = "Production BOM No."=FIELD("No.");
                DataItemTableView = SORTING("Production BOM No.","Version Code","Line No.");
                DataItemLinkReference = ProductionBOMHeader;
                column(Line_No_;"Line No.")
                {}
                column(No_;"No.")
                {}
                column(MaterialName;Description)
                {}
                column(Maxing_Ratio;"Maxing Ratio")
                {}
                column(Necessary_Qty;"Necessary Qty")
                {}
                column(CurrencyCode;CurrencyCode)
                {}
                column(ExchangeRate;ExchangeRate)
                {}
                column(unitcost;unitcost)
                {}
                column(cnt;cnt)
                {}
                column(extCost;extCost){}

                trigger OnAfterGetRecord()
                var
                    Item : Record Item;
                    FFSetup : Record "FF Setup";
                    InvPosingGrp : Text;
                begin
                    Clear(unitcost);
                    Clear(extCost);
                    cnt += 1;

                    totalbld += QCLine."Maxing Ratio";
                    Item.Reset();
                    Item.SetRange("No.","Production BOM No.");
                    if item.Find('-') then
                    begin
                        if CurrencyCode <> '' then
                        begin
                            if TariffRate <> 0 then
                                unitcost := FCY * ExchangeRate * (1+TariffRate/100) * FFSetup.SimulationRates
                            else
                                unitcost := FCY * ExchangeRate * FFSetup.SimulationRates;
                        end else 
                        begin
                            InvPosingGrp := '';
                            InvPosingGrp := Item."Inventory Posting Group";
                            if InvPosingGrp.Contains(FFSetup."Production Inv Posting Grp") then
                                unitcost := Item."Forward Cost" //FIXME 연동 또는, 완제품에 대한 Cost.
                            else
                                unitcost := Item."Forward Cost";
                        end;
                        extCost := (unitcost / totalbld) * QCLine."Maxing Ratio";
                    end;
                    TotalReqQty += QCLine."Maxing Ratio";
                    TotalExtCost += extCost;
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
        Clear(TotalExtCost);
        Clear(TotalReqQty);
        CompanyInformation.Get();
        FFSetup.Get();
        if FFSetup.SimulationRates = 0 then
            Error('FF 설정에서, Simulation 용비율값을 설정하지 않았습니다. 먼저 설정한 후 진행하세요.!');
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
        TotalCnt: Integer;
        CompanyInformation: Record "Company Information";
        FFSetup : Record "FF Setup";
        cnt: Integer;
        currDay: Text;
        currTime: Text;
        currDateTime: Text;

}
