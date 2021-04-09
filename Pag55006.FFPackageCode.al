page 55006 "FF Package Code"
{
    DelayedInsert = true;
    Caption = 'FF Package Code';
    PageType = List;
    SourceTable = "FF Code";
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                }
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field(Image;Rec.Image)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(ImportPicture)
            {
                ApplicationArea = All;
                Caption = '이미지등록하기';
                Image = Import;
                ToolTip = '이미지파일 올리기';

                trigger OnAction()
                var
                    FileManagement: Codeunit "File Management";
                    FileName: Text;
                    ClientFileName: Text;
                begin
                    Rec.TestField("Code");
                    if (Rec.Type = Rec.Type::Application) OR (Rec.Type = Rec.Type::Direction) then
                        Error('유형이 GHS/MSDS Pics 인 경우에만 이미지를 등록할 수 있습니다.');
                    if Rec.Description = '' then
                        Error('설명을 꼭 입력하세요.');

                    if Rec.Image.HasValue then
                        if not Confirm('기존에 있는 이미지를 덮어씌웁니다.\진행하시겠습니까?') then
                            exit;

                    FileName := FileManagement.UploadFile('업로드할 사진을 선택하세요.', ClientFileName);
                    if FileName = '' then
                        exit;

                    Clear(Rec.Image);
                    Rec.Image.ImportFile(FileName, ClientFileName);
                    if not Rec.Modify(true) then
                        Rec.Insert(true);

                    if FileManagement.DeleteServerFile(FileName) then;
                end;
            }    
            action(DeletePicture)
            {
                ApplicationArea = All;
                Caption = '이미지 삭제';
                Image = Delete;
                ToolTip = 'Delete the record.';

                trigger OnAction()
                begin
                    if not Rec.Image.HasValue then
                        Error('삭제할 이미지가 존재하지 않습니다.');
                        
                    if not Confirm('이미지를 지우시겠습니까?') then
                        exit;

                    Clear(Rec.Image);
                    Rec.Modify(true);
                end;
            }                    
        }
    }
    
}
