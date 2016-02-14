xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace goo="http://www.qualogy.com/blog/mnuman/RESTOAuth";
(:: import schema at "../Schemas/GoogleAuthorization.xsd" ::)

import module namespace xqu="http://xmlns.qualogy.com/blog/mnuman/OAuth/xquery" at "OAuth20GenericCode.xqy";

declare variable $refreshToken as xs:string external;

declare function local:func($refreshToken as xs:string) as element() (:: schema-element(goo:OAuthRefreshTokenRequest) ::) {
    <goo:OAuthRefreshTokenRequest>
        <goo:client_id>{xqu:client_id()}</goo:client_id>
        <goo:client_secret>{xqu:client_secret()}</goo:client_secret>
        <goo:grant_type>{xqu:grant_refresh()}</goo:grant_type>
        <goo:refresh_token>{fn:data($refreshToken)}</goo:refresh_token>
    </goo:OAuthRefreshTokenRequest>
};

local:func($refreshToken)
