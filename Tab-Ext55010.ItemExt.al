tableextension 55010 "Item Ext." extends Item
{
    fields
    {
        field(55000; "Forward Cost"; Decimal)
        {
            CaptionML = ENU='Forward Cost',KOR='Forward Cost';
            DataClassification = ToBeClassified;
        }
        field(55001; OdorDesc; Text[250])
        {
            CaptionML = ENU='Odor Desc.',KOR='향취설명서';
            DataClassification = ToBeClassified;
        }
        field(55002; ApplyName; Text[250])
        {
            CaptionML = ENU='Apply Name',KOR='적용제품명';
            DataClassification = ToBeClassified;
        }
        field(55003; Type2; Text[80])
        {
            CaptionML = ENU='Type 2',KOR='Type 2';
            DataClassification = ToBeClassified;
        }
        field(55004; Remark; Text[90])
        {
            CaptionML = ENU='Remark',KOR='비고';
            DataClassification = ToBeClassified;
        }
        field(55005; "Revision Material to Item"; Code[20])
        {
            CaptionML = ENU='Revision Material to Item',KOR='보정처리대상 소모품목';
            DataClassification = ToBeClassified;
        }
        field(55006; "KE-NO"; Code[20])
        {
            CaptionML = ENU='KE-NO',KOR='KE-NO';
            DataClassification = ToBeClassified;
        }
        field(55007; UCSMachine; Boolean)
        {
            CaptionML = ENU='UCS Machine',KOR='UCS 기계';
            DataClassification = ToBeClassified;
        }
        field(55008; GHSMSDS; Boolean)
        {
            CaptionML = ENU='GHSMSDS',KOR='GHSMSDS';
            DataClassification = ToBeClassified;
        }
        field(55009; Spec; Boolean)
        {
            CaptionML = ENU='Spec',KOR='Spec';
            DataClassification = ToBeClassified;
        }
        field(55010; Origin; Boolean)
        {
            CaptionML = ENU='Origin',KOR='Origin';
            DataClassification = ToBeClassified;
        }
        field(55011; FuroCoumarin; Boolean)
        {
            CaptionML = ENU='FuroCoumarin',KOR='FuroCoumarin';
            DataClassification = ToBeClassified;
        }
        field(55012; Allergen; Boolean)
        {
            CaptionML = ENU='Allergen',KOR='Allergen';
            DataClassification = ToBeClassified;
        }
        field(55013; Ecocert; Boolean)
        {
            CaptionML = ENU='Ecocert',KOR='Ecocert';
            DataClassification = ToBeClassified;
        }
        field(55014; LineColor; Boolean)
        {
            CaptionML = ENU='LineColor',KOR='열색지정';
            DataClassification = ToBeClassified;
        }
        field(55100; "Quality Specifications"; Boolean)
        {
            CaptionML = ENU='Quality Specifications',KOR='QC사양보유';
            DataClassification = ToBeClassified;
        }
        field(55900; Usage;Integer)
        {
            CaptionML= ENU='Usage Count',KOR='사용횟수';
            FieldClass = FlowField;
            CalcFormula = Count("Item Ledger Entry" WHERE ("Item No."=FIELD("No."),"Entry Type"=CONST(Consumption)));
        }
        field(55901; "Usage Qty.";Decimal)
        {
            CaptionML = ENU='Usage Qty.',KOR='사용량';
            FieldClass = FlowField;
            CalcFormula = Sum("Item Ledger Entry".Quantity WHERE ("Item No."=FIELD("No."),"Entry Type"=CONST(Consumption)));
        }
    }
}
