/// <summary>
/// QC 사양의 상태값을 정의합니다.
/// </summary>
enum 55004 "Quality Control Specification Status"
{
    Extensible = true;
    
    value(0; New)
    {
        Caption = 'New';
    }
    value(1; Develop)
    {
        Caption = 'Develop';
    }
    value(2; Certified)
    {
        Caption = 'Certified';
    }
    
}
