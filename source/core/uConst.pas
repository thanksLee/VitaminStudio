unit uConst;

interface
uses SynTokenMatch, SynHighlighterSQL;


CONST
   {-- Initial Const --}
   WORDIC_DB     = 'worddic.db';
   LOGSDIR       = 'logs';
   CONFIGDIR     = 'config';
   DBDIR         = 'database';
   DATADIR       = 'data';

   CONFIGFILENM  = 'vitaminstudio.ini';
   VITAMIN_SQL_FILE  = 'vitamin_sql.ini';

   ORACLE = 'ORACLE';
   SQLITE = 'SQLITE';
   FIREBIRD = 'FIREBIRD';

   VERSION = '1.0.0.0';

   {-- Source Match --}
   SQLTokens : array[0..5] of TSynTokenMatch=(
    (OpenToken: '('; CloseToken: ')'; TokenKind: Integer(SynHighlighterSQL.tkSymbol)),
    (OpenToken: '['; CloseToken: ']'; TokenKind: Integer(SynHighlighterSQL.tkSymbol)),
    (OpenToken: '{'; CloseToken: '}'; TokenKind: Integer(SynHighlighterSQL.tkSymbol)),
    (OpenToken: '<'; CloseToken: '>'; TokenKind: Integer(SynHighlighterSQL.tkSymbol)),
    (OpenToken: ''''; CloseToken: ''''; TokenKind: Integer(SynHighlighterSQL.tkSymbol)),
    (OpenToken: '"'; CloseToken: '"'; TokenKind: Integer(SynHighlighterSQL.tkSymbol))
    );

   {-- 동적으로 생성되 Component Name --}
   LogTabNm              = 'LogTab_';

   C1 = 52845;     // 기준키1
   C2 = 22719;     // 기준키2
   MY_KEY = 12345; // 사용자키
implementation

end.
