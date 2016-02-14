xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

module namespace xqoa="http://xmlns.qualogy.com/blog/mnuman/OAuth/xquery";

(: Returns the Google ClientId, identifying your project requesting access to
   the user's account
 :)
declare function xqoa:client_id() as xs:string {
    "742609092201-0n2p8njsihi7qn9q7j9tg7b2qcnm91cv.apps.googleusercontent.com"
};

(: Presents your secret code to the Google Authentication Server :)
declare function xqoa:client_secret() as xs:string {
    "Du529cJAqqwD-1U4cI_qb9H0"
};

declare function xqoa:grant_redeem() as xs:string {
    "authorization_code"
};

declare function xqoa:grant_refresh() as xs:string {
    "refresh_token"
};

(: Declares how to return the code -- see Google documentation :)
declare function xqoa:redirect_uri() as xs:string {
    "urn:ietf:wg:oauth:2.0:oob"
};


