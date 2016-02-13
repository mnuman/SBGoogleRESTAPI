xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace goo="http://www.qualogy.com/blog/mnuman/RESTOAuth";
(:: import schema at "../Schemas/GoogleAuthorization.xsd" ::)
declare namespace qoa="http://xmlns.qualogy.com/blog/mnuman/OAuth";
(:: import schema at "../Schemas/Authorization.xsd" ::)

import module namespace xqu="http://xmlns.qualogy.com/blog/mnuman/OAuth/xquery" at "OAuth20GenericCode.xqy";

declare variable $authRequest as element() (:: schema-element(qoa:RedeemAuthorizationTokenRequest) ::) external;

declare function local:func($authRequest as element() (:: schema-element(qoa:RedeemAuthorizationTokenRequest) ::)) as element() (:: schema-element(goo:OAuthRedeemAuthorizationCodeRequest) ::) {
    <goo:OAuthRedeemAuthorizationCodeRequest>
        <goo:code>{fn:data($authRequest/qoa:AuthorizationCode)}</goo:code>
        <goo:client_id>{xqu:client_id()}</goo:client_id>
        <goo:client_secret>{xqu:client_secret()}</goo:client_secret>
        <goo:redirect_uri>{xqu:redirect_uri()}</goo:redirect_uri>
        <goo:grant_type>{xqu:grant_redeem()}</goo:grant_type>
    </goo:OAuthRedeemAuthorizationCodeRequest>
};

local:func($authRequest)
