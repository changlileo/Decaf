header {package decaf;}

options 
{
  mangleLiteralPrefix = "TK_";
  language="Java";
}

class DecafScanner extends Lexer;
options 
{
  k=2;
}

tokens 
{
  "class";
}

LCURLY options { paraphrase = "{"; } : "{";
RCURLY options { paraphrase = "}"; } : "}";

ID options { paraphrase = "an identifier"; } : 
  ('a'..'z' | 'A'..'Z' | '_')('a'..'z' | 'A'..'Z' | '0'..'9' | '_')*;

WS_ : (' ' | '\n' {newline();}) {_ttype = Token.SKIP; };

SL_COMMENT : "//" (~'\n')* '\n' {_ttype = Token.SKIP; newline (); };

CHAR : '\'' (ESC|~('\'' | '\n' | '"' | '\\' | '\t')) '\'';
STRING : '"' (ESC|~'"')* '"';

MINUS : '-';

RESERVED : "if";

INTLITERAL: HEX_PREFIX (ALLOWED_HEX_CHAR)+ |  (DIGIT)+;

protected
ESC :  '\\' ('n'|'"'|'t'|'\\');

protected
DIGIT : '0'..'9';

protected
HEX_PREFIX : "0x";

protected
ALLOWED_HEX_CHAR : ('0'..'9' | 'a'..'f' | 'A'..'F');
