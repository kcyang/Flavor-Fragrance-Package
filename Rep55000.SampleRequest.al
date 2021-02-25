report 55000 "Sample Request"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    WordLayout = 'layouts/SampleRequest.docx';
    DefaultLayout = Word;

    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            column(SalesPersonName; SalesPersonName)
            {

            }
            column(Sell_to_Customer_Name; "Sell-to Customer Name")
            {

            }
            column(Sell_to_Contact; "Sell-to Contact")
            {

            }
            column(RequiredDateText;RequiredDateText)
            {

            }
            column(DocumentDateText; DocumentDateText)
            {

            }
            column(ShipmentMethodText; ShipmentMethodText)
            {

            }
            column(CompanyInfo; CompanyInfo.Picture)
            {

            }
            column(SampleComment;SampleComment)
            {

            }
            dataitem("Sales Line"; "Sales Line")
            {
                DataItemTableView = SORTING("Document Type", "Document No.", "Line No.") ORDER(Ascending);
                DataItemLinkReference = "Sales Header";
                DataItemLink = "Document Type" = FIELD("Document Type"), "Document No." = FIELD("No.");
                column(Line_No_; "Line No.")
                {

                }
                column(Unit_Cost__LCY_; "Unit Cost (LCY)")
                {

                }
                column(Line_Amount; "Line Amount")
                {

                }
                column(ApplicationDescrption; ApplicationDescrption)
                {

                }
                column(DirectionDescription; DirectionDescription)
                {

                }
                column(Quantity; Quantity)
                {

                }
                column(Unit_of_Measure_Code; "Unit of Measure Code")
                {

                }
                trigger OnAfterGetRecord()
                var
                    FFCODE: Record "FF Code";
                begin
                    if "Sales Line".Application <> '' then begin
                        FFCODE.Reset();
                        FFCODE.SetRange(Type, FFCODE.Type::Application);
                        FFCODE.SetRange(Code, "Sales Line".Application);
                        if FFCODE.Find('-') then
                            ApplicationDescrption := FFCODE.Description;
                    end;
                    if "Sales Line".Direction <> '' then begin
                        FFCODE.Reset();
                        FFCODE.SetRange(Type, FFCODE.Type::Direction);
                        FFCODE.SetRange(Code, "Sales Line".Direction);
                        if FFCODE.Find('-') then
                            DirectionDescription := FFCODE.Description;
                    end;
                end;
            }
            trigger OnAfterGetRecord()
            var
                SalesPerson: Record "Salesperson/Purchaser";
                ShipmentMethod: Record "Shipment Method";
                SalesComment: Record "Sales Comment Line";
                
                CRLF: Text [2];
            begin
                DocumentDateText := Format("Sales Header"."Document Date", 0, '<Year4>-<Month,2>-<Day,2>');
                RequiredDateText := Format("Sales Header"."Requested Delivery Date", 0, '<Year4>-<Month,2>-<Day,2>');
                IF "Sales Header"."Salesperson Code" <> '' then begin
                    if SalesPerson.Get("Sales Header"."Salesperson Code") then
                        SalesPersonName := SalesPerson.Name
                    else
                        SalesPersonName := '';
                end;
                if "Sales Header"."Shipment Method Code" <> '' then begin
                    if ShipmentMethod.Get("Sales Header"."Shipment Method Code") then
                        ShipmentMethodText := ShipmentMethod.Description
                    else
                        ShipmentMethodText := '';
                end;
                if CompanyInfo.get() then
                    CompanyInfo.CalcFields(Picture);
                
                SalesComment.Reset();
                SalesComment.SetRange("Document Type",SalesComment."Document Type"::"Sample Request");
                SalesComment.SetRange("No.","Sales Header"."No.");
                if SalesComment.FindSet() then
                begin
                    CRLF := '';
                    CRLF[1] := 13;
                    CRLF[2] := 10;
                    repeat
                        SampleComment += SalesComment.Comment;
                        SampleComment += CRLF;
                    until SalesComment.Next() = 0;
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
        ApplicationDescrption: Text;
        DirectionDescription: Text;
        SalesPersonName: Text;
        DocumentDateText: Text;
        ShipmentMethodText: Text;
        SampleComment: Text;
        RequiredDateText: Text;
        CompanyInfo: Record "Company Information";
}
