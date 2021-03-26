page 55033 "Sales Line Simulation "
{
    
    Caption = 'Sales Line Simulation ';
    PageType = Document;
    SourceTable = "Sales Line";
    PromotedActionCategories = 'New,Process,Report';
    Editable = false;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                }
            }
            part(BOMLines; "Sales Line Simulation Subform")
            {
                Editable = false;
                ApplicationArea = All;
                SubPageLink = "Production BOM No." = FIELD("No.");
                UpdatePropagation = Both;
            }     
        }
    }

    actions
    {
        area(Processing)
        {
            action("Pla&nning")
            {
                ApplicationArea = Planning;
                CaptionML = ENU='Pla&nning',KOR='Pla&nning';
                Image = Planning;
                ToolTip = 'Open a tool for manual supply planning that displays all new demand along with availability information and suggestions for supply. It provides the visibility and tools needed to plan for demand from sales lines and component lines and then create different types of supply orders directly.';

                trigger OnAction()
                var
                    SalesPlanForm: Page "Sales Order Planning";
                begin
                    SalesPlanForm.SetSalesOrder(Rec."Document No.");
                    SalesPlanForm.RunModal;
                end;
            }
            action("Create &Warehouse Shipment")
            {
                AccessByPermission = TableData "Warehouse Shipment Header" = R;
                ApplicationArea = Warehouse;
                CaptionML = ENU='Create &Warehouse Shipment',KOR='출고 생성';
                Image = NewShipment;
                ToolTip = 'Create a warehouse shipment to start a pick a ship process according to an advanced warehouse configuration.';

                trigger OnAction()
                var
                    GetSourceDocOutbound: Codeunit "Get Source Doc. Outbound";
                    SalesHeader: Record "Sales Header";
                begin
                    SalesHeader.Reset();
                    SalesHeader.SetRange("No.",Rec."Document No.");
                    if SalesHeader.Find('-') then
                        GetSourceDocOutbound.CreateFromSalesOrder(SalesHeader);
/*
                    if not Find('=><') then
                        Init;
*/                        
                end;
            }            

        }
    }
}
