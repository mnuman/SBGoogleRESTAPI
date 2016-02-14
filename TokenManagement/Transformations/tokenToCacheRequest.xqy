xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace goo="http://www.qualogy.com/blog/mnuman/RESTOAuth";
(:: import schema at "../Schemas/GoogleAuthorization.xsd" ::)
declare namespace qoa="http://xmlns.qualogy.com/blog/mnuman/OAuth";
(:: import schema at "../Schemas/Authorization.xsd" ::)

declare variable $tokenResponse as element() (:: schema-element(goo:OAuthTokenResponse) ::) external;

declare function local:func($tokenResponse as element() (:: schema-element(goo:OAuthTokenResponse) ::)) as element() (:: schema-element(qoa:CacheToken) ::) {
    <qoa:CacheToken>
        <qoa:AccessToken>{fn:data($tokenResponse/goo:access_token)}</qoa:AccessToken>
        <qoa:RefreshToken>{fn:data($tokenResponse/goo:refresh_token)}</qoa:RefreshToken>
        <qoa:ExpiresAfter>{fn:current-dateTime()+xs:dayTimeDuration(concat("PT",data($tokenResponse/goo:expires_in),"S")) }</qoa:ExpiresAfter>
    </qoa:CacheToken>
};
local:func($tokenResponse)
