xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare variable $operation as xs:string external;

declare function local:func($operation as xs:string) {
<validate xmlns="http://www.bea.com/wli/sb/context">
      <schema>TokenManagement/Schemas/Authorization</schema>
      <schemaElement>
         <namespaceURI>http://xmlns.qualogy.com/blog/mnuman/OAuth</namespaceURI>      
         <localname>{ if ($operation = 'RedeemAuthorizationCode')
                      then 'RedeemAuthorizationTokenRequest'
                      else 'TokenRequest'
                    }
        </localname>
     </schemaElement>
</validate>
};

local:func($operation)
