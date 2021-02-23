pageextension 55001 "Posted Sales Invoice Sub. Ext." extends "Posted Sales Invoice Subform"
{
    layout
    {
        addlast(Control1)
        {
            field("Blanket Order No.";"Blanket Order No.")
            {
                CaptionML = ENU='Sample/Blanket Order No.',KOR='샘플요청/일괄주문서 번호';
                ApplicationArea = all;
                Lookup = false;
            }
            field("Blanket Order Line No.";"Blanket Order Line No.")
            {
                CaptionML = ENU='Sample/Blanket Order Line No.',KOR='샘플요청/일괄주문서 라인번호';
                ApplicationArea = all;
                Lookup = false;
            }
        }
    }

}
