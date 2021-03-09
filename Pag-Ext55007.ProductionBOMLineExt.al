pageextension 55007 "Production BOM Line Ext." extends "Production BOM Lines"
{
    layout
    {
        addafter("No.")
        {
            field(KENo;KENo)
            {
                ApplicationArea = All;
            }
            field(ShowColor;ShowColor)
            {
                ApplicationArea = All;
            }
            field(Note;Note)
            {
                ApplicationArea = All;
            }
        }
        addafter("Unit of Measure Code")
        {
            field("Maxing Ratio";"Maxing Ratio")
            {
                ApplicationArea = All;
            }
            field("Manufacturer Code";"Manufacturer Code")
            {
                ApplicationArea = All;
            }
        }
        addlast(content)
        {
            field(ForwardCost;ForwardCost)
            {
                ApplicationArea = All;
            }
        }
    }

    trigger OnAfterGetRecord()
    var
        Item: Record Item;
        Comment: Record "Comment Line";
    begin
        Clear(Item);
        Clear(Comment);
        Clear(KENo);
        Clear(ShowColor);
        Clear(Note);
        Clear(ForwardCost);

        Item.Reset();
        Item.SetRange("No.",Rec."No.");

        if Item.Find('-') then
        begin
            KENo := Item."KE-NO";
            ForwardCost := Item."Forward Cost";
            if Item.LineColor then
                ShowColor := '■';
            
            Comment.Reset();
            Comment.SetRange("Table Name",Comment."Table Name"::Item);
            Comment.SetRange("No.",Item."No.");
            if Comment.FindSet() then
            begin             
                repeat
                    Note += Comment.Comment;
                    Note += ' /';
                until Comment.Next() = 0;
            end;
        end;


            

    end;

    var

        KENo: Code[20];
        ShowColor: Text;
        Note: Text;
        ForwardCost: Decimal;
}
