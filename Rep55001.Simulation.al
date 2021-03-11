report 55001 Simulation
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    WordLayout = 'layouts/Simulation.docx';
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
            column(CompanyInformation; CompanyInformation.Name)
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
            column(TotalCount; TotalCount)
            { }
            column(TotalBld; TotalBld)
            { }
            column(executionTime; executionTime)
            { }
            dataitem("Production BOM Line"; "Production BOM Line")
            {
                DataItemLink = "Production BOM No." = FIELD("No.");
                DataItemTableView = SORTING("Production BOM No.", "Version Code", "Line No.");
                DataItemLinkReference = ProductionBOMHeader;
                column(Line_No_; "Line No.")
                {

                }
                column(Production_BOM_No_; "Production BOM No.")
                {

                }
                column(No_; "No.")
                {

                }
                column(LineDescription; Description)
                {

                }
                column(Maxing_Ratio; "Maxing Ratio")
                {

                }
                column(Necessary_Qty; "Necessary Qty")
                {

                }
                column(Inventory_Qty; "Inventory Qty")
                {

                }
                column(CountRec; CountRec)
                {

                }
                column(UnitCost; UnitCost)
                {

                }
                trigger OnAfterGetRecord()
                begin
                    Clear(UnitCost);
                    Item.Reset();
                    Item.SetRange("No.", "No.");
                    if Item.FindSet() then begin
                        UnitCost := Item."Forward Cost";
                    end;
                    CountRec += 1;
                    TotalCount += 1;
                    TotalBld += "Necessary Qty";
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
        CompanyInformation.Reset();
        CompanyInformation.FindSet();
        Clear(TotalCount);
        Clear(TotalBld);
        executionTime := Format(CurrentDateTime, 0, '<Year4>-<Month,2>-<Day,2> <Hours12,2>:<Minutes,2>:<Seconds,2>');
    end;

    var
        CompanyInformation: Record "Company Information";
        Item: Record Item;
        CountRec: Integer;
        UnitCost: Decimal;
        TotalCount: Integer;
        TotalBld: Decimal;
        executionTime: Text;
}
