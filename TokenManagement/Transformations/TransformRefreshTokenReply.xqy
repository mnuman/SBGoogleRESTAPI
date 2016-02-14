xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace goo="http://www.qualogy.com/blog/mnuman/RESTOAuth";
(:: import schema at "../Schemas/GoogleAuthorization.xsd" ::)
declare namespace qoa="http://xmlns.qualogy.com/blog/mnuman/OAuth";
(:: import schema at "../Schemas/Authorization.xsd" ::)

declare variable $refreshTokenResponse as element() (:: schema-element(goo:OAuthTokenResponse) ::) external;

declare function local:func($refreshTokenResponse as element() (:: schema-element(goo:OAuthTokenResponse) ::)) as element() (:: schema-element(qoa:RefreshAccessTokenResponse) ::) {
    <qoa:RefreshAccessTokenResponse>
        <qoa:AccessToken>{fn:data($refreshTokenResponse/goo:access_token)}</qoa:AccessToken>
    </qoa:RefreshAccessTokenResponse>
};

local:func($refreshTokenResponse)
