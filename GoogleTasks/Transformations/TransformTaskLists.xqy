xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace goo="http://xmlns.qualogy.com/blog/mnuman/Google/Tasks";
(:: import schema at "../Schemas/GoogleTasksAsJSON.xsd" ::)
declare namespace tsk="http://xmlns.qualogy.com/blog/mnuman/Tasks";

declare variable $googleTaskLists as element() (:: schema-element(goo:TaskLists) ::) external;
declare variable $responseElementName as xs:string external;

declare function local:func($googleTaskLists as element() (:: schema-element(goo:TaskLists) ::), 
                            $responseElementName as xs:string) as element() {
    element {concat('tsk:',$responseElementName)} {                           
      for $tl in $googleTaskLists/goo:items
      return <tsk:TaskList>
               <tsk:ID>{data($tl/goo:id)}</tsk:ID>
               <tsk:Title>{data($tl/goo:title)}</tsk:Title>
               <tsk:LastUpdatedBy>{data($tl/goo:updated)}</tsk:LastUpdatedBy>
             </tsk:TaskList>

    }
};

local:func($googleTaskLists, $responseElementName)
