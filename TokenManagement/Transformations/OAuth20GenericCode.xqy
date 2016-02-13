xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

module namespace xqoa="http://xmlns.qualogy.com/blog/mnuman/OAuth/xquery";

declare function xqoa:client_id() as xs:string {
    "T.B.D."
};

declare function xqoa:client_secret() as xs:string {
    "T.B.D."
};

declare function xqoa:grant_redeem() as xs:string {
    "authorization_code"
};

declare function xqoa:grant_refresh() as xs:string {
    "refresh_token"
};

declare function xqoa:redirect_uri() as xs:string {
    "urn:ietf:wg:oauth:2.0:oob"
};


